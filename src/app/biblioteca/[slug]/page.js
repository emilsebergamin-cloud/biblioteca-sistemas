'use client';

import { useState, useEffect, useCallback } from 'react';
import { useParams } from 'next/navigation';
import Link from 'next/link';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

const headers = {
  apikey: SUPABASE_KEY,
  Authorization: `Bearer ${SUPABASE_KEY}`,
  'Content-Type': 'application/json',
};

function getSessionId() {
  if (typeof window === 'undefined') return null;
  let id = localStorage.getItem('bibliai_session_id');
  if (!id) {
    id = crypto.randomUUID();
    localStorage.setItem('bibliai_session_id', id);
  }
  return id;
}

export default function NodoPage() {
  const { slug } = useParams();

  const [nodo, setNodo] = useState(null);
  const [recursos, setRecursos] = useState([]);
  const [aportes, setAportes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Aporte form state
  const [nombre, setNombre] = useState('');
  const [texto, setTexto] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  // Vote state
  const [voted, setVoted] = useState(null); // 'util' | 'no_util' | null
  const [voteLoading, setVoteLoading] = useState(false);

  // Fetch nodo by slug
  useEffect(() => {
    if (!slug) return;

    async function fetchData() {
      try {
        setLoading(true);

        // Fetch nodo
        const nodoRes = await fetch(
          `${SUPABASE_URL}/rest/v1/nodos?slug=eq.${slug}&select=*`,
          { headers }
        );
        const nodoData = await nodoRes.json();

        if (!nodoData || nodoData.length === 0) {
          setError('No se encontró este nodo.');
          setLoading(false);
          return;
        }

        const currentNodo = nodoData[0];
        setNodo(currentNodo);

        // Fetch recursos and aportes in parallel
        const [recursosRes, aportesRes] = await Promise.all([
          fetch(
            `${SUPABASE_URL}/rest/v1/recursos?nodo_id=eq.${currentNodo.id}&select=*&order=orden.asc`,
            { headers }
          ),
          fetch(`/api/aportes?nodo_id=${currentNodo.id}`),
        ]);

        const recursosData = await recursosRes.json();
        const aportesData = await aportesRes.json();

        setRecursos(Array.isArray(recursosData) ? recursosData : []);
        setAportes(Array.isArray(aportesData) ? aportesData : []);
      } catch (err) {
        setError('Error cargando el contenido.');
        console.error(err);
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, [slug]);

  // Submit aporte
  const handleSubmitAporte = useCallback(
    async (e) => {
      e.preventDefault();
      if (!texto.trim() || !nodo) return;

      setSubmitting(true);
      try {
        const res = await fetch('/api/aportes', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            nodo_id: nodo.id,
            contenido: texto.trim(),
            autor_nombre: nombre.trim() || null,
            session_id: getSessionId(),
          }),
        });

        if (res.ok) {
          setSubmitted(true);
          setTexto('');
          setNombre('');
        }
      } catch (err) {
        console.error('Error enviando aporte:', err);
      } finally {
        setSubmitting(false);
      }
    },
    [texto, nombre, nodo]
  );

  // Vote handler
  const handleVote = useCallback(
    async (tipo) => {
      if (!nodo || voted || voteLoading) return;

      const sessionId = getSessionId();
      if (!sessionId) return;

      setVoteLoading(true);
      try {
        const res = await fetch('/api/votos', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            nodo_id: nodo.id,
            tipo,
            session_id: sessionId,
          }),
        });

        if (res.status === 409) {
          setVoted('already');
        } else if (res.ok) {
          setVoted(tipo);
        }
      } catch (err) {
        console.error('Error votando:', err);
      } finally {
        setVoteLoading(false);
      }
    },
    [nodo, voted, voteLoading]
  );

  // --- Styles ---
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
      <div style={{
        minHeight: '100vh', background: colors.bg,
        display: 'flex', alignItems: 'center', justifyContent: 'center',
      }}>
        <p style={{ color: colors.muted, fontSize: '14px' }}>Cargando...</p>
      </div>
    );
  }

  if (error || !nodo) {
    return (
      <div style={{
        minHeight: '100vh', background: colors.bg,
        display: 'flex', flexDirection: 'column', alignItems: 'center',
        justifyContent: 'center', gap: '16px',
      }}>
        <p style={{ color: colors.text, fontSize: '16px' }}>
          {error || 'Nodo no encontrado.'}
        </p>
        <Link href="/biblioteca" style={{
          color: colors.accent, fontSize: '14px', textDecoration: 'none',
        }}>
          ← Volver a la Biblioteca
        </Link>
      </div>
    );
  }

  const tags = nodo.tags || [];

  return (
    <div style={{
      minHeight: '100vh', background: colors.bg, color: colors.text,
      paddingBottom: '80px',
    }}>
      {/* Back link */}
      <div style={{ maxWidth: '780px', margin: '0 auto', padding: '24px 20px 0' }}>
        <Link href="/biblioteca" style={{
          color: colors.accent, fontSize: '13px', textDecoration: 'none',
          display: 'inline-flex', alignItems: 'center', gap: '6px',
          opacity: 0.8, transition: 'opacity 0.2s',
        }}>
          ← Volver a la Biblioteca
        </Link>
      </div>

      {/* Header */}
      <header style={{ maxWidth: '780px', margin: '0 auto', padding: '32px 20px 0' }}>
        <h1 style={{
          fontSize: 'clamp(28px, 5vw, 40px)', fontWeight: 700,
          lineHeight: 1.15, marginBottom: '16px', color: colors.text,
        }}>
          {nodo.titulo}
        </h1>

        {nodo.resumen_corto && (
          <p style={{
            fontSize: '16px', lineHeight: 1.6, color: colors.muted,
            fontStyle: 'italic', marginBottom: '20px',
          }}>
            {nodo.resumen_corto}
          </p>
        )}

        {/* Tags */}
        {tags.length > 0 && (
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px', marginBottom: '32px' }}>
            {tags.map((tag, i) => (
              <span key={i} style={{
                background: 'rgba(197,232,50,0.12)',
                color: colors.accent,
                fontSize: '12px', fontWeight: 600,
                padding: '4px 12px', borderRadius: '100px',
                letterSpacing: '0.04em',
              }}>
                {tag}
              </span>
            ))}
          </div>
        )}
      </header>

      {/* Content HTML */}
      {nodo.contenido_html && (
        <article style={{ maxWidth: '780px', margin: '0 auto', padding: '0 20px' }}>
          <div
            dangerouslySetInnerHTML={{ __html: nodo.contenido_html }}
            style={{
              fontSize: '15px', lineHeight: 1.75, color: colors.text,
              overflowWrap: 'break-word',
            }}
            className="nodo-content"
          />
        </article>
      )}

      {/* Recursos */}
      {recursos.length > 0 && (
        <section style={{
          maxWidth: '780px', margin: '48px auto 0', padding: '0 20px',
        }}>
          <h2 style={{
            fontSize: '11px', fontWeight: 700, letterSpacing: '0.14em',
            textTransform: 'uppercase', color: colors.lavanda,
            marginBottom: '16px',
          }}>
            Recursos
          </h2>
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
                <span style={{
                  fontSize: '18px', flexShrink: 0,
                }}>
                  {recurso.tipo === 'video' ? '▶' : '🔗'}
                </span>
                <div>
                  <p style={{
                    fontSize: '14px', fontWeight: 600, color: colors.text,
                    marginBottom: '2px',
                  }}>
                    {recurso.titulo}
                  </p>
                  {recurso.descripcion && (
                    <p style={{ fontSize: '12px', color: colors.muted }}>
                      {recurso.descripcion}
                    </p>
                  )}
                </div>
              </a>
            ))}
          </div>
        </section>
      )}

      {/* Vote section */}
      <section style={{
        maxWidth: '780px', margin: '48px auto 0', padding: '0 20px',
        textAlign: 'center',
      }}>
        <p style={{
          fontSize: '14px', color: colors.muted, marginBottom: '16px',
        }}>
          ¿Te resultó útil este contenido?
        </p>
        <div style={{ display: 'flex', justifyContent: 'center', gap: '12px' }}>
          <button
            onClick={() => handleVote('util')}
            disabled={!!voted || voteLoading}
            style={{
              padding: '10px 24px', borderRadius: '8px', border: 'none',
              fontSize: '14px', fontWeight: 600, cursor: voted ? 'default' : 'pointer',
              background: voted === 'util'
                ? colors.accent
                : 'rgba(197,232,50,0.15)',
              color: voted === 'util' ? '#1A1A1A' : colors.accent,
              opacity: voted && voted !== 'util' ? 0.4 : 1,
              transition: 'all 0.2s',
            }}
          >
            Útil
          </button>
          <button
            onClick={() => handleVote('no_util')}
            disabled={!!voted || voteLoading}
            style={{
              padding: '10px 24px', borderRadius: '8px', border: 'none',
              fontSize: '14px', fontWeight: 600, cursor: voted ? 'default' : 'pointer',
              background: voted === 'no_util'
                ? colors.lavanda
                : 'rgba(168,180,216,0.15)',
              color: voted === 'no_util' ? '#1A1A1A' : colors.lavanda,
              opacity: voted && voted !== 'no_util' ? 0.4 : 1,
              transition: 'all 0.2s',
            }}
          >
            No me sirvió
          </button>
        </div>
        {voted === 'already' && (
          <p style={{ fontSize: '12px', color: colors.muted, marginTop: '10px' }}>
            Ya votaste en este nodo.
          </p>
        )}
        {voted && voted !== 'already' && (
          <p style={{ fontSize: '12px', color: colors.accent, marginTop: '10px' }}>
            ¡Gracias por tu feedback!
          </p>
        )}
      </section>

      {/* Aportes section */}
      <section style={{
        maxWidth: '780px', margin: '48px auto 0', padding: '0 20px',
      }}>
        <h2 style={{
          fontSize: '11px', fontWeight: 700, letterSpacing: '0.14em',
          textTransform: 'uppercase', color: colors.lavanda,
          marginBottom: '16px',
        }}>
          Aportes de la comunidad
        </h2>

        {aportes.length === 0 && (
          <p style={{ fontSize: '13px', color: colors.muted, fontStyle: 'italic' }}>
            Todavía no hay aportes aprobados para este nodo.
          </p>
        )}

        {aportes.length > 0 && (
          <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
            {aportes.map((aporte) => (
              <div key={aporte.id} style={{
                background: colors.cardBg,
                border: `1px solid ${colors.border}`,
                borderRadius: '10px', padding: '16px',
              }}>
                <p style={{
                  fontSize: '14px', lineHeight: 1.6, color: colors.text,
                  marginBottom: '8px',
                }}>
                  {aporte.contenido}
                </p>
                <p style={{ fontSize: '11px', color: colors.muted }}>
                  — {aporte.autor_nombre || 'Anónimo'}
                </p>
              </div>
            ))}
          </div>
        )}

        {/* Aporte form */}
        <div style={{
          marginTop: '32px', background: colors.cardBg,
          border: `1px solid ${colors.border}`,
          borderRadius: '12px', padding: '24px',
        }}>
          <h3 style={{
            fontSize: '15px', fontWeight: 600, color: colors.text,
            marginBottom: '16px',
          }}>
            Dejá tu aporte
          </h3>

          {submitted ? (
            <div style={{ textAlign: 'center', padding: '16px 0' }}>
              <p style={{ fontSize: '14px', color: colors.accent, marginBottom: '8px' }}>
                ¡Gracias por tu aporte!
              </p>
              <p style={{ fontSize: '12px', color: colors.muted }}>
                Lo vamos a revisar antes de publicarlo.
              </p>
            </div>
          ) : (
            <form onSubmit={handleSubmitAporte}>
              <div style={{ marginBottom: '12px' }}>
                <label style={{
                  display: 'block', fontSize: '12px', color: colors.muted,
                  marginBottom: '6px',
                }}>
                  Tu nombre (opcional)
                </label>
                <input
                  type="text"
                  value={nombre}
                  onChange={(e) => setNombre(e.target.value)}
                  placeholder="Anónimo"
                  maxLength={100}
                  style={{
                    width: '100%', padding: '10px 14px',
                    background: 'rgba(247,244,239,0.06)',
                    border: `1px solid ${colors.border}`,
                    borderRadius: '8px', color: colors.text,
                    fontSize: '14px', outline: 'none',
                    boxSizing: 'border-box',
                  }}
                  onFocus={(e) => e.target.style.borderColor = colors.lavanda}
                  onBlur={(e) => e.target.style.borderColor = colors.border}
                />
              </div>
              <div style={{ marginBottom: '12px' }}>
                <label style={{
                  display: 'block', fontSize: '12px', color: colors.muted,
                  marginBottom: '6px',
                }}>
                  Tu aporte
                </label>
                <textarea
                  value={texto}
                  onChange={(e) => {
                    if (e.target.value.length <= 500) setTexto(e.target.value);
                  }}
                  placeholder="Compartí algo que pueda sumar..."
                  rows={4}
                  maxLength={500}
                  style={{
                    width: '100%', padding: '10px 14px',
                    background: 'rgba(247,244,239,0.06)',
                    border: `1px solid ${colors.border}`,
                    borderRadius: '8px', color: colors.text,
                    fontSize: '14px', outline: 'none', resize: 'vertical',
                    fontFamily: 'inherit', boxSizing: 'border-box',
                  }}
                  onFocus={(e) => e.target.style.borderColor = colors.lavanda}
                  onBlur={(e) => e.target.style.borderColor = colors.border}
                />
                <p style={{
                  fontSize: '11px', textAlign: 'right', marginTop: '4px',
                  color: texto.length >= 450 ? colors.accent : colors.muted,
                }}>
                  {texto.length}/500
                </p>
              </div>
              <button
                type="submit"
                disabled={!texto.trim() || submitting}
                style={{
                  padding: '10px 28px', borderRadius: '8px', border: 'none',
                  fontSize: '14px', fontWeight: 600,
                  cursor: !texto.trim() || submitting ? 'not-allowed' : 'pointer',
                  background: !texto.trim() ? 'rgba(197,232,50,0.2)' : colors.accent,
                  color: !texto.trim() ? 'rgba(197,232,50,0.5)' : '#1A1A1A',
                  transition: 'all 0.2s',
                }}
              >
                {submitting ? 'Enviando...' : 'Enviar aporte'}
              </button>
            </form>
          )}
        </div>
      </section>
    </div>
  );
}
