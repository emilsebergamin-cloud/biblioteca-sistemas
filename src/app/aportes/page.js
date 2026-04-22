'use client';

import { useState, useEffect, useCallback } from 'react';

function getSessionId() {
  if (typeof window === 'undefined') return null;
  let id = localStorage.getItem('bibliai_session_id');
  if (!id) {
    id = crypto.randomUUID();
    localStorage.setItem('bibliai_session_id', id);
  }
  return id;
}

export default function AportesPage() {
  const [aportes, setAportes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [nombre, setNombre] = useState('');
  const [texto, setTexto] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  useEffect(() => {
    async function fetchAportes() {
      try {
        const res = await fetch('/api/aportes');
        const data = await res.json();
        setAportes(Array.isArray(data) ? data : []);
      } catch (err) {
        console.error('Error cargando aportes:', err);
      } finally {
        setLoading(false);
      }
    }
    fetchAportes();
  }, []);

  const handleSubmit = useCallback(
    async (e) => {
      e.preventDefault();
      if (!texto.trim()) return;

      setSubmitting(true);
      try {
        const res = await fetch('/api/aportes', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
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
    [texto, nombre]
  );

  const colors = {
    bg: '#1A1A1A',
    text: '#F7F4EF',
    accent: '#C5E832',
    lavanda: '#A8B4D8',
    muted: 'rgba(247,244,239,0.45)',
    cardBg: 'rgba(247,244,239,0.05)',
    border: 'rgba(247,244,239,0.1)',
  };

  function formatDate(dateStr) {
    const d = new Date(dateStr);
    return d.toLocaleDateString('es-AR', { day: 'numeric', month: 'long', year: 'numeric' });
  }

  return (
    <div style={{ minHeight: '100vh', background: colors.bg, color: colors.text, paddingBottom: '80px' }}>
      <div style={{ maxWidth: '640px', margin: '0 auto', padding: '48px 24px 0' }}>

        {/* Header */}
        <h1 style={{ fontSize: 'clamp(28px, 5vw, 40px)', fontWeight: 700, lineHeight: 1.12, marginBottom: '12px', textAlign: 'center' }}>
          Aportes de la comunidad
        </h1>
        <p style={{ fontSize: '16px', lineHeight: 1.6, color: colors.muted, fontStyle: 'italic', textAlign: 'center', marginBottom: '48px' }}>
          Contanos qué pensás, sugerinos un tema, reportá algo que no funciona.
        </p>

        {/* Form */}
        <div style={{
          background: colors.cardBg,
          border: `1px solid ${colors.border}`,
          borderRadius: '12px',
          padding: '24px',
          marginBottom: '48px',
        }}>
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
            <form onSubmit={handleSubmit}>
              <div style={{ marginBottom: '12px' }}>
                <label style={{ display: 'block', fontSize: '12px', color: colors.muted, marginBottom: '6px' }}>
                  Nombre (opcional)
                </label>
                <input
                  type="text"
                  value={nombre}
                  onChange={(e) => setNombre(e.target.value)}
                  placeholder="Cómo te llamás (opcional)"
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
                <label style={{ display: 'block', fontSize: '12px', color: colors.muted, marginBottom: '6px' }}>
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
                {submitting ? 'Enviando...' : 'Enviar'}
              </button>
            </form>
          )}
        </div>

        {/* Lista de aportes */}
        {loading ? (
          <div style={{ display: 'flex', justifyContent: 'center', padding: '32px 0' }}>
            <div style={{ width: 36, height: 36, border: '3px solid rgba(197,232,50,0.15)', borderTop: '3px solid #C5E832', borderRadius: '50%', animation: 'spin 0.9s cubic-bezier(0.4,0,0.6,1) infinite' }} />
          </div>
        ) : aportes.length === 0 ? (
          <p style={{ fontSize: '14px', color: colors.muted, fontStyle: 'italic', textAlign: 'center' }}>
            Sé la primera persona en dejar un aporte.
          </p>
        ) : (
          <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
            {aportes.map((aporte) => (
              <div key={aporte.id} style={{
                background: colors.cardBg,
                border: `1px solid ${colors.border}`,
                borderRadius: '10px',
                padding: '16px',
              }}>
                <p style={{ fontSize: '14px', lineHeight: 1.6, color: colors.text, marginBottom: '8px' }}>
                  {aporte.contenido}
                </p>
                <p style={{ fontSize: '11px', color: colors.muted }}>
                  — {aporte.autor_nombre || 'Anónimo'}{aporte.created_at ? ` · ${formatDate(aporte.created_at)}` : ''}
                </p>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
