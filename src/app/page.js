"use client";

import { useEffect } from "react";
import { BackgroundGradientAnimation } from "@/components/ui/BackgroundGradientAnimation";

export default function Home() {
  useEffect(() => {
    document.body.classList.add('home-no-scroll');
    return () => document.body.classList.remove('home-no-scroll');
  }, []);

  return (
      <BackgroundGradientAnimation containerClassName="hero-container" containerStyle={{ height: '100vh', overflow: 'hidden', padding: '60px 40px 40px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
        <div style={{ position: 'relative', zIndex: 2, textAlign: 'center' }}>
          <p style={{
            fontSize: '10px', fontWeight: 700,
            letterSpacing: '0.16em', textTransform: 'uppercase',
            color: '#6B6058', marginBottom: '12px',
            animation: 'fadeUp 0.6s ease 0.1s both',
          }}>
            Proyecto educativo personal
          </p>

          <h1 style={{
            fontSize: 'clamp(36px, 6vw, 60px)', fontWeight: 700,
            lineHeight: 1.08, letterSpacing: '-0.03em',
            color: '#0D0C0A', marginBottom: '12px',
            animation: 'fadeUp 0.6s ease 0.25s both',
          }}>
            Entendé el mundo tech.<br />
            <em style={{ fontStyle: 'italic', fontWeight: 400, color: '#6B6058' }}>
              Sin perderte.
            </em>
          </h1>

          {/* Trazo animado */}
          <div style={{
            margin: '0 auto 12px', width: 'fit-content',
            animation: 'fadeUp 0.4s ease 0.5s both',
          }}>
            <svg style={{ width: 'clamp(200px, 60vw, 280px)' }} height="10" viewBox="0 0 280 10">
              <path
                d="M4 6 Q70 1 140 6 Q210 11 276 4"
                fill="none" stroke="#A8C41A" strokeWidth="2"
                strokeLinecap="round"
                style={{
                  strokeDasharray: 320,
                  strokeDashoffset: 320,
                  animation: 'drawLine 0.9s ease 0.7s forwards',
                }}
              />
            </svg>
          </div>

          <p className="hero-desc" style={{
            fontSize: '16px', color: '#6B6058',
            lineHeight: 1.65, maxWidth: '460px',
            margin: '0 auto 16px',
            animation: 'fadeUp 0.6s ease 0.7s both',
          }}>
            No es un curso. No es una wiki. Es un recorrido que te lleva de no saber nada a poder participar en cualquier conversación técnica — con criterio real.
          </p>

          {/* Stats */}
          <div className="hero-stats" style={{
            display: 'flex', gap: '32px',
            justifyContent: 'center', alignItems: 'center',
            marginBottom: '20px',
            animation: 'fadeUp 0.6s ease 0.8s both',
          }}>
            {[
              { num: '6', label: 'Bloques', color: '#0D0C0A' },
              { num: '49', label: 'Nodos', color: '#A8C41A' },
              { num: '0', label: 'Excusas', color: '#0D0C0A' },
            ].map((s, i) => (
              <div key={i} style={{ display: 'flex', alignItems: 'center' }}>
                {i > 0 && <div style={{ width: '0.5px', height: '28px', background: 'rgba(13,12,10,0.15)' }} />}
                <div style={{ textAlign: 'center' }}>
                  <div style={{
                    fontSize: '28px', fontWeight: 700,
                    letterSpacing: '-0.03em', lineHeight: 1,
                    color: s.color,
                  }}>{s.num}</div>
                  <div style={{
                    fontSize: '11px', fontWeight: 600,
                    letterSpacing: '0.1em', textTransform: 'uppercase',
                    color: '#6B6058', marginTop: '4px',
                  }}>{s.label}</div>
                </div>
              </div>
            ))}
          </div>

          {/* Botón */}
          <a href="/biblioteca" style={{
            display: 'inline-block',
            padding: '12px 32px',
            border: '1px solid #0D0C0A',
            fontSize: '12px', fontWeight: 600,
            letterSpacing: '0.08em',
            textTransform: 'uppercase',
            color: '#0D0C0A',
            background: 'transparent',
            cursor: 'pointer',
            borderRadius: 0,
            textDecoration: 'none',
            transition: 'all 0.2s',
            animation: 'fadeUp 0.6s ease 0.9s both',
          }}
            onMouseOver={e => { e.target.style.background='#0D0C0A'; e.target.style.color='#F7F4EF'; }}
            onMouseOut={e => { e.target.style.background='transparent'; e.target.style.color='#0D0C0A'; }}
          >
            Explorar →
          </a>
        </div>
        <style>{`
          @keyframes fadeUp {
            from { opacity: 0; transform: translateY(14px); }
            to { opacity: 1; transform: translateY(0); }
          }
          @keyframes drawLine {
            to { stroke-dashoffset: 0; }
          }
        `}</style>
      </BackgroundGradientAnimation>
  );
}
