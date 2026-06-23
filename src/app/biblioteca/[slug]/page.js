import { notFound } from 'next/navigation';
import { getBloqueDetalle, slugsDeBloques } from '@/lib/contenido';
import BloqueClient from './BloqueClient';

// Pre-genera las páginas de cada bloque en el build → se sirven como HTML
// estático desde la CDN, sin fetch ni espera en el navegador.
export function generateStaticParams() {
  return slugsDeBloques();
}

export const dynamicParams = true;

export default async function BloquePage({ params }) {
  const { slug } = await params;
  const data = await getBloqueDetalle(slug);

  if (!data) notFound();

  return (
    <BloqueClient
      bloque={data.bloque}
      nodos={data.nodos}
      allBloques={data.allBloques}
      slug={slug}
    />
  );
}
