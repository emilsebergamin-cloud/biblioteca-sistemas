"use client";

import Link from "next/link";
import Image from "next/image";

export default function Navbar() {
  return (
    <nav className="sticky top-0 z-50 bg-paper border-b border-mist/50">
      <div className="h-14 flex items-center justify-between">
        <Link href="/" style={{ paddingLeft: 'clamp(16px, 4vw, 32px)', textDecoration: 'none', display: 'flex', alignItems: 'center' }}>
          <Image
            src="/images/favicon-bai.png"
            alt="Bibl·AI — Biblioteca educativa"
            width={32}
            height={32}
            style={{ width: '32px', height: '32px' }}
          />
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
