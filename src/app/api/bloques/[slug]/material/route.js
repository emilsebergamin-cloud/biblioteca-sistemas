import { getSupabasePublic } from "@/lib/supabase-public";
import { BLOQUES, NODOS, QUIZ_PREGUNTAS, RECURSOS } from "@/lib/fallback-content";

// Cachear en navegador + edge de Vercel para que cargue al instante.
const CACHE = {
  "Cache-Control": "public, max-age=60, s-maxage=3600, stale-while-revalidate=86400",
};

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

export async function GET(request, { params }) {
  const { slug } = await params;

  try {
    const supabase = getSupabasePublic();

    const { data: bloques, error: bloqueError } = await supabase
      .from("bloques")
      .select("*")
      .eq("slug", slug)
      .limit(1);

    if (bloqueError) throw bloqueError;

    const bloque = bloques?.[0] || null;
    if (!bloque) {
      const fb = fallbackMaterial(slug);
      if (fb) return Response.json(fb, { headers: CACHE });
      return Response.json(
        { error: "No se encontró este bloque." },
        { status: 404 }
      );
    }

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

    // La DB tiene el bloque pero no cargó contenido: usar respaldo embebido.
    if (nodos.length === 0) {
      const fb = fallbackMaterial(slug);
      if (fb && fb.nodos.length > 0) return Response.json(fb, { headers: CACHE });
    }

    let recursos = [];
    if (nodos.length > 0) {
      const nodoIds = nodos.map((n) => n.id);
      const { data: recursosData } = await supabase
        .from("recursos")
        .select("*")
        .in("nodo_id", nodoIds)
        .order("orden", { ascending: true });
      recursos = recursosData || [];
    }

    return Response.json(
      {
        bloque,
        nodos,
        quizPreguntas: quizResult.data || [],
        recursos,
      },
      { headers: CACHE }
    );
  } catch {
    const fb = fallbackMaterial(slug);
    if (fb) return Response.json(fb, { headers: CACHE });
    return Response.json(
      { error: "Error cargando el contenido." },
      { status: 500 }
    );
  }
}
