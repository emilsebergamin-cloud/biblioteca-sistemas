import { addVote } from '@/lib/db'

export async function POST(request) {
  try {
    const { nodo_id, tipo, session_id } = await request.json()

    if (!nodo_id || !tipo || !session_id) {
      return Response.json(
        { error: 'Faltan campos obligatorios: nodo_id, tipo, session_id' },
        { status: 400 }
      )
    }

    const result = await addVote({ nodo_id, tipo, session_id })

    if (result.alreadyVoted) {
      return Response.json(
        { error: 'Ya votaste en este tema' },
        { status: 409 }
      )
    }

    return Response.json(result, { status: 201 })
  } catch (error) {
    return Response.json({ error: error.message }, { status: 500 })
  }
}
