"use client";

import { useState, useEffect, useRef, useCallback } from "react";
import { useRouter } from "next/navigation";

const BLOQUES_FALLBACK = [
  { num: "01", titulo: "Cómo piensan las computadoras", subtitulo: "Lógica, bits y procesamiento", nodos: 8, dificultad: "Básico" },
  { num: "02", titulo: "Cómo se guarda la información", subtitulo: "Bases de datos, archivos y almacenamiento", nodos: 7, dificultad: "Básico" },
  { num: "03", titulo: "Cómo se conectan las cosas", subtitulo: "Redes, internet y APIs", nodos: 9, dificultad: "Básico" },
  { num: "04", titulo: "Seguridad y privacidad", subtitulo: "Proteger datos y sistemas", nodos: 8, dificultad: "Intermedio" },
  { num: "05", titulo: "Del problema a la solución", subtitulo: "Cómo nace un producto digital", nodos: 9, dificultad: "Intermedio" },
  { num: "06", titulo: "Qué es la IA", subtitulo: "Inteligencia artificial sin misterio", nodos: 8, dificultad: "Intermedio-avanzado" },
];

const POSITIONS = {
  center: { transform: "translateX(0) translateZ(0) rotateY(0deg)", zIndex: 10, opacity: 1 },
  left1: { transform: "translateX(-240px) translateZ(-120px) rotateY(28deg)", zIndex: 5, opacity: 0.7 },
  right1: { transform: "translateX(240px) translateZ(-120px) rotateY(-28deg)", zIndex: 5, opacity: 0.7 },
  left2: { transform: "translateX(-420px) translateZ(-240px) rotateY(42deg)", zIndex: 2, opacity: 0.35 },
  right2: { transform: "translateX(420px) translateZ(-240px) rotateY(-42deg)", zIndex: 2, opacity: 0.35 },
  hidden: { transform: "translateX(-600px) translateZ(-300px) rotateY(55deg)", zIndex: 0, opacity: 0 },
};

const POSITIONS_TABLET = {
  center: { transform: "translateX(0) translateZ(0) rotateY(0deg)", zIndex: 10, opacity: 1 },
  left1: { transform: "translateX(-200px) translateZ(-100px) rotateY(26deg)", zIndex: 5, opacity: 0.7 },
  right1: { transform: "translateX(200px) translateZ(-100px) rotateY(-26deg)", zIndex: 5, opacity: 0.7 },
  left2: { transform: "translateX(-360px) translateZ(-200px) rotateY(42deg)", zIndex: 2, opacity: 0.15 },
  right2: { transform: "translateX(360px) translateZ(-200px) rotateY(-42deg)", zIndex: 2, opacity: 0.15 },
  hidden: { transform: "translateX(-500px) translateZ(-260px) rotateY(55deg)", zIndex: 0, opacity: 0 },
};

const POSITIONS_MOBILE = {
  center: { transform: "translateX(0) translateZ(0) rotateY(0deg)", zIndex: 10, opacity: 1 },
  left1: { transform: "translateX(-170px) translateZ(-80px) rotateY(25deg)", zIndex: 5, opacity: 0.4 },
  right1: { transform: "translateX(170px) translateZ(-80px) rotateY(-25deg)", zIndex: 5, opacity: 0.4 },
  left2: { transform: "translateX(-320px) translateZ(-160px) rotateY(40deg)", zIndex: 2, opacity: 0 },
  right2: { transform: "translateX(320px) translateZ(-160px) rotateY(-40deg)", zIndex: 2, opacity: 0 },
  hidden: { transform: "translateX(-400px) translateZ(-200px) rotateY(55deg)", zIndex: 0, opacity: 0 },
};

function getPosition(index, center, total) {
  const diff = ((index - center) % total + total) % total;
  if (diff === 0) return "center";
  if (diff === 1) return "right1";
  if (diff === total - 1) return "left1";
  if (diff === 2) return "right2";
  if (diff === total - 2) return "left2";
  return "hidden";
}

export default function Carousel3D() {
  const router = useRouter();
  const [bloques, setBloques] = useState(BLOQUES_FALLBACK);
  const [loading, setLoading] = useState(true);
  const [center, setCenter] = useState(0);
  const [isMobile, setIsMobile] = useState(false);
  const [isTablet, setIsTablet] = useState(false);

  // Swipe tracking
  const touchStart = useRef(null);
  const touchStartY = useRef(null);

  useEffect(() => {
    const mqlMobile = window.matchMedia('(max-width: 768px)');
    const mqlTablet = window.matchMedia('(min-width: 769px) and (max-width: 1024px)');
    setIsMobile(mqlMobile.matches);
    setIsTablet(mqlTablet.matches);
    const hM = (e) => setIsMobile(e.matches);
    const hT = (e) => setIsTablet(e.matches);
    mqlMobile.addEventListener('change', hM);
    mqlTablet.addEventListener('change', hT);
    return () => { mqlMobile.removeEventListener('change', hM); mqlTablet.removeEventListener('change', hT); };
  }, []);

  useEffect(() => {
    fetch("/api/bloques")
      .then((res) => {
        if (!res.ok) throw new Error("fetch failed");
        return res.json();
      })
      .then((data) => {
        if (data && data.length > 0) {
          const mapped = data.map((b, i) => ({
            num: String(i + 1).padStart(2, "0"),
            titulo: b.titulo,
            subtitulo: b.subtitulo,
            nodos: BLOQUES_FALLBACK[i]?.nodos || 8,
            dificultad: BLOQUES_FALLBACK[i]?.dificultad || "Básico",
            slug: b.slug,
          }));
          setBloques(mapped);
        }
      })
      .catch(() => {})
      .finally(() => setLoading(false));
  }, []);

  const total = bloques.length;

  const prev = useCallback(() => setCenter((c) => (c - 1 + total) % total), [total]);
  const next = useCallback(() => setCenter((c) => (c + 1) % total), [total]);

  // Swipe handlers
  const handleTouchStart = useCallback((e) => {
    touchStart.current = e.touches[0].clientX;
    touchStartY.current = e.touches[0].clientY;
  }, []);

  const handleTouchEnd = useCallback((e) => {
    if (touchStart.current === null) return;
    const deltaX = e.changedTouches[0].clientX - touchStart.current;
    const deltaY = e.changedTouches[0].clientY - touchStartY.current;
    touchStart.current = null;
    touchStartY.current = null;

    // Ignore if vertical swipe is dominant (let page scroll)
    if (Math.abs(deltaY) > Math.abs(deltaX)) return;
    // Minimum 50px horizontal to trigger
    if (Math.abs(deltaX) < 50) return;

    if (deltaX < 0) next();
    else prev();
  }, [next, prev]);

  const positions = isMobile ? POSITIONS_MOBILE : isTablet ? POSITIONS_TABLET : POSITIONS;
  const cardWidth = isMobile ? "200px" : "220px";
  const containerHeight = isMobile ? "180px" : "280px";

  return (
    <div>
      {/* Carousel container */}
      <div
        style={{ perspective: "1200px", height: containerHeight, touchAction: "pan-y" }}
        className="relative flex items-center justify-center"
        onTouchStart={handleTouchStart}
        onTouchEnd={handleTouchEnd}
      >
        {loading && (
          <div style={{
            position: "absolute",
            fontSize: "12px",
            color: "#9B9080",
            letterSpacing: "0.1em",
            textTransform: "uppercase",
          }}>
            <div style={{ width: 36, height: 36, border: '3px solid rgba(197,232,50,0.15)', borderTop: '3px solid #C5E832', borderRadius: '50%', animation: 'spin 0.9s cubic-bezier(0.4,0,0.6,1) infinite', margin: '60px auto' }} />
          </div>
        )}
        {!loading && bloques.map((bloque, i) => {
          const pos = getPosition(i, center, total);
          const style = positions[pos];
          return (
            <div
              key={bloque.num}
              onClick={() => {
                if (pos === "center" && bloque.slug) {
                  router.push(`/biblioteca/${bloque.slug}`);
                } else {
                  setCenter(i);
                }
              }}
              {...(pos === "center" && !isMobile ? {
                onMouseEnter: (e) => {
                  e.currentTarget.style.transform = "translateX(0) translateZ(120px) rotateY(0deg) scale(1.12)";
                  e.currentTarget.style.boxShadow = "0 48px 96px rgba(0,0,0,0.7), 0 0 0 1.5px rgba(197,232,50,0.6), 0 0 40px rgba(197,232,50,0.15)";
                  e.currentTarget.style.borderColor = "rgba(197,232,50,0.6)";
                },
                onMouseLeave: (e) => {
                  e.currentTarget.style.transform = style.transform;
                  e.currentTarget.style.boxShadow = "0 24px 64px rgba(13,12,10,0.14)";
                  e.currentTarget.style.borderColor = "rgba(197,232,50,0.4)";
                },
              } : {})}
              style={{
                position: "absolute",
                width: cardWidth,
                transform: style.transform,
                zIndex: style.zIndex,
                opacity: style.opacity,
                transition: "all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94)",
                cursor: "pointer",
                background: "#fff",
                border: pos === "center" ? "0.5px solid rgba(197,232,50,0.4)" : "0.5px solid rgba(13,12,10,0.10)",
                borderRadius: "16px",
                padding: "24px 20px 20px",
                boxShadow: pos === "center" ? "0 24px 64px rgba(13,12,10,0.14)" : "none",
              }}
            >
              <span
                style={{
                  fontSize: "10px",
                  fontWeight: 700,
                  letterSpacing: "0.12em",
                  color: "#C5E832",
                  display: "block",
                  marginBottom: "10px",
                }}
              >
                {bloque.num}
              </span>
              <h3
                style={{
                  fontSize: "17px",
                  fontWeight: 700,
                  color: "#0D0C0A",
                  lineHeight: 1.25,
                  margin: "0 0 8px",
                }}
              >
                {bloque.titulo}
              </h3>
              <p
                style={{
                  fontSize: "12px",
                  color: "#A8B4D8",
                  lineHeight: 1.5,
                  margin: 0,
                }}
              >
                {bloque.subtitulo}
              </p>
              <div
                style={{
                  borderTop: "0.5px solid rgba(13,12,10,0.08)",
                  marginTop: "16px",
                  paddingTop: "12px",
                  display: "flex",
                  justifyContent: "space-between",
                  alignItems: "center",
                }}
              >
                <span
                  onClick={(e) => {
                    e.stopPropagation();
                    if (bloque.slug) router.push(`/biblioteca/${bloque.slug}`);
                  }}
                  style={{ fontSize: "11px", fontWeight: 600, color: "#0D0C0A", cursor: "pointer" }}
                >
                  Leer →
                </span>
                <span style={{ fontSize: "10px", color: "#C8C0B0" }}>
                  {bloque.nodos} nodos · {bloque.dificultad}
                </span>
              </div>
            </div>
          );
        })}
      </div>

      {/* Navigation */}
      <div className="flex items-center justify-center gap-4 mt-8">
        <button
          onClick={prev}
          style={{
            width: "48px",
            height: "48px",
            borderRadius: "50%",
            border: "0.5px solid rgba(13,12,10,0.15)",
            background: "#fff",
            cursor: "pointer",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            fontSize: "24px",
            fontWeight: 700,
            lineHeight: 1,
            padding: 0,
            color: "#0D0C0A",
          }}
          aria-label="Anterior"
        >
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><path d="M15 18l-6-6 6-6"/></svg>
        </button>

        <div className="flex items-center gap-2">
          {bloques.map((_, i) => (
            <button
              key={i}
              onClick={() => setCenter(i)}
              aria-label={`Ir al bloque ${i + 1}`}
              style={{
                width: i === center ? "18px" : "5px",
                height: "5px",
                borderRadius: i === center ? "3px" : "50%",
                background: i === center ? "#0D0C0A" : "#C8C0B0",
                border: "none",
                cursor: "pointer",
                transition: "all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94)",
                padding: 0,
              }}
            />
          ))}
        </div>

        <button
          onClick={next}
          style={{
            width: "48px",
            height: "48px",
            borderRadius: "50%",
            border: "0.5px solid rgba(13,12,10,0.15)",
            background: "#fff",
            cursor: "pointer",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            fontSize: "24px",
            fontWeight: 700,
            lineHeight: 1,
            padding: 0,
            color: "#0D0C0A",
          }}
          aria-label="Siguiente"
        >
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><path d="M9 18l6-6-6-6"/></svg>
        </button>
      </div>
    </div>
  );
}
