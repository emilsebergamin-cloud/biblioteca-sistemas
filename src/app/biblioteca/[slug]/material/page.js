import { notFound } from 'next/navigation';
import { getMaterial, slugsDeBloques } from '@/lib/contenido';
import MaterialClient from './MaterialClient';

// Pre-genera la página de material de cada bloque en el build.
export function generateStaticParams() {
  return slugsDeBloques();
}

export const dynamicParams = true;

export default async function MaterialPage({ params }) {
  const { slug } = await params;
  const data = await getMaterial(slug);

  if (!data) notFound();

  return (
    <MaterialClient
      bloque={data.bloque}
      nodos={data.nodos}
      quizPreguntas={data.quizPreguntas}
      recursos={data.recursos}
      slug={slug}
    />
  );
}
