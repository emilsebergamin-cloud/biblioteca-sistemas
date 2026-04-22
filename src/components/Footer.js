"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

export default function Footer() {
  const pathname = usePathname();
  const isAportes = pathname === '/aportes';

  const copyright = (
    <p style={{ fontSize: '12px', color: 'rgba(155,144,128,0.6)', margin: 0 }}>
      © 2026 · Proyecto educativo personal · Creado por Emilse Bergamin
    </p>
  );

  if (isAportes) {
    return (
      <footer style={{
        background: '#1A1A1A',
        color: '#F7F4EF',
        fontFamily: 'var(--font-jakarta), sans-serif',
        padding: '56px 32px 48px',
        textAlign: 'center',
      }}>
        {copyright}
      </footer>
    );
  }

  return (
    <footer style={{
      background: '#1A1A1A',
      color: '#F7F4EF',
      fontFamily: 'var(--font-jakarta), sans-serif',
    }}>
      <div style={{
        maxWidth: '960px',
        margin: '0 auto',
        padding: '56px 32px 48px',
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'flex-start',
        flexWrap: 'wrap',
        gap: '40px',
      }}>
        {/* Izquierda: logo + frase */}
        <div>
          <p style={{ fontSize: '16px', fontWeight: 600, margin: 0, lineHeight: 1 }}>
            Bibl<span style={{ color: '#C5E832' }}>·</span>AI
          </p>
          <p style={{
            fontSize: '13px',
            fontStyle: 'italic',
            color: '#9B9080',
            margin: '8px 0 0',
            lineHeight: 1.4,
          }}>
            El saber no ocupa lugar.
          </p>
        </div>

        {/* Derecha: navegación */}
        <div style={{ textAlign: 'right' }}>
          <p style={{
            fontSize: '11px',
            fontWeight: 600,
            letterSpacing: '0.1em',
            color: '#9B9080',
            margin: '0 0 12px',
            textTransform: 'uppercase',
          }}>
            Navegación
          </p>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '8px', alignItems: 'flex-end' }}>
            <Link href="/biblioteca" style={{ fontSize: '14px', color: '#F7F4EF', textDecoration: 'none' }}>
              Biblioteca
            </Link>
            <Link href="/aportes" style={{ fontSize: '14px', color: '#C5E832', textDecoration: 'none', fontWeight: 500 }}>
              Aportes de la comunidad →
            </Link>
          </div>
        </div>
      </div>

      {/* Copyright */}
      <div style={{
        borderTop: '1px solid rgba(247,244,239,0.08)',
        padding: '20px 32px',
        textAlign: 'center',
      }}>
        {copyright}
      </div>
    </footer>
  );
}
