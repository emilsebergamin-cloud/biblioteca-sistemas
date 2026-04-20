/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      keyframes: {
        first: { '0%, 100%': { transform: 'translate(0%, 0%) rotate(0deg)' }, '50%': { transform: 'translate(-20%, 10%) rotate(180deg)' } },
        second: { '0%, 100%': { transform: 'rotate(0deg) translate(5%, -10%)' }, '50%': { transform: 'rotate(180deg) translate(-5%, 10%)' } },
        third: { '0%, 100%': { transform: 'translate(0%, 5%) rotate(0deg)' }, '50%': { transform: 'translate(10%, -5%) rotate(180deg)' } },
        fourth: { '0%, 100%': { transform: 'translate(-5%, 0%) rotate(0deg)' }, '50%': { transform: 'translate(5%, 10%) rotate(180deg)' } },
        fifth: { '0%, 100%': { transform: 'translate(0%, 0%) rotate(0deg)' }, '50%': { transform: 'translate(-10%, -5%) rotate(180deg)' } },
      },
      animation: {
        first: 'first 8s ease infinite',
        second: 'second 10s ease infinite',
        third: 'third 12s ease infinite',
        fourth: 'fourth 9s ease infinite',
        fifth: 'fifth 11s ease infinite',
      },
    },
  },
  plugins: [],
};
