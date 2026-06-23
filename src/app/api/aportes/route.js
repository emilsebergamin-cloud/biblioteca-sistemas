import { getApprovedAportes, createAporte } from '@/lib/db'

// --- Rate limiting (in-memory) ---
// Map key: `${session_id}:${nodo_id}` -> array of timestamps
const rateLimitMap = new Map()
const RATE_LIMIT_WINDOW_MS = 60 * 60 * 1000 // 1 hour
const RATE_LIMIT_MAX = 3

function isRateLimited(sessionId, nodoId) {
  const key = `${sessionId}:${nodoId}`
  const now = Date.now()
  const timestamps = rateLimitMap.get(key) || []

  // Remove entries older than 1 hour
  const recent = timestamps.filter((t) => now - t < RATE_LIMIT_WINDOW_MS)
  rateLimitMap.set(key, recent)

  if (recent.length >= RATE_LIMIT_MAX) {
    return true
  }

  // Record this attempt
  recent.push(now)
  rateLimitMap.set(key, recent)
  return false
}

// --- Input sanitization ---
function escapeHtml(str) {
  if (!str) return str
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#x27;')
}

export async function GET(request) {
  try {
    const { searchParams } = new URL(request.url)
    const nodoId = searchParams.get('nodo_id')
    const aportes = await getApprovedAportes(nodoId)
    return Response.json(aportes)
  } catch (error) {
    console.error('Error en GET /api/aportes:', error)
    // Sin base de datos disponible: devolver lista vacía en vez de un 500,
    // así la sección no se rompe (los aportes locales se muestran en el cliente).
    return Response.json([])
  }
}

export async function POST(request) {
  try {
    const { nodo_id, contenido, autor_nombre, session_id } = await request.json()

    if (!contenido || !session_id) {
      return Response.json(
        { error: 'Faltan campos obligatorios: contenido, session_id' },
        { status: 400 }
      )
    }

    // Rate limiting
    if (isRateLimited(session_id, nodo_id || 'global')) {
      return Response.json(
        { error: 'Demasiados aportes. Máximo 3 por hora por tema.' },
        { status: 429 }
      )
    }

    // Sanitize inputs to prevent XSS
    const sanitizedContenido = escapeHtml(contenido)
    const sanitizedAutorNombre = escapeHtml(autor_nombre)

    try {
      const aporte = await createAporte({
        nodo_id,
        contenido: sanitizedContenido,
        autor_nombre: sanitizedAutorNombre,
      })
      return Response.json(aporte, { status: 201 })
    } catch (dbError) {
      // Sin base de datos: aceptar el aporte igual para no romper la UX.
      // El cliente lo guarda en el navegador para mostrarlo.
      console.error('Aportes en modo degradado (sin DB):', dbError)
      return Response.json(
        {
          id: `local-${Date.now()}`,
          nodo_id: nodo_id || null,
          contenido: sanitizedContenido,
          autor_nombre: sanitizedAutorNombre,
          estado: 'pendiente',
          created_at: new Date().toISOString(),
          persisted: false,
        },
        { status: 201 }
      )
    }
  } catch (error) {
    console.error('Error en POST /api/aportes:', error)
    return Response.json({ error: 'Error procesando la solicitud' }, { status: 500 })
  }
}
