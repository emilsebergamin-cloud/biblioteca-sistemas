"use client";

import Link from "next/link";

export default function Navbar() {
  return (
    <nav className="sticky top-0 z-50 bg-paper border-b border-mist/50">
      <div className="h-14 flex items-center justify-between">
        <Link href="/" style={{ fontSize: '16px', fontWeight: 800, paddingLeft: 'clamp(16px, 4vw, 32px)', textDecoration: 'none', color: '#0D0C0A' }}>
          Bibl<span style={{color:'#C5E832', fontWeight:800}}>·</span>AI
        </Link>

        <div style={{ display: 'flex', alignItems: 'center', gap: '24px', paddingRight: 'clamp(16px, 4vw, 32px)' }}>
          <Link href="/biblioteca" style={{ fontSize: '14px', fontWeight: 500, color: '#9B9080', textDecoration: 'none' }}>
            Biblioteca
          </Link>
          <Link href="/aportes" style={{ fontSize: '14px', fontWeight: 500, color: '#9B9080', textDecoration: 'none' }}>
            Aportes
          </Link>
        </div>
      </div>
    </nav>
  );
}
