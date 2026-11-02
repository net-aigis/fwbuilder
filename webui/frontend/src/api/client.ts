export type TreeNode = {
  id: string;
  name: string;
  type: string;
  comment?: string;
  ro?: boolean;
  children_count?: number;
  attrs?: Record<string, string>;
  children?: TreeNode[];
};

const tokenKey = "fwbweb_token";
const apiBase = import.meta.env.VITE_API_BASE ?? "";

export function getToken(): string {
  return localStorage.getItem(tokenKey) ?? "dev-token";
}

export function setToken(token: string): void {
  localStorage.setItem(tokenKey, token);
}

async function api<T>(path: string, init: RequestInit = {}): Promise<T> {
  const headers = new Headers(init.headers);
  headers.set("Authorization", `Bearer ${getToken()}`);
  if (init.body && !headers.has("Content-Type")) {
    headers.set("Content-Type", "application/json");
  }
  const res = await fetch(`${apiBase}${path}`, { ...init, headers });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`${res.status}: ${text}`);
  }
  if (res.status === 204) {
    return undefined as T;
  }
  return (await res.json()) as T;
}

export function openProject(path: string) {
  return api<{ session_id: string; path: string; work_path: string; root_id?: string }>(
    "/api/v1/projects/open",
    { method: "POST", body: JSON.stringify({ path, copy_to_workspace: true }) },
  );
}

export function fetchTree(sessionId: string, depth = 4) {
  return api<{ dirty: boolean; path: string; root: TreeNode }>(
    `/api/v1/projects/${sessionId}/tree?depth=${depth}`,
  );
}

export function fetchObject(sessionId: string, objectId: string) {
  return api<TreeNode>(`/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}`);
}

export function updateObject(
  sessionId: string,
  objectId: string,
  body: { name?: string; comment?: string; attrs?: Record<string, string> },
) {
  return api<TreeNode>(`/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}`, {
    method: "PATCH",
    body: JSON.stringify(body),
  });
}

export function saveProject(sessionId: string, writeThrough = false) {
  return api<{ ok: boolean; path: string }>(`/api/v1/projects/${sessionId}/save`, {
    method: "POST",
    body: JSON.stringify({ write_through: writeThrough }),
  });
}

export function closeProject(sessionId: string) {
  return api<void>(`/api/v1/projects/${sessionId}/close`, { method: "POST" });
}
