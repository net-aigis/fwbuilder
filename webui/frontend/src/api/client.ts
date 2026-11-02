export type RulesetListEntry = {
  id: string;
  name: string;
  type: string;
  top?: boolean;
};

export type TreeNode = {
  id: string;
  name: string;
  type: string;
  comment?: string;
  ro?: boolean;
  parent_id?: string;
  parent_type?: string;
  library_id?: string;
  library_name?: string;
  deleted?: boolean;
  deleted_from_parent_id?: string;
  children_count?: number;
  attrs?: Record<string, string | number>;
  children?: TreeNode[];
  rulesets?: { policy?: string; nat?: string; routing?: string };
  ruleset_list?: RulesetListEntry[];
};

export type ObjectPathEntry = { id: string; name: string; type: string };

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
  branch_id?: string;
  branch_name?: string;
  branch_type?: string;
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
  group?: string;
  branch_id?: string;
  branch_name?: string;
  branch_type?: string;
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
  group?: string;
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

export function newProject(name = "untitled.fwb", libraryName = "User") {
  return api<{ session_id: string; path: string; work_path: string; root_id?: string }>(
    "/api/v1/projects/new",
    {
      method: "POST",
      body: JSON.stringify({ name, library_name: libraryName }),
    },
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

export function setObjectRo(sessionId: string, objectId: string, ro: boolean) {
  return api<TreeNode>(
    `/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/ro`,
    { method: "POST", body: JSON.stringify({ ro }) },
  );
}

export function createObject(
  sessionId: string,
  body: {
    parent_id: string;
    type: string;
    name: string;
    comment?: string;
    attrs?: Record<string, string | number>;
  },
) {
  return api<TreeNode>(`/api/v1/projects/${sessionId}/objects`, {
    method: "POST",
    body: JSON.stringify(body),
  });
}

export function deleteObject(sessionId: string, objectId: string, permanent = false) {
  // UI default: soft-delete. Pass permanent=true to purge.
  const qs = permanent ? "?permanent=true" : "?soft=true";
  return api<{
    ok?: boolean;
    parent_id?: string;
    soft_deleted?: boolean;
    purged?: boolean;
    deleted_library_id?: string;
  }>(`/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}${qs}`, {
    method: "DELETE",
  });
}

export function emptyDeletedObjects(sessionId: string) {
  return api<{ ok?: boolean; purged_count?: number; dirty?: boolean }>(
    `/api/v1/projects/${sessionId}/empty-deleted`,
    { method: "POST", body: "{}" },
  );
}

export function listDeletedObjects(sessionId: string) {
  return api<{
    count: number;
    deleted_library_id?: string;
    objects: Array<{
      id: string;
      name: string;
      type: string;
      comment?: string;
      deleted_from_parent_id?: string;
    }>;
  }>(`/api/v1/projects/${sessionId}/deleted`);
}

export function restoreDeletedObject(
  sessionId: string,
  objectId: string,
  parentId?: string,
) {
  return api<TreeNode>(
    `/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/restore`,
    {
      method: "POST",
      body: JSON.stringify(parentId ? { parent_id: parentId } : {}),
    },
  );
}

export function fetchObjectPath(sessionId: string, objectId: string) {
  return api<{ count: number; path: ObjectPathEntry[] }>(
    `/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/path`,
  );
}

export function findUnusedObjects(sessionId: string, limit = 200) {
  return api<{
    count: number;
    objects: Array<{
      id: string;
      name: string;
      type: string;
      comment?: string;
      parent_id?: string;
    }>;
  }>(`/api/v1/projects/${sessionId}/unused?limit=${limit}`);
}

export function listSessions() {
  return api<{
    count: number;
    sessions: Array<{
      session_id: string;
      path: string;
      work_path?: string;
      copy?: boolean;
      new?: boolean;
    }>;
  }>("/api/v1/sessions");
}

export function reparentObject(sessionId: string, objectId: string, parentId: string) {
  return api<TreeNode>(
    `/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/reparent`,
    { method: "POST", body: JSON.stringify({ parent_id: parentId }) },
  );
}

export function duplicateObject(
  sessionId: string,
  objectId: string,
  body?: { parent_id?: string; name?: string },
) {
  return api<TreeNode>(
    `/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/duplicate`,
    { method: "POST", body: JSON.stringify(body ?? {}) },
  );
}

export function fetchWhereUsed(sessionId: string, objectId: string) {
  return api<{
    object_id: string;
    count: number;
    uses: Array<{
      id: string;
      name: string;
      type: string;
      parent_id?: string;
      parent_name?: string;
      parent_type?: string;
    }>;
  }>(`/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/where-used`);
}

export function fetchMembers(sessionId: string, objectId: string) {
  return api<{
    object_id: string;
    count: number;
    members: Array<{ id: string; name: string; type: string }>;
  }>(`/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/members`);
}

export function addMember(sessionId: string, objectId: string, memberId: string) {
  return api<{ object_id: string; count: number; members: Array<{ id: string; name: string; type: string }> }>(
    `/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/members`,
    { method: "POST", body: JSON.stringify({ member_id: memberId }) },
  );
}

export function removeMember(sessionId: string, objectId: string, memberId: string) {
  return api<{ object_id: string; count: number; members: Array<{ id: string; name: string; type: string }> }>(
    `/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/members/${encodeURIComponent(memberId)}`,
    { method: "DELETE" },
  );
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
    group?: string;
    action?: string;
    direction?: string;
    logging?: boolean;
    metric?: number;
    branch_id?: string;
  },
) {
  return api<AnyRule>(`/api/v1/projects/${sessionId}/rules/${encodeURIComponent(ruleId)}`, {
    method: "PATCH",
    body: JSON.stringify(body),
  });
}

export function downloadProjectUrl(sessionId: string) {
  return `/api/v1/projects/${sessionId}/download`;
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

export function duplicateRule(sessionId: string, ruleId: string, rulesetId?: string) {
  return api<AnyRule>(
    `/api/v1/projects/${sessionId}/rules/${encodeURIComponent(ruleId)}/duplicate`,
    {
      method: "POST",
      body: JSON.stringify(rulesetId ? { ruleset_id: rulesetId } : {}),
    },
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

export function setRuleNeg(sessionId: string, ruleId: string, element: string, neg: boolean) {
  return api<AnyRule>(
    `/api/v1/projects/${sessionId}/rules/${encodeURIComponent(ruleId)}/neg`,
    { method: "POST", body: JSON.stringify({ element, neg }) },
  );
}

export function fetchPlatforms() {
  return api<{
    platforms: Array<{
      name: string;
      description: string;
      status: string;
      group: string;
      compiler: string;
      supported_os: string[];
    }>;
    oses: Array<{ name: string; description: string; status: string; family: string }>;
  }>("/api/v1/platforms");
}

export type OptionFieldMeta = {
  type?: string;
  choices?: string[];
  widget?: string;
  widget_class?: string;
};

export function fetchOptionSchema(platform: string, hostOs = "") {
  const qs = new URLSearchParams({ platform, host_os: hostOs });
  return api<{
    platform: string;
    host_os?: string | null;
    compiler?: string;
    dialog?: string;
    description?: string;
    supported_os?: string[];
    capabilities?: Record<string, string>;
    defaults: Record<string, string>;
    groups: Array<{ id: string; title: string; keys: string[] }>;
    featured_keys: string[];
    fields?: Record<string, OptionFieldMeta>;
    dialog_field_count?: number;
  }>(`/api/v1/option-schema?${qs.toString()}`);
}

export function fetchInterfaceOptionSchema(hostOs: string) {
  const qs = new URLSearchParams({ host_os: hostOs });
  return api<{
    host_os: string;
    interface_dialog?: string | null;
    dialog_stem?: string | null;
    supports_advanced_interface_options?: boolean;
    defaults: Record<string, string>;
    groups: Array<{ id: string; title: string; keys: string[] }>;
    featured_keys: string[];
    fields?: Record<string, OptionFieldMeta>;
    dialog_field_count?: number;
  }>(`/api/v1/interface-option-schema?${qs.toString()}`);
}

export function fetchRuleOptionSchema(ruleKind: string = "policy") {
  const qs = new URLSearchParams({ rule_kind: ruleKind });
  return api<{
    rule_kind: string;
    dialog_stem?: string | null;
    groups: Array<{ id: string; title: string; keys: string[] }>;
    featured_keys: string[];
    fields?: Record<string, OptionFieldMeta>;
    dialog_field_count?: number;
  }>(`/api/v1/rule-option-schema?${qs.toString()}`);
}

export function fetchObjectOptions(sessionId: string, objectId: string) {
  return fetchOptions(sessionId, objectId);
}

export function fetchOptions(sessionId: string, objectId: string) {
  return api<{
    object_id: string;
    options_id: string;
    options: Record<string, string>;
    dirty?: boolean;
    host_OS?: string;
    platform?: string;
  }>(`/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/options`);
}

export function updateOptions(
  sessionId: string,
  objectId: string,
  options: Record<string, string>,
) {
  return api<{
    object_id: string;
    options: Record<string, string>;
    dirty?: boolean;
  }>(`/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/options`, {
    method: "PATCH",
    body: JSON.stringify({ options }),
  });
}

export function fetchManagement(sessionId: string, objectId: string) {
  return api<{
    object_id: string;
    management: {
      address?: string;
      install_script?: { enabled?: boolean; command?: string; arguments?: string };
    };
  }>(`/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/management`);
}

export function updateManagement(
  sessionId: string,
  objectId: string,
  body: {
    address?: string;
    install_script?: { enabled?: boolean; command?: string; arguments?: string };
  },
) {
  return api<{ object_id: string; management: Record<string, unknown>; dirty?: boolean }>(
    `/api/v1/projects/${sessionId}/objects/${encodeURIComponent(objectId)}/management`,
    { method: "PATCH", body: JSON.stringify(body) },
  );
}

export function deployFirewall(
  sessionId: string,
  body: {
    firewall_id: string;
    host?: string;
    user?: string;
    remote_dir?: string;
    activate?: boolean;
    compile_first?: boolean;
    dry_run?: boolean;
  },
) {
  return api<{
    ok: boolean;
    firewall: string;
    platform: string;
    installer_options: Record<string, string>;
    compile: { outputs?: string[]; destdir?: string; log?: string };
    deploy: {
      dry_run: boolean;
      host: string;
      user: string;
      remote_path: string;
      commands: string[];
      log: string;
      note?: string;
    };
  }>(`/api/v1/projects/${sessionId}/deploy`, {
    method: "POST",
    body: JSON.stringify(body),
  });
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

export function compileAllFirewalls(sessionId: string, ipv?: "4" | "6") {
  return api<{
    ok: boolean;
    count: number;
    succeeded: number;
    failed: number;
    results: Array<{
      firewall_id: string;
      name?: string;
      ok: boolean;
      platform?: string;
      outputs?: string[];
      destdir?: string;
      log?: string;
      error?: string;
    }>;
  }>(`/api/v1/projects/${sessionId}/compile-all`, {
    method: "POST",
    body: JSON.stringify({ ipv, continue_on_error: true }),
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

export async function downloadCompileOutputsZip(sessionId: string): Promise<void> {
  const res = await fetch(`${apiBase}/api/v1/projects/${sessionId}/compile/zip`, {
    headers: { Authorization: `Bearer ${getToken()}` },
  });
  if (!res.ok) {
    throw new Error(`${res.status}: ${await res.text()}`);
  }
  const blob = await res.blob();
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = "compile-outputs.zip";
  a.click();
  URL.revokeObjectURL(url);
}

export function searchObjects(sessionId: string, q: string, type = "") {
  const qs = new URLSearchParams({ q, type, limit: "80" });
  return api<{ results: TreeNode[]; count: number }>(
    `/api/v1/projects/${sessionId}/search?${qs.toString()}`,
  );
}

export function saveProject(sessionId: string, writeThrough = false, saveAs?: string) {
  return api<{ ok: boolean; path: string; source_path?: string; work_path?: string }>(
    `/api/v1/projects/${sessionId}/save`,
    {
      method: "POST",
      body: JSON.stringify({
        write_through: writeThrough,
        ...(saveAs ? { save_as: saveAs } : {}),
      }),
    },
  );
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
