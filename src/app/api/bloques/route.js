import { getSupabasePublic } from "@/lib/supabase-public";
import { BLOQUES } from "@/lib/fallback-content";

const FALLBACK = BLOQUES.filter((b) => b.estado === "publicado");

// Cachear en el navegador y en el edge de Vercel: el contenido cambia poco,
// así las visitas posteriores se sirven al instante sin recalcular nada.
const CACHE = {
  "Cache-Control": "public, max-age=60, s-maxage=3600, stale-while-revalidate=86400",
};

export async function GET() {
  try {
    const supabase = getSupabasePublic();
    const { data, error } = await supabase
      .from("bloques")
      .select("*")
      .eq("estado", "publicado")
      .order("orden", { ascending: true });

    if (error) throw error;
    if (!data || data.length === 0) {
      return Response.json(FALLBACK, { headers: CACHE });
    }
    return Response.json(data, { headers: CACHE });
  } catch {
    return Response.json(FALLBACK, { headers: CACHE });
  }
}
