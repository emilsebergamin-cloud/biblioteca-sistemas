'use client';

import { useState, useEffect } from 'react';
import { useParams } from 'next/navigation';
import Link from 'next/link';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

const headers = {
  apikey: SUPABASE_KEY,
  Authorization: `Bearer ${SUPABASE_KEY}`,
  'Content-Type': 'application/json',
};

export default function MaterialPage() {
  const { slug } = useParams();

  const [bloque, setBloque] = useState(null);
  const [nodos, setNodos] = useState([]);
  const [recursos, setRecursos] = useState([]);
  const [quizPreguntas, setQuizPreguntas] = useState([]);
  const [quizAnswers, setQuizAnswers] = useState({});
  const [quizRevealed, setQuizRevealed] = useState({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [isMobile, setIsMobile] = useState(false);
  const [isTablet, setIsTablet] = useState(false);
  const [tocOpen, setTocOpen] = useState(false);

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

        // Fetch bloque
        const bloqueRes = await fetch(
          `${SUPABASE_URL}/rest/v1/bloques?slug=eq.${slug}&select=*`,
          { headers }
        );
        const bloqueData = await bloqueRes.json();

        if (!bloqueData || bloqueData.length === 0) {
          setError('No se encontró este bloque.');
          setLoading(false);
          return;
        }

        const currentBloque = bloqueData[0];
        setBloque(currentBloque);

        // Fetch nodos and quiz in parallel
        const [nodosRes, quizRes] = await Promise.all([
          fetch(
            `${SUPABASE_URL}/rest/v1/nodos?bloque_id=eq.${currentBloque.id}&select=*&order=orden_en_bloque.asc`,
            { headers }
          ),
          fetch(
            `${SUPABASE_URL}/rest/v1/quiz_preguntas?bloque_id=eq.${currentBloque.id}&select=*&order=orden.asc`,
            { headers }
          ).catch(() => ({ json: () => [] })),
        ]);

        const nodosData = await nodosRes.json();
        setNodos(Array.isArray(nodosData) ? nodosData : []);

        const quizData = await quizRes.json();
        setQuizPreguntas(Array.isArray(quizData) ? quizData : []);

        // Fetch recursos for all nodos in this bloque
        if (Array.isArray(nodosData) && nodosData.length > 0) {
          const nodoIds = nodosData.map((n) => n.id).join(',');
          const recursosRes = await fetch(
            `${SUPABASE_URL}/rest/v1/recursos?nodo_id=in.(${nodoIds})&select=*&order=orden.asc`,
            { headers }
          ).catch(() => ({ json: () => [] }));
          const recursosData = await recursosRes.json();
          setRecursos(Array.isArray(recursosData) ? recursosData : []);
        }
      } catch (err) {
        setError('Error cargando el contenido.');
        console.error(err);
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, [slug]);

  const handleQuizAnswer = (qIdx, optIdx) => {
    if (quizRevealed[qIdx]) return;
    setQuizAnswers((prev) => ({ ...prev, [qIdx]: optIdx }));
    setQuizRevealed((prev) => ({ ...prev, [qIdx]: true }));
  };

  const colors = {
    bg: '#1A1A1A',
    text: '#F7F4EF',
    accent: '#C5E832',
    lavanda: '#A8B4D8',
    muted: 'rgba(247,244,239,0.45)',
    cardBg: 'rgba(247,244,239,0.05)',
    border: 'rgba(247,244,239,0.1)',
  };

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

  const materialLinks = [
    { id: 'videos', label: 'Videos' },
    { id: 'quiz', label: 'Quiz' },
  ];

  return (
    <div style={{ minHeight: '100vh', background: colors.bg, color: colors.text, paddingBottom: '80px' }}>

      {/* Grid layout: sidebar + main content */}
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
                <Link
                  key={nodo.id}
                  href={`/biblioteca/${slug}#${nodo.slug}`}
                  className="indice-item"
                >
                  {nodo.titulo}
                </Link>
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
                {materialLinks.map((item) => (
                  <a
                    key={item.id}
                    href={`#${item.id}`}
                    className="indice-item activo"
                    onClick={(e) => {
                      e.preventDefault();
                      document.getElementById(item.id)?.scrollIntoView({ behavior: 'smooth' });
                    }}
                  >
                    {item.label}
                  </a>
                ))}
              </nav>
            </div>
          </aside>
        )}

        {/* Column 2 wrapper */}
        <div style={{ gridColumn: isMobile ? '1' : '2' }}>

          {/* Breadcrumb */}
          <nav style={{ maxWidth: '880px', margin: '0 auto', padding: '8px 40px 0 48px', width: '100%' }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', flexWrap: 'wrap' }}>
              <Link href="/biblioteca" style={{ color: colors.accent, textDecoration: 'none' }}>Biblioteca</Link>
              <span style={{ color: colors.muted }}>→</span>
              <Link href={`/biblioteca/${slug}`} style={{ color: colors.accent, textDecoration: 'none' }}>{bloque.titulo}</Link>
              <span style={{ color: colors.muted }}>→</span>
              <span style={{ color: colors.muted }}>Material complementario</span>
            </div>
          </nav>

          {/* Header */}
          <header style={{ maxWidth: '880px', margin: '0 auto', padding: isMobile ? '8px 20px 0' : '8px 40px 0 48px', textAlign: 'center', width: '100%' }}>
            <p style={{ fontSize: '10px', fontWeight: 700, letterSpacing: '0.16em', textTransform: 'uppercase', color: colors.accent, marginBottom: '12px' }}>
              Bloque {bloque.orden}
            </p>
            <h1 style={{ fontSize: 'clamp(26px, 4vw, 38px)', fontWeight: 700, lineHeight: 1.12, marginBottom: '12px' }}>
              Material complementario
            </h1>
            <p style={{ fontSize: '16px', lineHeight: 1.6, color: colors.muted, fontStyle: 'italic', marginBottom: '16px' }}>
              Videos y quiz para {bloque.titulo}
            </p>
          </header>

          {/* Mobile TOC */}
          {isMobile && (
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
                <span>Índice · {nodos.length} secciones + material</span>
                <span style={{ fontSize: '14px' }}>{tocOpen ? '−' : '+'}</span>
              </button>
              {tocOpen && (
                <nav style={{ background: colors.cardBg, border: `1px solid ${colors.border}`, borderTop: 'none', borderRadius: '0 0 10px 10px', padding: '12px 16px' }}>
                  {nodos.map((nodo, i) => (
                    <Link
                      key={nodo.id}
                      href={`/biblioteca/${slug}#${nodo.slug}`}
                      onClick={() => setTocOpen(false)}
                      style={{
                        display: 'flex', gap: '10px', padding: '8px 0',
                        textDecoration: 'none', fontSize: '14px',
                        color: colors.muted,
                        borderBottom: `1px solid ${colors.border}`,
                        transition: 'color 0.2s',
                      }}
                    >
                      <span style={{ fontSize: '10px', fontWeight: 700, letterSpacing: '0.12em', color: colors.accent, minWidth: '20px', paddingTop: '3px' }}>
                        {String(i + 1).padStart(2, '0')}
                      </span>
                      <span>{nodo.titulo}</span>
                    </Link>
                  ))}
                  {/* Material links */}
                  <div style={{ marginTop: '8px', paddingTop: '8px', borderTop: `1px solid ${colors.border}` }}>
                    <p style={{ fontSize: '10px', fontWeight: 700, letterSpacing: '0.12em', textTransform: 'uppercase', color: colors.lavanda, marginBottom: '8px' }}>
                      Material
                    </p>
                    {materialLinks.map((item, i) => (
                      <a
                        key={item.id}
                        href={`#${item.id}`}
                        onClick={(e) => {
                          e.preventDefault();
                          setTocOpen(false);
                          document.getElementById(item.id)?.scrollIntoView({ behavior: 'smooth' });
                        }}
                        style={{
                          display: 'block', padding: '8px 0',
                          textDecoration: 'none', fontSize: '14px',
                          color: colors.accent,
                          borderBottom: i < materialLinks.length - 1 ? `1px solid ${colors.border}` : 'none',
                        }}
                      >
                        {item.label}
                      </a>
                    ))}
                  </div>
                </nav>
              )}
            </div>
          )}

          {/* Main content */}
          <div style={{ maxWidth: '780px', margin: '0 auto', padding: '0 40px 80px 48px', width: '100%' }}>

            {/* Videos curados */}
            {recursos.length > 0 && (
              <section id="videos" style={{ maxWidth: '780px', marginTop: '56px', padding: '0 20px', scrollMarginTop: '80px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '12px', marginBottom: '24px' }}>
                  <span style={{ fontSize: '11px', fontWeight: 700, letterSpacing: '0.14em', textTransform: 'uppercase', color: colors.lavanda }}>
                    Videos curados
                  </span>
                  <div style={{ flex: 1, height: '0.5px', background: colors.border }} />
                </div>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                  {recursos.map((recurso) => (
                    <a
                      key={recurso.id}
                      href={recurso.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      style={{
                        display: 'flex', alignItems: 'flex-start', gap: '12px',
                        background: colors.cardBg, border: `1px solid ${colors.border}`,
                        borderRadius: '10px', padding: '14px 16px',
                        textDecoration: 'none', transition: 'border-color 0.2s',
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.borderColor = colors.lavanda;
                        e.currentTarget.querySelector('.video-title').style.color = colors.accent;
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.borderColor = colors.border;
                        e.currentTarget.querySelector('.video-title').style.color = colors.text;
                      }}
                    >
                      <span style={{ fontSize: '16px', flexShrink: 0, paddingTop: '2px' }}>▶</span>
                      <div style={{ flex: 1 }}>
                        <p className="video-title" style={{ fontSize: '14px', fontWeight: 600, color: colors.text, marginBottom: '4px', transition: 'color 0.2s' }}>
                          {recurso.titulo}
                        </p>
                        <p style={{ fontSize: '11px', color: colors.muted, lineHeight: 1.5 }}>
                          {[recurso.dificultad, recurso.tipo].filter(Boolean).join(' · ')}
                        </p>
                      </div>
                    </a>
                  ))}
                </div>
              </section>
            )}

            {/* Quiz */}
            {quizPreguntas.length > 0 && (
              <section id="quiz" style={{ maxWidth: '780px', marginTop: '56px', padding: '0 20px', scrollMarginTop: '80px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '12px', marginBottom: '24px' }}>
                  <span style={{ fontSize: '11px', fontWeight: 700, letterSpacing: '0.14em', textTransform: 'uppercase', color: colors.accent }}>
                    Quiz — ¿Entendiste el bloque?
                  </span>
                  <div style={{ flex: 1, height: '0.5px', background: colors.border }} />
                </div>
                <p style={{ fontSize: '13px', color: colors.muted, fontStyle: 'italic', marginBottom: '24px' }}>
                  No se aprueba con sentido común. Si podés responder bien, entendiste el bloque.
                </p>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
                  {quizPreguntas.map((q, qIdx) => {
                    const answered = quizRevealed[qIdx];
                    const selected = quizAnswers[qIdx];
                    const isCorrect = selected === q.respuesta_correcta;

                    return (
                      <div key={q.id || qIdx} style={{
                        background: colors.cardBg, border: `1px solid ${colors.border}`,
                        borderRadius: '12px', padding: '20px',
                      }}>
                        <p style={{ fontSize: '14px', fontWeight: 600, color: colors.text, marginBottom: '14px', lineHeight: 1.5 }}>
                          {qIdx + 1}. {q.pregunta}
                        </p>
                        <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                          {q.opciones.map((opt, optIdx) => {
                            let bg = 'rgba(247,244,239,0.04)';
                            let borderColor = colors.border;
                            let textColor = colors.text;

                            if (answered) {
                              if (optIdx === q.respuesta_correcta) {
                                bg = 'rgba(197,232,50,0.15)';
                                borderColor = colors.accent;
                                textColor = colors.accent;
                              } else if (optIdx === selected && !isCorrect) {
                                bg = 'rgba(225,29,72,0.1)';
                                borderColor = '#E11D48';
                                textColor = '#E11D48';
                              }
                            }

                            return (
                              <button
                                key={optIdx}
                                onClick={() => handleQuizAnswer(qIdx, optIdx)}
                                disabled={answered}
                                style={{
                                  padding: '12px 14px', borderRadius: '8px',
                                  border: `1px solid ${borderColor}`,
                                  background: bg, color: textColor,
                                  fontSize: '13px', textAlign: 'left',
                                  cursor: answered ? 'default' : 'pointer',
                                  transition: 'all 0.2s', lineHeight: 1.5,
                                }}
                              >
                                {opt}
                              </button>
                            );
                          })}
                        </div>
                        {answered && q.explicacion && (
                          <p style={{
                            marginTop: '12px', fontSize: '13px', lineHeight: 1.6,
                            color: isCorrect ? colors.accent : '#E11D48',
                            fontStyle: 'italic',
                          }}>
                            {isCorrect ? '✓ ' : '✗ '}{q.explicacion}
                          </p>
                        )}
                      </div>
                    );
                  })}
                </div>
              </section>
            )}

            {/* Volver a la lectura */}
            <div style={{ maxWidth: '780px', marginTop: '56px', padding: '0 20px', textAlign: 'center' }}>
              <Link
                href={`/biblioteca/${slug}`}
                style={{
                  color: colors.accent, textDecoration: 'none', fontSize: '14px',
                  display: 'inline-flex', alignItems: 'center', gap: '6px',
                  transition: 'opacity 0.2s',
                }}
              >
                ← Volver a la lectura
              </Link>
            </div>
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
