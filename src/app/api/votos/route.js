import { addVote } from '@/lib/db'

const TIPOS_VALIDOS = ['util', 'no_util']

export async function POST(request) {
  try {
    const { nodo_id, tipo, session_id } = await request.json()

    if (!nodo_id || !tipo || !session_id) {
      return Response.json(
        { error: 'Faltan campos obligatorios: nodo_id, tipo, session_id' },
        { status: 400 }
      )
    }

    if (!TIPOS_VALIDOS.includes(tipo)) {
      return Response.json(
        { error: 'Tipo de voto inválido' },
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
    console.error('Error en POST /api/votos:', error)
    return Response.json({ error: 'Error procesando la solicitud' }, { status: 500 })
  }
}
