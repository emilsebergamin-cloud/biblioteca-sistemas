'use client';
import { useEffect, useRef, useState } from 'react';

export const BackgroundGradientAnimation = ({ children, containerStyle = {} }) => {
  const interactiveRef = useRef(null);
  const curXRef = useRef(0);
  const curYRef = useRef(0);
  const tgXRef = useRef(0);
  const tgYRef = useRef(0);
  const rafRef = useRef(null);
  const [isSafari, setIsSafari] = useState(false);

  useEffect(() => {
    setIsSafari(/^((?!chrome|android).)*safari/i.test(navigator.userAgent));
  }, []);

  useEffect(() => {
    const animate = () => {
      if (interactiveRef.current) {
        curXRef.current += (tgXRef.current - curXRef.current) / 20;
        curYRef.current += (tgYRef.current - curYRef.current) / 20;
        interactiveRef.current.style.transform =
          `translate(${Math.round(curXRef.current)}px, ${Math.round(curYRef.current)}px)`;
      }
      rafRef.current = requestAnimationFrame(animate);
    };
    rafRef.current = requestAnimationFrame(animate);
    return () => cancelAnimationFrame(rafRef.current);
  }, []);

  const handleMouseMove = (e) => {
    if (!interactiveRef.current) return;
    const rect = e.currentTarget.getBoundingClientRect();
    tgXRef.current = e.clientX - rect.left;
    tgYRef.current = e.clientY - rect.top;
  };

  return (
    <div
      onMouseMove={handleMouseMove}
      style={{
        position: 'relative',
        overflow: 'hidden',
        background: 'linear-gradient(40deg, #F7F4EF, #EFEBE3)',
        ...containerStyle,
      }}
    >
      <svg style={{ display: 'none' }}>
        <defs>
          <filter id="blurMe">
            <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur" />
            <feColorMatrix in="blur" mode="matrix"
              values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -8" result="goo" />
            <feBlend in="SourceGraphic" in2="goo" />
          </filter>
        </defs>
      </svg>

      <div style={{ position: 'relative', zIndex: 10 }}>
        {children}
      </div>

      <div
        style={{
          position: 'absolute', inset: 0,
          filter: isSafari ? 'blur(24px)' : 'url(#blurMe) blur(40px)',
        }}
        className="gradients-container"
      >
        <div className="animate-first" style={{
          position: 'absolute',
          background: 'radial-gradient(circle at center, rgba(168,180,216,0.9) 0, rgba(168,180,216,0) 50%) no-repeat',
          mixBlendMode: 'hard-light',
          width: '50%', height: '50%',
          top: '25%', left: '25%',
          transformOrigin: 'center center',
          opacity: 1,
        }} />
        <div className="animate-second" style={{
          position: 'absolute',
          background: 'radial-gradient(circle at center, rgba(200,192,176,0.8) 0, rgba(200,192,176,0) 50%) no-repeat',
          mixBlendMode: 'hard-light',
          width: '50%', height: '50%',
          top: '25%', left: '25%',
          transformOrigin: 'calc(50% - 400px)',
          opacity: 1,
        }} />
        <div className="animate-third" style={{
          position: 'absolute',
          background: 'radial-gradient(circle at center, rgba(168,180,216,0.7) 0, rgba(168,180,216,0) 50%) no-repeat',
          mixBlendMode: 'hard-light',
          width: '50%', height: '50%',
          top: '25%', left: '25%',
          transformOrigin: 'calc(50% + 400px)',
          opacity: 1,
        }} />
        <div className="animate-fourth" style={{
          position: 'absolute',
          background: 'radial-gradient(circle at center, rgba(155,144,128,0.6) 0, rgba(155,144,128,0) 50%) no-repeat',
          mixBlendMode: 'hard-light',
          width: '50%', height: '50%',
          top: '25%', left: '25%',
          transformOrigin: 'calc(50% - 200px)',
          opacity: 0.7,
        }} />
        <div className="animate-fifth" style={{
          position: 'absolute',
          background: 'radial-gradient(circle at center, rgba(168,180,216,0.8) 0, rgba(168,180,216,0) 50%) no-repeat',
          mixBlendMode: 'hard-light',
          width: '50%', height: '50%',
          top: '25%', left: '25%',
          transformOrigin: 'calc(50% - 800px) calc(50% + 800px)',
          opacity: 1,
        }} />
        <div
          ref={interactiveRef}
          style={{
            position: 'absolute',
            background: 'radial-gradient(circle at center, rgba(200,192,176,0.7) 0, rgba(200,192,176,0) 50%) no-repeat',
            mixBlendMode: 'hard-light',
            width: '200%', height: '200%',
            top: '-50%', left: '-50%',
            opacity: 0.7,
          }}
        />
      </div>
    </div>
  );
};
