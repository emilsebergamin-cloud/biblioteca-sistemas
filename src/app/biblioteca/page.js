import { getBloques } from '@/lib/contenido';
import BibliotecaView from './BibliotecaView';

// Lee los bloques en el build y los pasa ya renderizados a la vista,
// así la librería no necesita pedir datos al cargar.
export default async function Biblioteca() {
  const bloques = await getBloques();
  return <BibliotecaView bloques={bloques} />;
}
