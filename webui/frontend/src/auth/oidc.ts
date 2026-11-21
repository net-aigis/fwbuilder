/** SPA OIDC login helpers (authorization code + PKCE). */

const apiBase = import.meta.env.VITE_API_BASE ?? "";
const PKCE_VERIFIER_KEY = "fwbweb.oidc.code_verifier";
const PKCE_STATE_KEY = "fwbweb.oidc.state";

export type AuthConfig = {
  token_auth: boolean;
  oidc: {
    enabled: boolean;
    login_enabled?: boolean;
    issuer?: string | null;
    client_id?: string | null;
    redirect_uri?: string | null;
    scopes?: string;
    authorization_endpoint?: string | null;
    note?: string;
    discovery_error?: string;
  };
};

export type MeInfo = { auth: string; user: string; method?: string };

function b64url(buf: ArrayBuffer): string {
  const bytes = new Uint8Array(buf);
  let s = "";
  for (let i = 0; i < bytes.length; i++) s += String.fromCharCode(bytes[i]!);
  return btoa(s).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}

function randomVerifier(len = 64): string {
  const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~";
  const arr = new Uint8Array(len);
  crypto.getRandomValues(arr);
  let out = "";
  for (let i = 0; i < len; i++) out += chars[arr[i]! % chars.length];
  return out;
}

async function challengeS256(verifier: string): Promise<string> {
  const data = new TextEncoder().encode(verifier);
  const dig = await crypto.subtle.digest("SHA-256", data);
  return b64url(dig);
}

export async function fetchAuthConfig(): Promise<AuthConfig> {
  const res = await fetch(`${apiBase}/api/v1/auth/config`);
  if (!res.ok) throw new Error(`auth/config ${res.status}`);
  return (await res.json()) as AuthConfig;
}

export async function fetchMe(token: string): Promise<MeInfo> {
  const res = await fetch(`${apiBase}/api/v1/me`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  if (!res.ok) throw new Error(`me ${res.status}`);
  return (await res.json()) as MeInfo;
}

export async function startOidcLogin(redirectUri?: string): Promise<void> {
  const verifier = randomVerifier();
  const state = randomVerifier(32);
  const challenge = await challengeS256(verifier);
  sessionStorage.setItem(PKCE_VERIFIER_KEY, verifier);
  sessionStorage.setItem(PKCE_STATE_KEY, state);
  const q = new URLSearchParams({
    state,
    code_challenge: challenge,
  });
  if (redirectUri) q.set("redirect_uri", redirectUri);
  const res = await fetch(`${apiBase}/api/v1/auth/oidc/authorize-url?${q}`);
  if (!res.ok) {
    const t = await res.text();
    throw new Error(`authorize-url ${res.status}: ${t}`);
  }
  const body = (await res.json()) as { url: string };
  window.location.assign(body.url);
}

export async function completeOidcCallback(): Promise<string | null> {
  const params = new URLSearchParams(window.location.search);
  const code = params.get("code");
  const state = params.get("state");
  if (!code) return null;
  const expect = sessionStorage.getItem(PKCE_STATE_KEY);
  if (!state || !expect || state !== expect) {
    throw new Error("OIDC state mismatch");
  }
  const verifier = sessionStorage.getItem(PKCE_VERIFIER_KEY);
  if (!verifier) throw new Error("OIDC code_verifier missing");
  const redirectUri =
    (await fetchAuthConfig()).oidc.redirect_uri || `${window.location.origin}/`;
  const res = await fetch(`${apiBase}/api/v1/auth/oidc/token`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      code,
      code_verifier: verifier,
      redirect_uri: redirectUri,
    }),
  });
  if (!res.ok) {
    const t = await res.text();
    throw new Error(`token exchange ${res.status}: ${t}`);
  }
  const body = (await res.json()) as { access_token?: string };
  sessionStorage.removeItem(PKCE_VERIFIER_KEY);
  sessionStorage.removeItem(PKCE_STATE_KEY);
  // Clean query string
  const url = new URL(window.location.href);
  url.searchParams.delete("code");
  url.searchParams.delete("state");
  url.searchParams.delete("session_state");
  window.history.replaceState({}, "", url.pathname + url.search + url.hash);
  if (!body.access_token) throw new Error("no access_token in exchange response");
  return body.access_token;
}
