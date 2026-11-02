export type TreeNode = {
  id: string;
  name: string;
  type: string;
  comment?: string;
  ro?: boolean;
  children_count?: number;
  attrs?: Record<string, string | number>;
  children?: TreeNode[];
  rulesets?: { policy?: string; nat?: string; routing?: string };
};

export type RuleRef = { id: string; name: string; type: string };

export type RuleElement = {
  id?: string;
  neg?: boolean;
  any?: boolean;
  objects?: RuleRef[];
};

export type PolicyRule = {
  id: string;
  type: "PolicyRule";
  position: number;
  disabled: boolean;
  action: string;
  direction: string;
  logging: boolean;
  comment: string;
  group?: string;
  src?: RuleElement;
  dst?: RuleElement;
  srv?: RuleElement;
  itf?: RuleElement;
  when?: RuleElement;
};

export type NatRule = {
  id: string;
  type: "NATRule";
  position: number;
  disabled: boolean;
  action: string;
  rule_type?: string;
  comment: string;
  osrc?: RuleElement;
  odst?: RuleElement;
  osrv?: RuleElement;
  tsrc?: RuleElement;
  tdst?: RuleElement;
  tsrv?: RuleElement;
};

export type RoutingRuleRow = {
  id: string;
  type: "RoutingRule";
  position: number;
  disabled: boolean;
  metric: number;
  rule_type?: string;
  comment: string;
  rdst?: RuleElement;
  rgtw?: RuleElement;
  ritf?: RuleElement;
};

export type AnyRule = PolicyRule | NatRule | RoutingRuleRow;

export type RulesetResponse = {
  ok?: boolean;
  ruleset_id: string;
  ruleset_type: string;
  name: string;
  rules: AnyRule[];
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
  body: { name?: string; comment?: string; attrs?: Record<string, string | number> },
) {
  return api<TreeNode>(`/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}`, {
    method: "PATCH",
    body: JSON.stringify(body),
  });
}

export function fetchRuleset(
  sessionId: string,
  objectId: string,
  which: "policy" | "nat" | "routing" = "policy",
) {
  return api<RulesetResponse>(
    `/api/v1/projects/${sessionId}/rulesets/${encodeURIComponent(objectId)}?which=${which}`,
  );
}

export function updateRule(
  sessionId: string,
  ruleId: string,
  body: {
    disabled?: boolean;
    comment?: string;
    action?: string;
    direction?: string;
    logging?: boolean;
    metric?: number;
  },
) {
  return api<AnyRule>(`/api/v1/projects/${sessionId}/rules/${encodeURIComponent(ruleId)}`, {
    method: "PATCH",
    body: JSON.stringify(body),
  });
}

export function addRule(
  sessionId: string,
  objectId: string,
  body: {
    which?: "policy" | "nat" | "routing";
    where?: "top" | "bottom" | "before" | "after";
    position?: number;
  } = {},
) {
  return api<AnyRule>(
    `/api/v1/projects/${sessionId}/rulesets/${encodeURIComponent(objectId)}/rules`,
    { method: "POST", body: JSON.stringify(body) },
  );
}

export function deleteRule(sessionId: string, ruleId: string) {
  return api<{ ok?: boolean }>(
    `/api/v1/projects/${sessionId}/rules/${encodeURIComponent(ruleId)}`,
    { method: "DELETE" },
  );
}

export function moveRule(
  sessionId: string,
  ruleId: string,
  body: { direction?: "up" | "down"; to?: number },
) {
  return api<AnyRule>(
    `/api/v1/projects/${sessionId}/rules/${encodeURIComponent(ruleId)}/move`,
    { method: "POST", body: JSON.stringify(body) },
  );
}

export function addRuleRef(
  sessionId: string,
  ruleId: string,
  element: string,
  objectId: string,
) {
  return api<AnyRule>(
    `/api/v1/projects/${sessionId}/rules/${encodeURIComponent(ruleId)}/refs`,
    { method: "POST", body: JSON.stringify({ element, object_id: objectId }) },
  );
}

export function removeRuleRef(
  sessionId: string,
  ruleId: string,
  element: string,
  objectId: string,
) {
  return api<AnyRule>(
    `/api/v1/projects/${sessionId}/rules/${encodeURIComponent(ruleId)}/refs/remove`,
    { method: "POST", body: JSON.stringify({ element, object_id: objectId }) },
  );
}

export function setRuleAny(sessionId: string, ruleId: string, element: string) {
  return api<AnyRule>(
    `/api/v1/projects/${sessionId}/rules/${encodeURIComponent(ruleId)}/any`,
    { method: "POST", body: JSON.stringify({ element }) },
  );
}

export function compileFirewall(
  sessionId: string,
  firewallId: string,
  ipv?: "4" | "6",
) {
  return api<{
    ok: boolean;
    compiler: string;
    firewall: string;
    platform: string;
    destdir: string;
    outputs: string[];
    log: string;
  }>(`/api/v1/projects/${sessionId}/compile`, {
    method: "POST",
    body: JSON.stringify({ firewall_id: firewallId, ipv }),
  });
}

export function compileOutputUrl(sessionId: string, filename: string): string {
  const qs = new URLSearchParams();
  // Auth is header-based; for <a download> we append token as query for convenience
  // is not supported — use fetch blob helper instead.
  void qs;
  return `${apiBase}/api/v1/projects/${sessionId}/compile/outputs/${encodeURIComponent(filename)}`;
}

export async function downloadCompileOutput(sessionId: string, filename: string): Promise<void> {
  const res = await fetch(compileOutputUrl(sessionId, filename), {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
  if (!res.ok) {
    throw new Error(`${res.status}: ${await res.text()}`);
  }
  const blob = await res.blob();
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

export function searchObjects(sessionId: string, q: string, type = "") {
  const qs = new URLSearchParams({ q, type, limit: "80" });
  return api<{ results: TreeNode[]; count: number }>(
    `/api/v1/projects/${sessionId}/search?${qs.toString()}`,
  );
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

export function formatRuleObjects(el?: RuleElement): string {
  if (!el) return "";
  const prefix = el.neg ? "!" : "";
  if (el.any || !el.objects?.length) return `${prefix}Any`;
  return prefix + el.objects.map((o) => o.name).join(", ");
}
