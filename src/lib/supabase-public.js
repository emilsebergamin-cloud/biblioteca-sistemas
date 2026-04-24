import { createClient } from '@supabase/supabase-js';

let client = null;

export function getSupabasePublic() {
  if (!client) {
    const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
    client = createClient(url, key);
  }
  return client;
}
