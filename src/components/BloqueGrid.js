"use client";

import { useEffect, useRef } from "react";

export default function BloqueGrid({ bloques }) {
  const gridRef = useRef(null);

  useEffect(() => {
    const cards = gridRef.current?.querySelectorAll("[data-card]");
    if (!cards) return;

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("card-visible");
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.1 }
    );

    cards.forEach((card) => observer.observe(card));
    return () => observer.disconnect();
  }, []);

  return (
    <div
      ref={gridRef}
      className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-[1px] bg-ink/[0.12]"
    >
      {bloques.map((bloque, i) => (
        <article
          key={bloque.id}
          data-card
          style={{ transitionDelay: `${i * 80}ms` }}
          className="bg-paper p-6 hover:bg-paper2 transition-colors flex flex-col justify-between min-h-[180px] opacity-0 translate-y-4 transition-all duration-500 ease-out"
        >
          <div>
            <span className="text-[11px] uppercase tracking-[0.15em] text-mist block mb-3">
              {String(i + 1).padStart(2, "0")}
            </span>
            <h3 className="font-serif text-[20px] leading-snug mb-2">
              {bloque.titulo}
            </h3>
            <p className="text-[12px] text-ghost">
              {bloque.subtitulo}
            </p>
          </div>
          <span className="text-[11px] text-mist mt-4">
            Leer →
          </span>
        </article>
      ))}
    </div>
  );
}
