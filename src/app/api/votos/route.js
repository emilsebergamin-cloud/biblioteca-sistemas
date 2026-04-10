import { addVote } from '@/lib/db'

export async function POST(request) {
  try {
    const { aporte_id, tipo, ip_hash } = await request.json()
    const voto = await addVote(aporte_id, tipo, ip_hash)
    return Response.json(voto, { status: 201 })
  } catch (error) {
    return Response.json({ error: error.message }, { status: 500 })
  }
}
