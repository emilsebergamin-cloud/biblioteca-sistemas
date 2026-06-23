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

    return Response.json({
      bloque,
      nodos: nodosResult.data || [],
      allBloques: allBloquesResult.data || [],
    });
  } catch {
    return Response.json(
      { error: "Error cargando el contenido." },
      { status: 500 }
    );
  }
}
