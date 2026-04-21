"use client";

import { useState, useEffect } from "react";
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

  const prev = () => setCenter((c) => (c - 1 + total) % total);
  const next = () => setCenter((c) => (c + 1) % total);

  return (
    <div>
      {/* Carousel container */}
      <div
        style={{ perspective: "1200px", height: "280px" }}
        className="relative flex items-center justify-center"
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
          const style = POSITIONS[pos];
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
              {...(pos === "center" ? {
                onMouseEnter: (e) => { e.currentTarget.style.transform = "translateX(0) translateZ(0) rotateY(0deg) scale(1.06)"; },
                onMouseLeave: (e) => { e.currentTarget.style.transform = style.transform; },
              } : {})}
              style={{
                position: "absolute",
                width: "220px",
                transform: style.transform,
                zIndex: style.zIndex,
                opacity: style.opacity,
                transition: "all 0.3s ease",
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
          ←
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
                transition: "all 0.3s ease",
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
          →
        </button>
      </div>
    </div>
  );
}
