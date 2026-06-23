import { getSupabasePublic } from "@/lib/supabase-public";
import { BLOQUES } from "@/lib/fallback-content";

const FALLBACK = BLOQUES.filter((b) => b.estado === "publicado");

export async function GET() {
  try {
    const supabase = getSupabasePublic();
    const { data, error } = await supabase
      .from("bloques")
      .select("*")
      .eq("estado", "publicado")
      .order("orden", { ascending: true });

    if (error) throw error;
    if (!data || data.length === 0) return Response.json(FALLBACK);
    return Response.json(data);
  } catch {
    return Response.json(FALLBACK);
  }
}
