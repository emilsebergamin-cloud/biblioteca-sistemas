'use client';

import Carousel3D from '@/components/Carousel3D';
import { BackgroundGradientAnimation } from '@/components/ui/BackgroundGradientAnimation';

export default function Biblioteca() {
  return (
    <BackgroundGradientAnimation
      containerStyle={{ height: 'calc(100vh - 56px)', overflow: 'hidden', background: '#1A1A1A' }}
      firstColor="168,180,216"
      secondColor="197,232,50"
      thirdColor="168,180,216"
      fourthColor="155,144,128"
      fifthColor="197,232,50"
      pointerColor="168,180,216"
      blendingValue="soft-light"
    >
      <div className="biblioteca-wrapper" style={{ paddingTop: '24px' }}>
        <p className="biblioteca-label" style={{
          textAlign: 'center', fontSize: '10px', fontWeight: 700,
          letterSpacing: '0.16em', textTransform: 'uppercase',
          color: '#C5E832', opacity: 0.8, marginBottom: '12px', paddingTop: '40px',
        }}>Los bloques</p>
        <p className="biblioteca-subtitle" style={{
          textAlign: 'center', fontSize: '13px',
          color: 'rgba(247,244,239,0.45)', marginBottom: '40px',
          fontStyle: 'italic', padding: '0 20px',
        }}>
          Cada bloque es independiente. Pero si arrancás por el 01,
          todo lo que sigue tiene más sentido.
        </p>
        <Carousel3D />
      </div>
    </BackgroundGradientAnimation>
  );
}
