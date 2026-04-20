'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
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
  const router = useRouter();

  const [bloque, setBloque] = useState(null);
  const [nodos, setNodos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!slug) return;

    async function fetchData() {
      try {
        setLoading(true);

        // Fetch bloque by slug
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

        // Fetch nodos for this bloque
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

  if (error || !bloque) {
    return (
      <div style={{
        minHeight: '100vh', background: colors.bg,
        display: 'flex', flexDirection: 'column', alignItems: 'center',
        justifyContent: 'center', gap: '16px',
      }}>
        <p style={{ color: colors.text, fontSize: '16px' }}>
          {error || 'Bloque no encontrado.'}
        </p>
        <Link href="/biblioteca" style={{
          color: colors.accent, fontSize: '14px', textDecoration: 'none',
        }}>
          ← Volver a la Biblioteca
        </Link>
      </div>
    );
  }

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
          opacity: 0.8,
        }}>
          ← Volver a la Biblioteca
        </Link>
      </div>

      {/* Bloque header */}
      <header style={{ maxWidth: '780px', margin: '0 auto', padding: '32px 20px 0' }}>
        <p style={{
          fontSize: '10px', fontWeight: 700, letterSpacing: '0.16em',
          textTransform: 'uppercase', color: colors.accent, marginBottom: '12px',
        }}>
          Bloque {bloque.orden}
        </p>
        <h1 style={{
          fontSize: 'clamp(28px, 5vw, 40px)', fontWeight: 700,
          lineHeight: 1.15, marginBottom: '12px', color: colors.text,
        }}>
          {bloque.titulo}
        </h1>
        {bloque.subtitulo && (
          <p style={{
            fontSize: '16px', lineHeight: 1.6, color: colors.muted,
            fontStyle: 'italic', marginBottom: '40px',
          }}>
            {bloque.subtitulo}
          </p>
        )}
      </header>

      {/* Nodos list */}
      <section style={{ maxWidth: '780px', margin: '0 auto', padding: '0 20px' }}>
        <p style={{
          fontSize: '11px', fontWeight: 700, letterSpacing: '0.14em',
          textTransform: 'uppercase', color: colors.lavanda, marginBottom: '20px',
        }}>
          {nodos.length} nodos en este bloque
        </p>

        {nodos.length === 0 && (
          <p style={{ fontSize: '14px', color: colors.muted, fontStyle: 'italic' }}>
            Todavía no hay nodos cargados para este bloque.
          </p>
        )}

        <div style={{ display: 'flex', flexDirection: 'column', gap: '1px', background: colors.border }}>
          {nodos.map((nodo, i) => (
            <div
              key={nodo.id}
              onClick={() => router.push(`/biblioteca/nodo/${nodo.slug}`)}
              style={{
                background: colors.bg,
                padding: '20px 16px',
                cursor: 'pointer',
                transition: 'background 0.2s',
              }}
              onMouseEnter={(e) => e.currentTarget.style.background = 'rgba(247,244,239,0.03)'}
              onMouseLeave={(e) => e.currentTarget.style.background = colors.bg}
            >
              <div style={{ display: 'flex', alignItems: 'flex-start', gap: '16px' }}>
                <span style={{
                  fontSize: '10px', fontWeight: 700, letterSpacing: '0.12em',
                  color: colors.accent, minWidth: '20px', paddingTop: '4px',
                }}>
                  {String(i + 1).padStart(2, '0')}
                </span>
                <div style={{ flex: 1 }}>
                  <h3 style={{
                    fontSize: '16px', fontWeight: 600, color: colors.text,
                    marginBottom: '4px', lineHeight: 1.3,
                  }}>
                    {nodo.titulo}
                  </h3>
                  {nodo.resumen_corto && (
                    <p style={{
                      fontSize: '13px', color: colors.muted, lineHeight: 1.5,
                    }}>
                      {nodo.resumen_corto}
                    </p>
                  )}
                </div>
                <span style={{ fontSize: '14px', color: colors.muted, paddingTop: '2px' }}>
                  →
                </span>
              </div>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
}
