'use client';

import { useState, useEffect } from 'react';
import { useParams } from 'next/navigation';
import Link from 'next/link';
import DOMPurify from 'dompurify';

function transformTablesForMobile(html) {
  if (typeof window === 'undefined' || !html) return html;
  const parser = new DOMParser();
  const doc = parser.parseFromString(html, 'text/html');
  const tables = doc.querySelectorAll('table');

  tables.forEach((table) => {
    const headers = Array.from(table.querySelectorAll('thead th')).map((th) => th.textContent.trim());
    if (headers.length === 0) return;

    const rows = Array.from(table.querySelectorAll('tbody tr'));
    const cardsHtml = rows.map((row) => {
      const cells = Array.from(row.querySelectorAll('td'));
      const pairs = cells.map((td, i) => {
        const label = headers[i] || '';
        return `<div class="table-card-row"><span class="table-card-label">${label}</span><span class="table-card-value">${td.innerHTML}</span></div>`;
      }).join('');
      return `<div class="table-card">${pairs}</div>`;
    }).join('');

    const wrapper = doc.createElement('div');
    wrapper.className = 'table-cards-grid';
    wrapper.innerHTML = cardsHtml;
    table.replaceWith(wrapper);
  });

  return doc.body.innerHTML;
}

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

const headers = {
  apikey: SUPABASE_KEY,
  Authorization: `Bearer ${SUPABASE_KEY}`,
  'Content-Type': 'application/json',
};

export default function BloquePage() {
  const { slug } = useParams();

  const [bloque, setBloque] = useState(null);
  const [nodos, setNodos] = useState([]);
  const [allBloques, setAllBloques] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [activeNodo, setActiveNodo] = useState(null);
  const [tocOpen, setTocOpen] = useState(false);
  const [isMobile, setIsMobile] = useState(false);
  const [isTablet, setIsTablet] = useState(false);

  // Detect viewport size
  useEffect(() => {
    const mqlMobile = window.matchMedia('(max-width: 768px)');
    const mqlTablet = window.matchMedia('(min-width: 769px) and (max-width: 1024px)');
    setIsMobile(mqlMobile.matches);
    setIsTablet(mqlTablet.matches);
    const handlerMobile = (e) => setIsMobile(e.matches);
    const handlerTablet = (e) => setIsTablet(e.matches);
    mqlMobile.addEventListener('change', handlerMobile);
    mqlTablet.addEventListener('change', handlerTablet);
    return () => {
      mqlMobile.removeEventListener('change', handlerMobile);
      mqlTablet.removeEventListener('change', handlerTablet);
    };
  }, []);

  useEffect(() => {
    if (!slug) return;

    async function fetchData() {
      try {
        setLoading(true);

        // Fetch bloque + all bloques in parallel
        const [bloqueRes, allBloquesRes] = await Promise.all([
          fetch(`${SUPABASE_URL}/rest/v1/bloques?slug=eq.${slug}&select=*`, { headers }),
          fetch(`${SUPABASE_URL}/rest/v1/bloques?estado=eq.publicado&select=slug,titulo,orden&order=orden.asc`, { headers }),
        ]);

        const bloqueData = await bloqueRes.json();
        const allBloquesData = await allBloquesRes.json();
        setAllBloques(Array.isArray(allBloquesData) ? allBloquesData : []);

        if (!bloqueData || bloqueData.length === 0) {
          setError('No se encontró este bloque.');
          setLoading(false);
          return;
        }

        const currentBloque = bloqueData[0];
        setBloque(currentBloque);

        // Fetch nodos
        const nodosRes = await fetch(
          `${SUPABASE_URL}/rest/v1/nodos?bloque_id=eq.${currentBloque.id}&select=*&order=orden_en_bloque.asc`,
          { headers }
        );

        const nodosData = await nodosRes.json();
        setNodos(Array.isArray(nodosData) ? nodosData : []);
      } catch (err) {
        setError('Error cargando el contenido.');
        console.error(err);
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, [slug]);

  // Intersection observer for active nodo tracking
  useEffect(() => {
    if (nodos.length === 0) return;
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setActiveNodo(entry.target.id);
          }
        });
      },
      { rootMargin: '-80px 0px -60% 0px', threshold: 0 }
    );
    nodos.forEach((n) => {
      const el = document.getElementById(n.slug);
      if (el) observer.observe(el);
    });
    return () => observer.disconnect();
  }, [nodos]);

  const colors = {
    bg: '#1A1A1A',
    text: '#F7F4EF',
    accent: '#C5E832',
    lavanda: '#A8B4D8',
    muted: 'rgba(247,244,239,0.45)',
    cardBg: 'rgba(247,244,239,0.05)',
    border: 'rgba(247,244,239,0.1)',
  };

  // Prev/next bloque
  const bloqueIdx = allBloques.findIndex((b) => b.slug === slug);
  const prevBloque = bloqueIdx > 0 ? allBloques[bloqueIdx - 1] : null;
  const nextBloque = bloqueIdx < allBloques.length - 1 ? allBloques[bloqueIdx + 1] : null;

  if (loading) {
    return (
      <div style={{ minHeight: '100vh', background: colors.bg, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
        <div style={{ width: 36, height: 36, border: '3px solid rgba(197,232,50,0.15)', borderTop: '3px solid #C5E832', borderRadius: '50%', animation: 'spin 0.9s cubic-bezier(0.4,0,0.6,1) infinite', margin: '60px auto' }} />
      </div>
    );
  }

  if (error || !bloque) {
    return (
      <div style={{ minHeight: '100vh', background: colors.bg, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', gap: '16px' }}>
        <p style={{ color: colors.text, fontSize: '16px' }}>{error || 'Bloque no encontrado.'}</p>
        <Link href="/biblioteca" style={{ color: colors.accent, fontSize: '14px', textDecoration: 'none' }}>← Volver a la Biblioteca</Link>
      </div>
    );
  }

  return (
    <div style={{ minHeight: '100vh', background: colors.bg, color: colors.text, paddingBottom: '80px' }}>

      {/* Grid layout: sidebar (desktop) + main content */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: isMobile ? '1fr' : isTablet ? '200px 1fr' : '240px 1fr',
        gap: '0',
        width: '100%',
        margin: '0',
        padding: '0',
        alignItems: 'start',
      }}>

        {/* Left column: sticky sidebar (desktop only) */}
        {!isMobile && nodos.length > 0 && (
          <aside className="indice-sidebar" style={{
            position: 'sticky',
            top: '60px',
            alignSelf: 'start',
            overflowY: 'auto',
            maxHeight: 'calc(100vh - 70px)',
            padding: '8px 24px 48px 24px',
            borderRight: '1px solid rgba(255,255,255,0.06)',
            gridColumn: '1',
          }}>
            <p style={{
              fontSize: '10px', fontWeight: 700, letterSpacing: '0.14em',
              textTransform: 'uppercase', color: colors.lavanda,
              marginBottom: '16px', paddingTop: '0',
            }}>
              Índice
            </p>
            <nav style={{ display: 'flex', flexDirection: 'column' }}>
              {nodos.map((nodo) => (
                <a
                  key={nodo.id}
                  href={`#${nodo.slug}`}
                  className={`indice-item${activeNodo === nodo.slug ? ' activo' : ''}`}
                  onClick={(e) => {
                    e.preventDefault();
                    document.getElementById(nodo.slug)?.scrollIntoView({ behavior: 'smooth' });
                  }}
                >
                  {nodo.titulo}
                </a>
              ))}
            </nav>

            {/* Material complementario */}
            <div style={{ marginTop: '24px', paddingTop: '16px', borderTop: `1px solid ${colors.border}` }}>
              <p style={{
                fontSize: '10px', fontWeight: 700, letterSpacing: '0.14em',
                textTransform: 'uppercase', color: colors.lavanda,
                marginBottom: '12px',
              }}>
                Material
              </p>
              <nav style={{ display: 'flex', flexDirection: 'column' }}>
                <Link href={`/biblioteca/${slug}/material#videos`} className="indice-item">
                  Videos
                </Link>
                <Link href={`/biblioteca/${slug}/material#quiz`} className="indice-item">
                  Quiz
                </Link>
              </nav>
            </div>
          </aside>
        )}

        {/* Column 2 wrapper: breadcrumb + header + content */}
        <div style={{ gridColumn: isMobile ? '1' : '2' }}>

        {/* Frase editorial */}
        <div style={{ maxWidth: '880px', margin: '0 auto', padding: isMobile ? '12px 24px 0' : isTablet ? '12px 32px 0' : '12px 40px 0 48px', width: '100%' }}>
          <p style={{
            fontSize: isMobile ? '12px' : '14px',
            fontStyle: 'italic',
            color: 'rgba(255, 255, 255, 0.5)',
            margin: 0,
            letterSpacing: 'normal',
          }}>
            El saber no ocupa lugar.
          </p>
        </div>

        {/* Bloque header */}
        <header style={{ maxWidth: '880px', margin: '0 auto', padding: isMobile ? '8px 24px 0' : '8px 40px 0 48px', textAlign: 'center', width: '100%' }}>
          <p style={{ fontSize: '10px', fontWeight: 700, letterSpacing: '0.16em', textTransform: 'uppercase', color: colors.accent, marginBottom: '12px' }}>
            Bloque {bloque.orden}
          </p>
          <h1 style={{ fontSize: 'clamp(26px, 4vw, 38px)', fontWeight: 700, lineHeight: 1.12, marginBottom: '12px' }}>
            {bloque.titulo}
          </h1>
          {bloque.subtitulo && (
            <p style={{ fontSize: '16px', lineHeight: 1.6, color: colors.muted, fontStyle: 'italic', marginBottom: '16px' }}>
              {bloque.subtitulo}
            </p>
          )}
        </header>

        {/* Table of contents -- mobile toggle (only on mobile) */}
        {isMobile && nodos.length > 0 && (
          <div style={{ padding: '0 20px' }}>
            <button
              onClick={() => setTocOpen(!tocOpen)}
              style={{
                width: '100%', padding: '14px 16px', background: colors.cardBg,
                border: `1px solid ${colors.border}`, borderRadius: '10px',
                color: colors.lavanda, fontSize: '12px', fontWeight: 700,
                letterSpacing: '0.1em', textTransform: 'uppercase',
                cursor: 'pointer', display: 'flex', justifyContent: 'space-between', alignItems: 'center',
              }}
            >
              <span>Índice · {nodos.length} secciones</span>
              <span style={{ fontSize: '14px' }}>{tocOpen ? '−' : '+'}</span>
            </button>
            {tocOpen && (
              <nav style={{ background: colors.cardBg, border: `1px solid ${colors.border}`, borderTop: 'none', borderRadius: '0 0 10px 10px', padding: '12px 16px' }}>
                {nodos.map((nodo, i) => (
                  <a
                    key={nodo.id}
                    href={`#${nodo.slug}`}
                    onClick={() => setTocOpen(false)}
                    style={{
                      display: 'flex', gap: '10px', padding: '8px 0',
                      textDecoration: 'none', fontSize: '14px',
                      color: activeNodo === nodo.slug ? colors.accent : colors.muted,
                      borderBottom: i < nodos.length - 1 ? `1px solid ${colors.border}` : 'none',
                      transition: 'color 0.2s',
                    }}
                  >
                    <span style={{ fontSize: '10px', fontWeight: 700, letterSpacing: '0.12em', color: colors.accent, minWidth: '20px', paddingTop: '3px' }}>
                      {String(i + 1).padStart(2, '0')}
                    </span>
                    <span>{nodo.titulo}</span>
                  </a>
                ))}
                {/* Material complementario */}
                <div style={{ marginTop: '8px', paddingTop: '8px', borderTop: `1px solid ${colors.border}` }}>
                  <p style={{ fontSize: '10px', fontWeight: 700, letterSpacing: '0.12em', textTransform: 'uppercase', color: colors.lavanda, marginBottom: '8px' }}>
                    Material
                  </p>
                  {[
                    { id: 'videos', label: 'Videos' },
                    { id: 'quiz', label: 'Quiz' },
                  ].map((item, i, arr) => (
                    <Link
                      key={item.id}
                      href={`/biblioteca/${slug}/material#${item.id}`}
                      onClick={() => setTocOpen(false)}
                      style={{
                        display: 'block', padding: '8px 0',
                        textDecoration: 'none', fontSize: '14px',
                        color: colors.accent,
                        borderBottom: i < arr.length - 1 ? `1px solid ${colors.border}` : 'none',
                      }}
                    >
                      {item.label}
                    </Link>
                  ))}
                </div>
              </nav>
            )}
          </div>
        )}

        {/* Main content */}
        <div style={{ maxWidth: '780px', margin: '0 auto', padding: isMobile ? '0 24px 60px' : isTablet ? '0 32px 80px' : '0 40px 80px 48px', width: '100%' }}>
          {/* Nodo sections */}
          {nodos.map((nodo, i) => (
            <section
              key={nodo.id}
              id={nodo.slug}
              style={{ maxWidth: '780px', padding: isMobile ? '32px 0 0' : '48px 20px 0', scrollMarginTop: '80px' }}
            >
              {/* Section header */}
              <div style={{ display: 'flex', alignItems: 'center', gap: '12px', marginBottom: '24px' }}>
                <span style={{ fontSize: '10px', fontWeight: 700, letterSpacing: '0.12em', color: colors.accent }}>
                  {String(i + 1).padStart(2, '0')}
                </span>
                <div style={{ flex: 1, height: '0.5px', background: colors.border }} />
              </div>
              <h2 style={{ fontSize: 'clamp(22px, 4vw, 28px)', fontWeight: 700, lineHeight: 1.2, marginBottom: '8px' }}>
                {nodo.titulo}
              </h2>
              {nodo.resumen_corto && (
                <p style={{ fontSize: '14px', color: colors.muted, fontStyle: 'italic', marginBottom: '24px', lineHeight: 1.6 }}>
                  {nodo.resumen_corto}
                </p>
              )}

              {/* Content */}
              {nodo.contenido_html && (() => {
                const sanitized = DOMPurify.sanitize(nodo.contenido_html, { ADD_ATTR: ['class', 'style'] });
                const processed = isMobile ? transformTablesForMobile(sanitized) : sanitized;
                return (
                  <div
                    dangerouslySetInnerHTML={{ __html: processed }}
                    className="nodo-content"
                    style={{ fontSize: '15px', lineHeight: 1.75, color: colors.text, overflowWrap: 'break-word', textAlign: (isMobile || isTablet) ? 'left' : 'justify', textAlignLast: 'left', hyphens: (isMobile || isTablet) ? 'none' : 'auto', WebkitHyphens: (isMobile || isTablet) ? 'none' : 'auto', msHyphens: (isMobile || isTablet) ? 'none' : 'auto' }}
                  />
                );
              })()}
            </section>
          ))}

          {/* Prev / Next bloque */}
          {(prevBloque || nextBloque) && (
            <nav style={{
              maxWidth: '780px', marginTop: '56px', padding: '0 20px',
              display: 'flex', justifyContent: 'space-between', alignItems: 'center',
              borderTop: `1px solid ${colors.border}`, paddingTop: '24px',
            }}>
              {prevBloque ? (
                <Link href={`/biblioteca/${prevBloque.slug}`} scroll={true} onClick={() => window.scrollTo(0,0)} style={{
                  color: colors.accent, textDecoration: 'none', fontSize: '13px',
                  maxWidth: '45%',
                }}>
                  ← {prevBloque.titulo}
                </Link>
              ) : <span />}
              {nextBloque ? (
                <Link href={`/biblioteca/${nextBloque.slug}`} scroll={true} onClick={() => window.scrollTo(0,0)} style={{
                  color: colors.accent, textDecoration: 'none', fontSize: '13px',
                  textAlign: 'right', maxWidth: '45%',
                }}>
                  {nextBloque.titulo} →
                </Link>
              ) : <span />}
            </nav>
          )}
        </div>
        </div>{/* close column 2 wrapper */}
      </div>

      {/* Scroll to top button */}
      <button
        onClick={() => window.scrollTo({ top: 0, behavior: 'smooth' })}
        onMouseEnter={(e) => e.currentTarget.style.background = 'rgba(197,232,50,0.25)'}
        onMouseLeave={(e) => e.currentTarget.style.background = 'rgba(197,232,50,0.15)'}
        style={{
          position: 'fixed',
          bottom: '32px',
          right: '32px',
          width: '44px',
          height: '44px',
          borderRadius: '50%',
          background: 'rgba(197,232,50,0.15)',
          border: '1px solid rgba(197,232,50,0.3)',
          backdropFilter: 'blur(8px)',
          color: '#C5E832',
          padding: 0,
          cursor: 'pointer',
          zIndex: 50,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          transition: 'background 0.2s ease',
        }}
        aria-label="Volver arriba"
      >
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><path d="M12 19V5M5 12l7-7 7 7"/></svg>
      </button>
    </div>
  );
}
