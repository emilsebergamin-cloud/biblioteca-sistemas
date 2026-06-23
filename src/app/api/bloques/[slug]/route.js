import { getSupabasePublic } from "@/lib/supabase-public";
import { BLOQUES, NODOS } from "@/lib/fallback-content";

// Cachear en navegador + edge de Vercel para que cargue al instante.
const CACHE = {
  "Cache-Control": "public, max-age=60, s-maxage=3600, stale-while-revalidate=86400",
};

function fallbackDetalle(slug) {
  const bloque = BLOQUES.find((b) => b.slug === slug);
  if (!bloque) return null;

  const nodos = NODOS.filter((n) => n.bloque_id === bloque.id).sort(
    (a, b) => a.orden_en_bloque - b.orden_en_bloque
  );

  const allBloques = BLOQUES.filter((b) => b.estado === "publicado")
    .map((b) => ({ slug: b.slug, titulo: b.titulo, orden: b.orden }))
    .sort((a, b) => a.orden - b.orden);

  return { bloque, nodos, allBloques };
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
      const fb = fallbackDetalle(slug);
      if (fb) return Response.json(fb, { headers: CACHE });
      return Response.json(
        { error: "No se encontró este bloque." },
        { status: 404 }
      );
    }

    const [nodosResult, allBloquesResult] = await Promise.all([
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

    // La DB tiene el bloque pero no cargó contenido: usar respaldo embebido.
    if (nodos.length === 0) {
      const fb = fallbackDetalle(slug);
      if (fb && fb.nodos.length > 0) {
        return Response.json(
          {
            bloque,
            nodos: fb.nodos,
            allBloques: allBloquesResult.data?.length
              ? allBloquesResult.data
              : fb.allBloques,
          },
          { headers: CACHE }
        );
      }
    }

    return Response.json(
      {
        bloque,
        nodos,
        allBloques: allBloquesResult.data || [],
      },
      { headers: CACHE }
    );
  } catch {
    const fb = fallbackDetalle(slug);
    if (fb) return Response.json(fb, { headers: CACHE });
    return Response.json(
      { error: "Error cargando el contenido." },
      { status: 500 }
    );
  }
}
