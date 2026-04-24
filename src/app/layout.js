import { Plus_Jakarta_Sans } from "next/font/google";
import "./globals.css";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";

const jakarta = Plus_Jakarta_Sans({
  variable: "--font-jakarta",
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  style: ["normal", "italic"],
});

export const metadata = {
  metadataBase: new URL("https://biblai.app"),
  title: "Bibl·AI — Entendé cómo funcionan los sistemas digitales",
  description:
    "Biblioteca educativa para gente curiosa que quiere entender tecnología desde el principio. Sin jerga, con analogías reales. El saber no ocupa lugar.",
  icons: {
    icon: "/images/favicon-bai.png",
    apple: "/images/favicon-bai.png",
  },
  openGraph: {
    title: "Bibl·AI — Entendé cómo funcionan los sistemas digitales",
    description: "Biblioteca educativa para gente curiosa que quiere entender tecnología desde el principio. Sin jerga, con analogías reales. El saber no ocupa lugar.",
    images: [{ url: "/images/og-image.png", width: 1200, height: 630 }],
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "Bibl·AI — Entendé cómo funcionan los sistemas digitales",
    description: "Biblioteca educativa para gente curiosa que quiere entender tecnología desde el principio. Sin jerga, con analogías reales. El saber no ocupa lugar.",
    images: ["/images/og-image.png"],
  },
};

export default function RootLayout({ children }) {
  return (
    <html
      lang="es"
      className={`${jakarta.variable} h-full antialiased`}
    >
      <body className="min-h-full flex flex-col font-sans">
        <Navbar />
        <main className="flex-1">{children}</main>
        <Footer />
      </body>
    </html>
  );
}
