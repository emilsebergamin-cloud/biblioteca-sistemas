// Acceso a datos del lado del servidor.
// Intenta Supabase; si no está disponible o no devuelve datos, usa el
// contenido embebido (fallback-content.js). Lo usan las páginas para
// renderizarse de forma estática en el build → carga instantánea.

import { getSupabasePublic } from "./supabase-public";
import { BLOQUES, NODOS, QUIZ_PREGUNTAS, RECURSOS } from "./fallback-content";

const publicados = () => BLOQUES.filter((b) => b.estado === "publicado");

const listaBloques = () =>
  publicados()
    .map((b) => ({ slug: b.slug, titulo: b.titulo, orden: b.orden }))
    .sort((a, b) => a.orden - b.orden);

export async function getBloques() {
  try {
    const supabase = getSupabasePublic();
    const { data, error } = await supabase
      .from("bloques")
      .select("*")
      .eq("estado", "publicado")
      .order("orden", { ascending: true });
    if (error) throw error;
    if (data && data.length > 0) return data;
  } catch {
    /* usa fallback */
  }
  return publicados();
}

function fallbackDetalle(slug) {
  const bloque = BLOQUES.find((b) => b.slug === slug);
  if (!bloque) return null;
  const nodos = NODOS.filter((n) => n.bloque_id === bloque.id).sort(
    (a, b) => a.orden_en_bloque - b.orden_en_bloque
  );
  return { bloque, nodos, allBloques: listaBloques() };
}

export async function getBloqueDetalle(slug) {
  try {
    const supabase = getSupabasePublic();
    const { data: bloques, error } = await supabase
      .from("bloques")
      .select("*")
      .eq("slug", slug)
      .limit(1);
    if (error) throw error;

    const bloque = bloques?.[0];
    if (bloque) {
      const [nodosResult, allResult] = await Promise.all([
        supabase
          .from("nodos")
          .select("*")
          .eq("bloque_id", bloque.id)
          .order("orden_en_bloque", { ascending: true }),
        supabase
          .from("bloques")
          .select("slug,titulo,orden")
          .eq("estado", "publicado")
          .order("orden", { ascending: true }),
      ]);
      const nodos = nodosResult.data || [];
      if (nodos.length > 0) {
        return {
          bloque,
          nodos,
          allBloques: allResult.data?.length ? allResult.data : listaBloques(),
        };
      }
    }
  } catch {
    /* usa fallback */
  }
  return fallbackDetalle(slug);
}

function fallbackMaterial(slug) {
  const bloque = BLOQUES.find((b) => b.slug === slug);
  if (!bloque) return null;
  const nodos = NODOS.filter((n) => n.bloque_id === bloque.id).sort(
    (a, b) => a.orden_en_bloque - b.orden_en_bloque
  );
  const nodoIds = new Set(nodos.map((n) => n.id));
  const quizPreguntas = QUIZ_PREGUNTAS.filter(
    (q) => q.bloque_id === bloque.id
  ).sort((a, b) => a.orden - b.orden);
  const recursos = RECURSOS.filter((r) => nodoIds.has(r.nodo_id)).sort(
    (a, b) => a.orden - b.orden
  );
  return { bloque, nodos, quizPreguntas, recursos };
}

export async function getMaterial(slug) {
  try {
    const supabase = getSupabasePublic();
    const { data: bloques, error } = await supabase
      .from("bloques")
      .select("*")
      .eq("slug", slug)
      .limit(1);
    if (error) throw error;

    const bloque = bloques?.[0];
    if (bloque) {
      const [nodosResult, quizResult] = await Promise.all([
        supabase
          .from("nodos")
          .select("*")
          .eq("bloque_id", bloque.id)
          .order("orden_en_bloque", { ascending: true }),
        supabase
          .from("quiz_preguntas")
          .select("*")
          .eq("bloque_id", bloque.id)
          .order("orden", { ascending: true }),
      ]);
      const nodos = nodosResult.data || [];
      if (nodos.length > 0) {
        let recursos = [];
        const nodoIds = nodos.map((n) => n.id);
        const { data: recursosData } = await supabase
          .from("recursos")
          .select("*")
          .in("nodo_id", nodoIds)
          .order("orden", { ascending: true });
        recursos = recursosData || [];
        return {
          bloque,
          nodos,
          quizPreguntas: quizResult.data || [],
          recursos,
        };
      }
    }
  } catch {
    /* usa fallback */
  }
  return fallbackMaterial(slug);
}

export function slugsDeBloques() {
  return publicados().map((b) => ({ slug: b.slug }));
}
