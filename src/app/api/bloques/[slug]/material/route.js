import { getSupabasePublic } from "@/lib/supabase-public";

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

    return Response.json({
      bloque,
      nodos,
      quizPreguntas: quizResult.data || [],
      recursos,
    });
  } catch {
    return Response.json(
      { error: "Error cargando el contenido." },
      { status: 500 }
    );
  }
}
