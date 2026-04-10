import { getApprovedAportes, createAporte } from '@/lib/db'

export async function GET() {
  try {
    const aportes = await getApprovedAportes()
    return Response.json(aportes)
  } catch (error) {
    return Response.json({ error: error.message }, { status: 500 })
  }
}

export async function POST(request) {
  try {
    const { nombre, texto, tipo } = await request.json()
    const aporte = await createAporte({ nombre, texto, tipo, status: 'pendiente' })
    return Response.json(aporte, { status: 201 })
  } catch (error) {
    return Response.json({ error: error.message }, { status: 500 })
  }
}
