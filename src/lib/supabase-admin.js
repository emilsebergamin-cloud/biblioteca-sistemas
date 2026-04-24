import { createClient } from '@supabase/supabase-js';

let client = null;

export function getSupabaseAdmin() {
  if (!client) {
    const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
    if (!key) {
      throw new Error('SUPABASE_SERVICE_ROLE_KEY is required for admin operations');
    }
    client = createClient(url, key);
  }
  return client;
}
