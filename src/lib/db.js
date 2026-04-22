import { getSupabaseServer } from './supabase-server'

// --- Aportes ---

export async function getApprovedAportes(nodoId) {
  const supabase = getSupabaseServer()
  let query = supabase
    .from('aportes')
    .select('*')
    .eq('estado', 'aprobado')
    .order('created_at', { ascending: false })

  if (nodoId) {
    query = query.eq('nodo_id', nodoId)
  }

  const { data, error } = await query

  if (error) throw error
  return data
}

export async function createAporte({ nodo_id, contenido, autor_nombre }) {
  const supabase = getSupabaseServer()
  const { data, error } = await supabase
    .from('aportes')
    .insert([{ nodo_id: nodo_id || null, contenido, autor_nombre, estado: 'pendiente' }])
    .select()
    .single()

  if (error) throw error
  return data
}

// --- Votos ---

export async function addVote({ nodo_id, tipo, session_id }) {
  const supabase = getSupabaseServer()
  const { data, error } = await supabase
    .from('votos')
    .insert([{ nodo_id, tipo, session_id }])
    .select()
    .single()

  if (error) {
    if (error.code === '23505') {
      return { alreadyVoted: true }
    }
    throw error
  }
  return data
}

// --- Bloques ---

export async function getBloques() {
  const supabase = getSupabaseServer()
  const { data, error } = await supabase
    .from('bloques')
    .select('*')
    .eq('estado', 'publicado')
    .order('orden', { ascending: true })

  if (error) throw error
  return data
}

// --- Nodos ---

export async function getNodoBySlug(slug) {
  const supabase = getSupabaseServer()
  const { data, error } = await supabase
    .from('nodos')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error) throw error
  return data
}

// --- Recursos ---

export async function getRecursosByNodo(nodoId) {
  const supabase = getSupabaseServer()
  const { data, error } = await supabase
    .from('recursos')
    .select('*')
    .eq('nodo_id', nodoId)
    .order('orden', { ascending: true })

  if (error) throw error
  return data
}
