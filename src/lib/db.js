import { supabase } from './supabase'

export async function getApprovedAportes() {
  const { data, error } = await supabase
    .from('aportes')
    .select('*')
    .eq('status', 'aprobado')
    .order('fecha', { ascending: false })

  if (error) throw error
  return data
}

export async function createAporte(aporte) {
  const { data, error } = await supabase
    .from('aportes')
    .insert([aporte])
    .select()
    .single()

  if (error) throw error
  return data
}

export async function addVote(aporteId, tipo, ipHash) {
  const { data, error } = await supabase
    .from('votos')
    .insert([{ aporte_id: aporteId, tipo, ip_hash: ipHash }])
    .select()
    .single()

  if (error) throw error
  return data
}
