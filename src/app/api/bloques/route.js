import { getSupabasePublic } from "@/lib/supabase-public";

const BLOQUES_FALLBACK = [
  { id: "1", slug: "bloque-1", titulo: "Cómo piensan las computadoras", subtitulo: "Lógica, bits y procesamiento", orden: 1, estado: "publicado", color_acento: "#4A5568", icono: "🧠" },
  { id: "2", slug: "bloque-2", titulo: "Cómo se guarda la información", subtitulo: "Bases de datos, archivos y almacenamiento", orden: 2, estado: "publicado", color_acento: "#2D3748", icono: "💾" },
  { id: "3", slug: "bloque-3", titulo: "Cómo se conectan las cosas", subtitulo: "Redes, internet y APIs", orden: 3, estado: "publicado", color_acento: "#285E61", icono: "🔗" },
  { id: "4", slug: "bloque-4", titulo: "Seguridad y privacidad", subtitulo: "Proteger datos y sistemas", orden: 4, estado: "publicado", color_acento: "#744210", icono: "🔒" },
  { id: "5", slug: "bloque-5", titulo: "Del problema a la solución", subtitulo: "Cómo nace un producto digital", orden: 5, estado: "publicado", color_acento: "#553C9A", icono: "🛠️" },
  { id: "6", slug: "bloque-6", titulo: "Qué es la IA", subtitulo: "Inteligencia artificial sin misterio", orden: 6, estado: "publicado", color_acento: "#1A365D", icono: "🤖" },
];

export async function GET() {
  try {
    const supabase = getSupabasePublic();
    const { data, error } = await supabase
      .from("bloques")
      .select("*")
      .eq("estado", "publicado")
      .order("orden", { ascending: true });

    if (error) throw error;
    return Response.json(data);
  } catch {
    return Response.json(BLOQUES_FALLBACK);
  }
}
