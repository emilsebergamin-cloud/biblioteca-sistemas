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

export default function BloquePage() {
  const { slug } = useParams();

  const [bloque, setBloque] = useState(null);
  const [nodos, setNodos] = useState([]);
  const [recursos, setRecursos] = useState([]);
  const [quizPreguntas, setQuizPreguntas] = useState([]);
  const [quizAnswers, setQuizAnswers] = useState({});
  const [quizRevealed, setQuizRevealed] = useState({});
  const [allBloques, setAllBloques] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [activeNodo, setActiveNodo] = useState(null);
  const [tocOpen, setTocOpen] = useState(false);

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

        // Fetch nodos, recursos, quiz in parallel
        const [nodosRes, recursosRes, quizRes] = await Promise.all([
          fetch(`${SUPABASE_URL}/rest/v1/nodos?bloque_id=eq.${currentBloque.id}&select=*&order=orden_en_bloque.asc`, { headers }),
          fetch(`${SUPABASE_URL}/rest/v1/recursos?nodo_id=in.(select id from nodos where bloque_id=eq.${currentBloque.id})&select=*&order=orden.asc`, { headers }).catch(() => ({ json: () => [] })),
          fetch(`${SUPABASE_URL}/rest/v1/quiz_preguntas?bloque_id=eq.${currentBloque.id}&select=*&order=orden.asc`, { headers }).catch(() => ({ json: () => [] })),
        ]);

        const nodosData = await nodosRes.json();
        setNodos(Array.isArray(nodosData) ? nodosData : []);

        const recursosData = await recursosRes.json();
        setRecursos(Array.isArray(recursosData) ? recursosData : []);

        const quizData = await quizRes.json();
        setQuizPreguntas(Array.isArray(quizData) ? quizData : []);
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

  // Prev/next bloque
  const bloqueIdx = allBloques.findIndex((b) => b.slug === slug);
  const prevBloque = bloqueIdx > 0 ? allBloques[bloqueIdx - 1] : null;
  const nextBloque = bloqueIdx < allBloques.length - 1 ? allBloques[bloqueIdx + 1] : null;

  if (loading) {
    return (
      <div style={{ minHeight: '100vh', background: colors.bg, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
        <p style={{ color: colors.muted, fontSize: '14px' }}>Cargando...</p>
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

      {/* Breadcrumb */}
      <nav style={{ maxWidth: '780px', margin: '0 auto', padding: '24px 20px 0' }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13px', flexWrap: 'wrap' }}>
          <Link href="/biblioteca" style={{ color: colors.accent, textDecoration: 'none' }}>Biblioteca</Link>
          <span style={{ color: colors.muted }}>→</span>
          <span style={{ color: colors.muted }}>{bloque.titulo}</span>
        </div>
      </nav>

      {/* Bloque header */}
      <header style={{ maxWidth: '780px', margin: '0 auto', padding: '32px 20px 0', textAlign: 'center' }}>
        <p style={{ fontSize: '10px', fontWeight: 700, letterSpacing: '0.16em', textTransform: 'uppercase', color: colors.accent, marginBottom: '12px' }}>
          Bloque {bloque.orden}
        </p>
        <h1 style={{ fontSize: 'clamp(28px, 5vw, 44px)', fontWeight: 700, lineHeight: 1.12, marginBottom: '12px' }}>
          {bloque.titulo}
        </h1>
        {bloque.subtitulo && (
          <p style={{ fontSize: '16px', lineHeight: 1.6, color: colors.muted, fontStyle: 'italic', marginBottom: '40px' }}>
            {bloque.subtitulo}
          </p>
        )}
      </header>

      {/* Table of contents — mobile toggle */}
      {nodos.length > 0 && (
        <div style={{ maxWidth: '780px', margin: '0 auto', padding: '0 20px' }}>
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
            </nav>
          )}
        </div>
      )}

      {/* Nodo sections */}
      {nodos.map((nodo, i) => (
        <section
          key={nodo.id}
          id={nodo.slug}
          style={{ maxWidth: '780px', margin: '0 auto', padding: '48px 20px 0', scrollMarginTop: '80px' }}
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

          {/* Tags */}
          {nodo.tags && nodo.tags.length > 0 && (
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px', marginBottom: '20px' }}>
              {nodo.tags.map((tag, j) => (
                <span key={j} style={{
                  background: 'rgba(197,232,50,0.1)', color: colors.accent,
                  fontSize: '10px', fontWeight: 600, padding: '3px 10px',
                  borderRadius: '100px', letterSpacing: '0.04em',
                }}>
                  {tag}
                </span>
              ))}
            </div>
          )}

          {/* Content */}
          {nodo.contenido_html && (
            <div
              dangerouslySetInnerHTML={{ __html: nodo.contenido_html }}
              className="nodo-content"
              style={{ fontSize: '15px', lineHeight: 1.75, color: colors.text, overflowWrap: 'break-word' }}
            />
          )}
        </section>
      ))}

      {/* Videos curados */}
      {recursos.length > 0 && (
        <section style={{ maxWidth: '780px', margin: '56px auto 0', padding: '0 20px' }}>
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
                  display: 'flex', alignItems: 'center', gap: '12px',
                  background: colors.cardBg, border: `1px solid ${colors.border}`,
                  borderRadius: '10px', padding: '14px 16px',
                  textDecoration: 'none', transition: 'border-color 0.2s',
                }}
                onMouseEnter={(e) => e.currentTarget.style.borderColor = colors.lavanda}
                onMouseLeave={(e) => e.currentTarget.style.borderColor = colors.border}
              >
                <span style={{ fontSize: '18px', flexShrink: 0 }}>▶</span>
                <div style={{ flex: 1 }}>
                  <p style={{ fontSize: '14px', fontWeight: 600, color: colors.text, marginBottom: '2px' }}>
                    {recurso.titulo}
                  </p>
                </div>
                <span style={{ fontSize: '10px', color: colors.muted, textTransform: 'uppercase', letterSpacing: '0.08em' }}>
                  {recurso.dificultad}
                </span>
              </a>
            ))}
          </div>
        </section>
      )}

      {/* Quiz */}
      {quizPreguntas.length > 0 && (
        <section style={{ maxWidth: '780px', margin: '56px auto 0', padding: '0 20px' }}>
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

      {/* Prev / Next bloque */}
      {(prevBloque || nextBloque) && (
        <nav style={{
          maxWidth: '780px', margin: '56px auto 0', padding: '0 20px',
          display: 'flex', justifyContent: 'space-between', alignItems: 'center',
          borderTop: `1px solid ${colors.border}`, paddingTop: '24px',
        }}>
          {prevBloque ? (
            <Link href={`/biblioteca/${prevBloque.slug}`} style={{
              color: colors.accent, textDecoration: 'none', fontSize: '13px',
              maxWidth: '45%',
            }}>
              ← {prevBloque.titulo}
            </Link>
          ) : <span />}
          {nextBloque ? (
            <Link href={`/biblioteca/${nextBloque.slug}`} style={{
              color: colors.accent, textDecoration: 'none', fontSize: '13px',
              textAlign: 'right', maxWidth: '45%',
            }}>
              {nextBloque.titulo} →
            </Link>
          ) : <span />}
        </nav>
      )}
    </div>
  );
}
