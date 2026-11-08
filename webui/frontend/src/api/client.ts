export type RulesetListEntry = {
  id: string;
  name: string;
  type: string;
  top?: boolean;
  rule_count?: number;
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

export type ProjectStats = {
  ok?: boolean;
  path?: string;
  dirty?: boolean;
  libraries: number;
  objects: number;
  firewalls: number;
  clusters?: number;
  hosts: number;
  interfaces: number;
  services: number;
  addresses: number;
  rulesets?: number;
  rules: number;
  deleted: number;
  unused?: number;
};

export function fetchProjectStats(sessionId: string) {
  return api<ProjectStats>(`/api/v1/projects/${sessionId}/stats`);
}

export type ProjectSessionInfo = {
  session_id: string;
  path: string;
  work_path?: string;
  copy?: boolean;
  new?: boolean;
};

export function listSessions() {
  return api<{
    count: number;
    sessions: ProjectSessionInfo[];
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
  label?: string;
  tooltip?: string;
  whats_this?: string;
  read_only?: boolean;
  widget?: string;
  widget_class?: string;
  grid?: { row?: number; column?: number; rowspan?: number; colspan?: number };
  size_policy?: { horizontal?: string; vertical?: string };
  minimum_size?: { width?: number; height?: number };
  maximum_size?: { width?: number; height?: number };
  alignment?: string;
  external_label?: boolean;
  enabled?: boolean;
  visible?: boolean;
};

export function fetchOptionSchema(platform: string, hostOs = "") {
  const qs = new URLSearchParams({ platform, host_os: hostOs });
  return api<{
    platform: string;
    host_os?: string | null;
    compiler?: string;
    dialog?: string;
    description?: string;
    window_title?: string;
    geometry?: { width?: number; height?: number };
    tab_position?: string;
    size_grip_enabled?: boolean;
    layout_fidelity?: {
      score_percent?: number;
      score_parts_count?: number;
      pixel_parity?: boolean;
      path?: string;
      stacked_sections?: number;
      with_visible?: number;
      layout_tree_max_depth?: number;
      buddy_labels?: number;
      signal_key_count?: number;
    };
    supported_os?: string[];
    capabilities?: Record<string, string>;
    defaults: Record<string, string>;
    groups: Array<{
      id: string;
      title: string;
      keys: string[];
      tooltip?: string;
      sections?: Array<{
        id: string;
        title: string;
        keys: string[];
        flat?: boolean;
        checkable?: boolean;
        checked?: boolean;
        enabled?: boolean;
        stacked?: boolean;
        stack?: string;
        stack_index?: number;
        empty?: boolean;
      }>;
      layout_tree?: unknown[];
      spacers?: Array<{
        row?: number;
        column?: number;
        rowspan?: number;
        colspan?: number;
        orientation?: string;
        size_type?: string;
        name?: string;
        size_hint?: { width?: number; height?: number };
      }>;
      column_stretch?: number[];
      row_stretch?: number[];
      layouts?: Record<string, number>;
      spacing?: {
        spacing?: number;
        horizontal?: number;
        vertical?: number;
        margin_left?: number;
        margin_top?: number;
        margin_right?: number;
        margin_bottom?: number;
      };
      annotations?: Array<{
        text: string;
        row?: number;
        column?: number;
        rowspan?: number;
        colspan?: number;
        name?: string;
        alignment?: string;
      }>;
      buddy_labels?: Array<{
        text: string;
        buddy: string;
        row?: number;
        column?: number;
        rowspan?: number;
        colspan?: number;
        name?: string;
        alignment?: string;
      }>;
    }>;
    featured_keys: string[];
    fields?: Record<string, OptionFieldMeta>;
    dialog_field_count?: number;
    dialog_stem?: string | null;
    stack_switch?: Array<{
      stack: string;
      option: string;
      when_true: number;
      when_false: number;
      preview_only?: boolean;
      note?: string;
    }>;
    option_enable?: Array<{
      target: string;
      when_option: string;
      when_in: string[];
      note?: string;
    }>;
  }>(`/api/v1/option-schema?${qs.toString()}`);
}

type SchemaGroup = {
  id: string;
  title: string;
  keys: string[];
  tooltip?: string;
  sections?: Array<{
    id: string;
    title: string;
    keys: string[];
    flat?: boolean;
    checkable?: boolean;
    checked?: boolean;
    enabled?: boolean;
    stacked?: boolean;
    stack?: string;
    stack_index?: number;
    empty?: boolean;
  }>;
  spacers?: Array<{
    row?: number;
    column?: number;
    rowspan?: number;
    colspan?: number;
    orientation?: string;
    size_type?: string;
    name?: string;
    size_hint?: { width?: number; height?: number };
  }>;
  column_stretch?: number[];
  row_stretch?: number[];
  layouts?: Record<string, number>;
  spacing?: {
    spacing?: number;
    horizontal?: number;
    vertical?: number;
    margin_left?: number;
    margin_top?: number;
    margin_right?: number;
    margin_bottom?: number;
  };
  annotations?: Array<{
    text: string;
    row?: number;
    column?: number;
    rowspan?: number;
    colspan?: number;
    name?: string;
    alignment?: string;
  }>;
  buddy_labels?: Array<{
    text: string;
    buddy: string;
    row?: number;
    column?: number;
    rowspan?: number;
    colspan?: number;
    name?: string;
    alignment?: string;
  }>;
};

export function fetchInterfaceOptionSchema(hostOs: string) {
  const qs = new URLSearchParams({ host_os: hostOs });
  return api<{
    host_os: string;
    interface_dialog?: string | null;
    dialog_stem?: string | null;
    supports_advanced_interface_options?: boolean;
    defaults: Record<string, string>;
    groups: SchemaGroup[];
    featured_keys: string[];
    fields?: Record<string, OptionFieldMeta>;
    dialog_field_count?: number;
    layout_fidelity?: {
      score_percent?: number;
      score_parts_count?: number;
      pixel_parity?: boolean;
      path?: string;
      stacked_sections?: number;
      with_visible?: number;
      layout_tree_max_depth?: number;
      buddy_labels?: number;
      signal_key_count?: number;
    } | null;
    stack_switch?: {
      stack: string;
      control?: string;
      by_type: Record<string, number>;
      default?: number;
      preview_only?: boolean;
      writes_option?: string;
      note?: string;
    } | null;
    option_enable?: Array<{
      target: string;
      when_option: string;
      when_in: string[];
      note?: string;
    }>;
  }>(`/api/v1/interface-option-schema?${qs.toString()}`);
}

export function fetchRuleOptionSchema(ruleKind: string = "policy") {
  const qs = new URLSearchParams({ rule_kind: ruleKind });
  return api<{
    rule_kind: string;
    dialog_stem?: string | null;
    groups: SchemaGroup[];
    featured_keys: string[];
    fields?: Record<string, OptionFieldMeta>;
    dialog_field_count?: number;
    layout_fidelity?: {
      score_percent?: number;
      score_parts_count?: number;
      pixel_parity?: boolean;
      path?: string;
      stacked_sections?: number;
      with_visible?: number;
      layout_tree_max_depth?: number;
      buddy_labels?: number;
      signal_key_count?: number;
    } | null;
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

export function fetchInstallerConfiglet(params: {
  host_os: string;
  user?: string;
  fwdir?: string;
  fwscript?: string;
  compress?: boolean;
  generate_rc_conf?: boolean;
  use_scp?: boolean;
}) {
  const q = new URLSearchParams();
  q.set("host_os", params.host_os);
  if (params.user) q.set("user", params.user);
  if (params.fwdir) q.set("fwdir", params.fwdir);
  if (params.fwscript) q.set("fwscript", params.fwscript);
  if (params.compress != null) q.set("compress", String(params.compress));
  if (params.generate_rc_conf != null) q.set("generate_rc_conf", String(params.generate_rc_conf));
  if (params.use_scp != null) q.set("use_scp", String(params.use_scp));
  return api<{
    host_os: string;
    family?: string;
    configlet_dir?: string | null;
    user: string;
    interactive_installer?: boolean;
    names?: string[];
    note?: string | null;
    preview: {
      ok: boolean;
      source?: string | null;
      command?: string;
      interactive_installer?: boolean;
      note?: string | null;
    };
  }>(`/api/v1/installer-configlet?${q.toString()}`);
}

export function fetchInstallerConfigletFile(
  hostOs: string,
  name: string,
  opts?: { expand?: boolean; fwdir?: string; fwscript?: string },
) {
  const q = new URLSearchParams({ host_os: hostOs, name });
  if (opts?.expand) q.set("expand", "true");
  if (opts?.fwdir) q.set("fwdir", opts.fwdir);
  if (opts?.fwscript) q.set("fwscript", opts.fwscript);
  return api<{
    ok: boolean;
    host_os: string;
    name: string;
    configlet_dir?: string;
    path?: string;
    size?: number;
    text?: string;
    expanded?: boolean;
    expanded_text?: string;
    names?: string[];
    note?: string;
  }>(`/api/v1/installer-configlet-file?${q.toString()}`);
}

export function fetchLayoutFidelity(platform: string, hostOs = "") {
  const qs = new URLSearchParams({ platform });
  if (hostOs) qs.set("host_os", hostOs);
  return api<{
    ok: boolean;
    platform: string;
    dialog?: string;
    pixel_parity: boolean;
    score_percent?: number;
    score_parts_count?: number;
    note?: string;
    fields?: Record<string, number>;
    pages?: Record<string, unknown>;
    chrome?: Record<string, boolean>;
    signal_keys?: {
      fields?: string[];
      pages?: string[];
      chrome?: string[];
    };
    stack_switch?: Array<{
      stack: string;
      option: string;
      when_true: number;
      when_false: number;
      preview_only?: boolean;
      note?: string;
    }>;
    iface_stack_switch?: {
      stack: string;
      by_type: Record<string, number>;
      default?: number;
      preview_only?: boolean;
      note?: string;
    } | null;
    error?: string;
  }>(`/api/v1/layout-fidelity?${qs.toString()}`);
}

export function fetchStackSwitch(platform = "", hostOs = "") {
  const qs = new URLSearchParams();
  if (platform) qs.set("platform", platform);
  if (hostOs) qs.set("host_os", hostOs);
  return api<{
    ok: boolean;
    platform?: string | null;
    host_os?: string | null;
    dialog_stem?: string | null;
    interface_dialog_stem?: string | null;
    option_stack_switch: Array<{
      stack: string;
      option: string;
      when_true: number;
      when_false: number;
      preview_only?: boolean;
      note?: string;
    }>;
    iface_stack_switch?: {
      stack: string;
      by_type: Record<string, number>;
      default?: number;
      preview_only?: boolean;
      note?: string;
    } | null;
    option_enable?: Array<{
      target: string;
      when_option: string;
      when_in: string[];
      note?: string;
    }>;
    iface_option_enable?: Array<{
      target: string;
      when_option: string;
      when_in: string[];
      note?: string;
    }>;
    pixel_parity: boolean;
    note?: string;
  }>(`/api/v1/stack-switch?${qs.toString()}`);
}

export function fetchHardGaps() {
  return api<{
    soft_complete_phase: string;
    soft_fertig_honesty_track?: boolean;
    soft_fertig_honesty_track_note?: string;
    hard_gap_open: string[];
    hard_gap_open_labels?: Record<string, string>;
    hard_gap_closure_titles?: Record<string, string>;
    hard_gap_related_refusals?: Record<string, Record<string, object>>;
    hard_gap_related_refusal_titles?: Record<string, string>;
    hard_gap_count?: number;
    hard_gap_notes?: Record<string, string>;
    hard_gap_closure?: Record<string, string>;
    closure_path?: string;
    layout_fidelity_path?: string;
    layout_fidelity_signal_catalog?: {
      fields?: string[];
      pages?: string[];
      chrome?: string[];
    } | null;
    stack_switch_path?: string;
    option_enable_path?: string;
    expect_run_path?: string;
    expect_steps_path?: string;
    expect_steps_refusals_path?: string;
    expect_plan_step_ids?: string[];
    expect_plan_step_titles?: Record<string, string>;
    ssh_alternative_titles?: Record<string, string>;
    ssh_refusal_path_titles?: Record<string, string>;
    honesty_path_titles?: Record<string, string>;
    honesty_path_notes?: Record<string, string>;
    honesty_path_notes_count?: number;
    soft_fertig_surface_keys?: string[];
    soft_fertig_surface_key_count?: number;
    soft_fertig_surface_key_titles?: Record<string, string>;
    soft_fertig_surface_notes?: Record<string, string>;
    soft_fertig_surface_notes_count?: number;
    soft_fertig_session_storage_keys?: Record<string, string>;
    soft_fertig_session_storage_key_count?: number;
    soft_fertig_session_storage_key_titles?: Record<string, string>;
    soft_fertig_session_storage_notes?: Record<string, string>;
    soft_fertig_session_storage_notes_count?: number;
    soft_fertig_session_storage_clear_keys?: string[];
    soft_fertig_session_storage_clear_key_count?: number;
    soft_fertig_session_storage_clear_note?: string;
    soft_fertig_honesty_surface_version?: string;
    soft_fertig_honesty_surface_version_note?: string;
    soft_fertig_catalog_summary?: Record<string, unknown>;
    soft_fertig_honesty_readiness?: Record<string, unknown>;
    soft_fertig_soft_complete_note?: string;
    soft_fertig_honesty_surface_changelog?: Record<string, unknown>;
    soft_fertig_honesty_operator_brief?: Record<string, unknown>;
    soft_fertig_hard_gap_roster?: Record<string, unknown>;
    soft_fertig_hard_gap_refusal_roster?: Record<string, unknown>;
    soft_fertig_honesty_path_roster?: Record<string, unknown>;
    soft_fertig_session_storage_roster?: Record<string, unknown>;
    soft_fertig_honesty_export_roster?: Record<string, unknown>;
    soft_fertig_honesty_bundle_roster?: Record<string, unknown>;
    soft_fertig_surface_roster?: Record<string, unknown>;
    soft_fertig_changelog_roster?: Record<string, unknown>;
    soft_fertig_expect_step_roster?: Record<string, unknown>;
    soft_fertig_ssh_honesty_roster?: Record<string, unknown>;
    soft_fertig_layout_fidelity_signal_roster?: Record<string, unknown>;
    soft_fertig_layout_fidelity_sample_roster?: Record<string, unknown>;
    soft_fertig_layout_fidelity_sample_field_roster?: Record<string, unknown>;
    soft_fertig_catalog_summary_roster?: Record<string, unknown>;
    soft_fertig_honesty_readiness_roster?: Record<string, unknown>;
    soft_fertig_session_storage_clear_roster?: Record<string, unknown>;
    soft_fertig_honesty_operator_brief_roster?: Record<string, unknown>;
    soft_fertig_surface_changelog_meta_roster?: Record<string, unknown>;
    soft_fertig_hard_gaps_summary_roster?: Record<string, unknown>;
    soft_fertig_hard_gaps_closure_roster?: Record<string, unknown>;
    soft_fertig_health_roster?: Record<string, unknown>;
    soft_fertig_res_status_roster?: Record<string, unknown>;
    soft_fertig_hard_gaps_field_roster?: Record<string, unknown>;
    soft_fertig_layout_fidelity_roster?: Record<string, unknown>;
    soft_fertig_stack_switch_roster?: Record<string, unknown>;
    soft_fertig_option_enable_roster?: Record<string, unknown>;
    soft_fertig_expect_run_roster?: Record<string, unknown>;
    soft_fertig_expect_steps_roster?: Record<string, unknown>;
    soft_fertig_expect_steps_refusals_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_roster?: Record<string, unknown>;
    soft_fertig_password_ssh_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_roster?: Record<string, unknown>;
    soft_fertig_ssh_capability_flags_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternatives_roster?: Record<string, unknown>;
    soft_fertig_ssh_refusal_paths_roster?: Record<string, unknown>;
    soft_fertig_ssh_refusal_status_roster?: Record<string, unknown>;
    soft_fertig_ssh_method_lists_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternative_notes_roster?: Record<string, unknown>;
    soft_fertig_ssh_refusal_path_titles_roster?: Record<string, unknown>;
    soft_fertig_ssh_refusal_path_notes_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_note_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternative_support_roster?: Record<string, unknown>;
    soft_fertig_ssh_batch_mode_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_check_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_check_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternative_presence_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_batch_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_batch_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_agent_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_note_snapshot_roster?: Record<string, unknown>;
    soft_fertig_ssh_honesty_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_identity_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_keyboard_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_password_roster?: Record<string, unknown>;
    soft_fertig_ssh_refusal_status_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_policy_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_refusal_paths_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternatives_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternative_titles_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_refusal_path_titles_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_refusal_path_notes_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternative_notes_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_note_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_capability_flags_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_method_lists_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_batch_mode_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_note_snapshot_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_check_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_check_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternative_presence_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_batch_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_batch_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_agent_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_implemented_identity_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_keyboard_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_not_implemented_password_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternative_support_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_password_support_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_refresh_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_field_presence_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_list_length_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_bool_flag_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_note_token_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_alternative_id_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_refusal_id_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_implemented_id_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_not_implemented_id_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_refusal_status_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_title_map_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_note_map_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_note_length_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_capability_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_batch_gate_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_support_gate_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_method_partition_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_key_surface_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_refusal_pair_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_alt_pair_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_impl_support_pair_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_empty_check_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_type_tag_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_hard_gap_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_gap_label_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_gap_closure_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_refusal_related_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_session_hint_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_export_hint_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_bundle_hint_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_surface_hint_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_clear_hint_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_milestone_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_track_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_schema_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_catalog_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_export_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_hard_gap_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_path_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_readiness_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_operator_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_policy_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_method_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_refusal_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_alt_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_support_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_note_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_gap_open_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_surface_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_session_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_export_family_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_soft_plus_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_milestone_floor_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_schema_parts_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_hard_gap_ratio_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_batch_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_impl_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_ni_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_refusal_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_cap_key_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_dict_key_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_title_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_notes_count_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_gap_note_echo_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_gap_refusal_title_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_soft_phase_parts_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_export_ssh_ratio_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_surface_ssh_ratio_roster?: Record<string, unknown>;
    soft_fertig_ssh_password_support_roster?: Record<string, unknown>;
    soft_fertig_ssh_alternative_titles_roster?: Record<string, unknown>;
    soft_fertig_ssh_auth_policy_roster?: Record<string, unknown>;
    soft_fertig_honesty_export_keys?: string[];
    soft_fertig_honesty_export_key_count?: number;
    soft_fertig_honesty_export_key_titles?: Record<string, string>;
    soft_fertig_honesty_export_notes?: Record<string, string>;
    soft_fertig_honesty_export_notes_count?: number;
    soft_fertig_honesty_bundle_sections?: string[];
    soft_fertig_honesty_bundle_section_count?: number;
    soft_fertig_honesty_bundle_section_titles?: Record<string, string>;
    soft_fertig_honesty_bundle_notes?: Record<string, string>;
    soft_fertig_honesty_bundle_notes_count?: number;
    expect_plan_step_notes?: Record<string, string>;
    expect_plan_step_notes_count?: number;
    ssh_auth_path?: string;
    password_ssh_path?: string;
    ssh_batch_mode_only?: boolean;
    ssh_alternatives?: string[];
    ssh_alternative_notes?: Record<string, string>;
    ssh_refusal_paths?: Record<string, number>;
    ssh_refusal_path_notes?: Record<string, string>;
    honesty_milestone?: number;
    honesty_milestone_note?: string;
    honesty_paths?: Record<string, string>;
    honesty_paths_count?: number;
    summary_path?: string;
    layout_fidelity_sample_platform?: string;
    layout_fidelity_sample_host_os?: string;
    layout_fidelity_sample_score_percent?: number | null;
    layout_fidelity_sample_score_parts_count?: number | null;
    layout_fidelity_sample_spacers?: number | null;
    layout_fidelity_sample_spacers_with_orientation?: number | null;
    layout_fidelity_sample_spacers_with_size_type?: number | null;
    layout_fidelity_sample_spacers_with_size_hint?: number | null;
    layout_fidelity_sample_with_size_policy?: number | null;
    layout_fidelity_sample_with_size_policy_expanding?: number | null;
    layout_fidelity_sample_with_size_policy_fixed?: number | null;
    layout_fidelity_sample_with_size_policy_minimum?: number | null;
    layout_fidelity_sample_with_size_policy_preferred?: number | null;
    layout_fidelity_sample_with_minimum_size?: number | null;
    layout_fidelity_sample_with_maximum_size?: number | null;
    layout_fidelity_sample_layout_tree_max_depth?: number | null;
    layout_fidelity_sample_buddy_labels?: number | null;
    layout_fidelity_sample_stacked_sections?: number | null;
    layout_fidelity_sample_empty_stacked_sections?: number | null;
    layout_fidelity_sample_sections_with_flat?: number | null;
    layout_fidelity_sample_sections_with_checkable?: number | null;
    layout_fidelity_sample_annotations?: number | null;
    layout_fidelity_sample_pages_with_column_stretch?: number | null;
    layout_fidelity_sample_pages_with_spacing?: number | null;
    layout_fidelity_sample_pages_with_layout_tree?: number | null;
    layout_fidelity_sample_chrome_geometry?: boolean | null;
    layout_fidelity_sample_chrome_size_grip_enabled?: boolean | null;
    layout_fidelity_sample_with_grid?: number | null;
    layout_fidelity_sample_with_label?: number | null;
    layout_fidelity_sample_with_tooltip?: number | null;
    layout_fidelity_sample_with_visible?: number | null;
    layout_fidelity_sample_with_whats_this?: number | null;
    layout_fidelity_sample_with_enabled?: number | null;
    layout_fidelity_sample_with_alignment?: number | null;
    layout_fidelity_sample_with_read_only?: number | null;
    layout_fidelity_sample_pages_with_row_stretch?: number | null;
    layout_fidelity_sample_pages_with_tooltip?: number | null;
    layout_fidelity_sample_with_external_label?: number | null;
    layout_fidelity_sample_pages_with_buddy_labels?: number | null;
    layout_fidelity_sample_fields?: number | null;
    layout_fidelity_sample_pages?: number | null;
    layout_fidelity_sample_sections?: number | null;
    layout_fidelity_sample_stack_names?: string[] | null;
    layout_fidelity_sample_stack_names_count?: number | null;
    layout_fidelity_sample_chrome_window_title?: boolean | null;
    layout_fidelity_sample_chrome_tab_position?: boolean | null;
    layout_fidelity_sample_signal_key_count?: number | null;
    layout_fidelity_alt_sample_platform?: string | null;
    layout_fidelity_alt_sample_host_os?: string | null;
    layout_fidelity_alt_sample_score_percent?: number | null;
    layout_fidelity_alt_sample_buddy_labels?: number | null;
    layout_fidelity_alt_sample_pages_with_buddy_labels?: number | null;
    layout_fidelity_alt_sample_with_external_label?: number | null;
    layout_fidelity_alt2_sample_platform?: string | null;
    layout_fidelity_alt2_sample_host_os?: string | null;
    layout_fidelity_alt2_sample_score_percent?: number | null;
    layout_fidelity_alt2_sample_with_enabled?: number | null;
    layout_fidelity_sample_key_count?: number | null;
    layout_fidelity_sample_catalog_complete?: boolean | null;
    layout_fidelity_pixel_parity?: boolean;
    note?: string;
  }>("/api/v1/hard-gaps");
}

export function fetchHardGapsSummary() {
  return api<{
    soft_complete_phase: string;
    soft_fertig_honesty_track?: boolean;
    honesty_milestone?: number;
    honesty_milestone_note?: string;
    hard_gap_open: string[];
    hard_gap_open_labels?: Record<string, string>;
    hard_gap_closure_titles?: Record<string, string>;
    hard_gap_count?: number;
    honesty_paths_count?: number;
    honesty_path_notes_count?: number;
    expect_plan_step_count?: number;
    layout_fidelity_sample_platform?: string;
    layout_fidelity_sample_host_os?: string;
    layout_fidelity_sample_score_percent?: number | null;
    layout_fidelity_sample_score_parts_count?: number | null;
    layout_fidelity_sample_spacers?: number | null;
    layout_fidelity_sample_spacers_with_orientation?: number | null;
    layout_fidelity_sample_spacers_with_size_type?: number | null;
    layout_fidelity_sample_spacers_with_size_hint?: number | null;
    layout_fidelity_sample_with_size_policy?: number | null;
    layout_fidelity_sample_with_size_policy_expanding?: number | null;
    layout_fidelity_sample_with_size_policy_fixed?: number | null;
    layout_fidelity_sample_with_size_policy_minimum?: number | null;
    layout_fidelity_sample_with_size_policy_preferred?: number | null;
    layout_fidelity_sample_with_minimum_size?: number | null;
    layout_fidelity_sample_with_maximum_size?: number | null;
    layout_fidelity_sample_layout_tree_max_depth?: number | null;
    layout_fidelity_sample_buddy_labels?: number | null;
    layout_fidelity_sample_stacked_sections?: number | null;
    layout_fidelity_sample_empty_stacked_sections?: number | null;
    layout_fidelity_sample_sections_with_flat?: number | null;
    layout_fidelity_sample_sections_with_checkable?: number | null;
    layout_fidelity_sample_annotations?: number | null;
    layout_fidelity_sample_pages_with_column_stretch?: number | null;
    layout_fidelity_sample_pages_with_spacing?: number | null;
    layout_fidelity_sample_pages_with_layout_tree?: number | null;
    layout_fidelity_sample_chrome_geometry?: boolean | null;
    layout_fidelity_sample_chrome_size_grip_enabled?: boolean | null;
    layout_fidelity_sample_with_grid?: number | null;
    layout_fidelity_sample_with_label?: number | null;
    layout_fidelity_sample_with_tooltip?: number | null;
    layout_fidelity_sample_with_visible?: number | null;
    layout_fidelity_sample_with_whats_this?: number | null;
    layout_fidelity_sample_with_enabled?: number | null;
    layout_fidelity_sample_with_alignment?: number | null;
    layout_fidelity_sample_with_read_only?: number | null;
    layout_fidelity_sample_pages_with_row_stretch?: number | null;
    layout_fidelity_sample_pages_with_tooltip?: number | null;
    layout_fidelity_sample_with_external_label?: number | null;
    layout_fidelity_sample_pages_with_buddy_labels?: number | null;
    layout_fidelity_sample_fields?: number | null;
    layout_fidelity_sample_pages?: number | null;
    layout_fidelity_sample_sections?: number | null;
    layout_fidelity_sample_stack_names?: string[] | null;
    layout_fidelity_sample_stack_names_count?: number | null;
    layout_fidelity_sample_chrome_window_title?: boolean | null;
    layout_fidelity_sample_chrome_tab_position?: boolean | null;
    layout_fidelity_sample_signal_key_count?: number | null;
    layout_fidelity_alt_sample_platform?: string | null;
    layout_fidelity_alt_sample_host_os?: string | null;
    layout_fidelity_alt_sample_score_percent?: number | null;
    layout_fidelity_alt_sample_buddy_labels?: number | null;
    layout_fidelity_alt_sample_pages_with_buddy_labels?: number | null;
    layout_fidelity_alt_sample_with_external_label?: number | null;
    layout_fidelity_alt2_sample_platform?: string | null;
    layout_fidelity_alt2_sample_host_os?: string | null;
    layout_fidelity_alt2_sample_score_percent?: number | null;
    layout_fidelity_alt2_sample_with_enabled?: number | null;
    layout_fidelity_sample_key_count?: number | null;
    layout_fidelity_sample_catalog_complete?: boolean | null;
    layout_fidelity_pixel_parity?: boolean;
    parent_path?: string;
    closure_path?: string;
    layout_fidelity_path?: string;
    expect_steps_path?: string;
    note?: string;
  }>("/api/v1/hard-gaps/summary");
}

export function fetchExpectPlanSteps() {
  return api<{
    ok: boolean;
    executable: boolean;
    error?: string;
    canonical_step_ids: string[];
    step_notes?: Record<string, string>;
    step_count: number;
    run_path?: string;
    run_status?: number;
    note?: string;
  }>("/api/v1/expect-install-plan/steps");
}

export function fetchExpectPlanStepRefusals(hostOs: string) {
  const q = new URLSearchParams({ host_os: hostOs });
  return api<{
    ok: boolean;
    executable: boolean;
    error?: string;
    host_os: string;
    step_count: number;
    all_refused: boolean;
    run_status?: number;
    run_path?: string;
    steps_path?: string;
    canonical_step_ids?: string[];
    unknown_step_probe?: {
      ok?: boolean;
      error?: string;
      step?: string;
      unknown_step?: boolean;
      note?: string;
    };
    steps: Array<{
      ok?: boolean;
      error?: string;
      step?: string;
      step_refused?: boolean;
      unknown_step?: boolean;
      note?: string;
    }>;
    note?: string;
  }>(`/api/v1/expect-install-plan/steps/refusals?${q.toString()}`);
}

export function fetchOptionEnable(platform = "", hostOs = "") {
  const qs = new URLSearchParams();
  if (platform) qs.set("platform", platform);
  if (hostOs) qs.set("host_os", hostOs);
  return api<{
    ok: boolean;
    platform?: string | null;
    host_os?: string | null;
    option_enable: Array<{
      target: string;
      when_option: string;
      when_in: string[];
      note?: string;
    }>;
    iface_option_enable: Array<{
      target: string;
      when_option: string;
      when_in: string[];
      note?: string;
    }>;
    pixel_parity: boolean;
    stack_switch_path?: string;
    note?: string;
  }>(`/api/v1/option-enable?${qs.toString()}`);
}

export function fetchHardGapClosure() {
  return api<{
    soft_complete_phase: string;
    soft_fertig_honesty_track?: boolean;
    honesty_milestone?: number;
    honesty_milestone_note?: string;
    hard_gap_open: string[];
    hard_gap_open_labels?: Record<string, string>;
    hard_gap_closure_titles?: Record<string, string>;
    hard_gap_count?: number;
    hard_gap_closure: Record<string, string>;
    hard_gap_notes?: Record<string, string>;
    parent_path?: string;
    summary_path?: string;
    note?: string;
  }>("/api/v1/hard-gaps/closure");
}

export async function refuseExpectInstallStep(
  hostOs: string,
  stepId: string,
): Promise<{
  refused: boolean;
  status: number;
  detail: string;
  step?: string;
  unknown_step?: boolean;
  known_step_ids?: string[];
  error?: string;
  note?: string;
}> {
  const q = new URLSearchParams({ host_os: hostOs, step: stepId });
  const headers = new Headers();
  headers.set("Authorization", `Bearer ${getToken()}`);
  const res = await fetch(`${apiBase}/api/v1/expect-install-plan/run?${q.toString()}`, {
    method: "POST",
    headers,
  });
  const text = await res.text();
  let step: string | undefined;
  let unknown_step: boolean | undefined;
  let known_step_ids: string[] | undefined;
  let error: string | undefined;
  let note: string | undefined;
  try {
    const parsed = JSON.parse(text) as {
      detail?: Record<string, unknown> | string;
    } & Record<string, unknown>;
    const d =
      parsed && typeof parsed.detail === "object" && parsed.detail
        ? (parsed.detail as Record<string, unknown>)
        : parsed;
    if (d && typeof d === "object") {
      if (typeof d.step === "string") step = d.step;
      if (typeof d.unknown_step === "boolean") unknown_step = d.unknown_step;
      if (Array.isArray(d.known_step_ids)) {
        known_step_ids = d.known_step_ids.filter((x): x is string => typeof x === "string");
      }
      if (typeof d.error === "string") error = d.error;
      if (typeof d.note === "string") note = d.note;
    }
  } catch {
    /* plain text body */
  }
  return {
    refused: res.status === 501,
    status: res.status,
    detail: text,
    step,
    unknown_step,
    known_step_ids,
    error,
    note,
  };
}

export function fetchSshAuth() {
  return api<{
    batch_mode: boolean;
    batch_mode_only?: boolean;
    password_supported: boolean;
    keyboard_interactive_supported: boolean;
    identity_file_supported?: boolean;
    ssh_agent_supported?: boolean;
    implemented?: string[];
    not_implemented?: string[];
    alternatives?: string[];
    alternative_notes?: Record<string, string>;
    refusal_paths?: Record<string, number>;
    refusal_path_notes?: Record<string, string>;
    note: string;
  }>("/api/v1/ssh-auth");
}

export function fetchExpectInstallPlan(
  hostOs: string,
  opts?: { fwdir?: string; fwscript?: string },
) {
  const q = new URLSearchParams({ host_os: hostOs });
  if (opts?.fwdir) q.set("fwdir", opts.fwdir);
  if (opts?.fwscript) q.set("fwscript", opts.fwscript);
  return api<{
    ok: boolean;
    executable: boolean;
    error?: string;
    host_os: string;
    step_count: number;
    canonical_step_ids?: string[];
    steps: Array<{
      id: string;
      title: string;
      implemented?: boolean;
      detail?: string;
      configlet?: string;
      preview?: string;
    }>;
    note?: string;
  }>(`/api/v1/expect-install-plan?${q.toString()}`);
}

export function fetchExpectInstallWalkthrough(
  hostOs: string,
  opts?: { fwdir?: string; fwscript?: string },
) {
  const q = new URLSearchParams({ host_os: hostOs });
  if (opts?.fwdir) q.set("fwdir", opts.fwdir);
  if (opts?.fwscript) q.set("fwscript", opts.fwscript);
  return api<{
    ok: boolean;
    executable: boolean;
    walkthrough: boolean;
    all_preview_only: boolean;
    host_os: string;
    step_count: number;
    canonical_step_ids?: string[];
    timeline_start?: string;
    steps: Array<{
      id: string;
      title: string;
      status: string;
      runnable: boolean;
      implemented?: boolean;
      ordinal?: number;
      has_preview?: boolean;
      configlet?: string;
      detail?: string;
      simulated_at?: string;
    }>;
    note?: string;
  }>(`/api/v1/expect-install-plan/walkthrough?${q.toString()}`);
}

/** Calls the password-SSH refusal endpoint; expects HTTP 501. */
export async function refusePasswordSsh(): Promise<{
  refused: boolean;
  status: number;
  detail: string;
  error?: string;
  batch_mode_only?: boolean;
  alternatives?: string[];
  refusal_paths?: Record<string, number>;
  note?: string;
}> {
  const headers = new Headers();
  headers.set("Authorization", `Bearer ${getToken()}`);
  const res = await fetch(`${apiBase}/api/v1/ssh-auth/password`, {
    method: "POST",
    headers,
  });
  const text = await res.text();
  let error: string | undefined;
  let batch_mode_only: boolean | undefined;
  let alternatives: string[] | undefined;
  let refusal_paths: Record<string, number> | undefined;
  let note: string | undefined;
  try {
    const parsed = JSON.parse(text) as {
      detail?: Record<string, unknown> | string;
    } & Record<string, unknown>;
    const d =
      parsed && typeof parsed.detail === "object" && parsed.detail
        ? (parsed.detail as Record<string, unknown>)
        : parsed;
    if (d && typeof d === "object") {
      if (typeof d.error === "string") error = d.error;
      if (typeof d.batch_mode_only === "boolean") batch_mode_only = d.batch_mode_only;
      if (Array.isArray(d.alternatives)) {
        alternatives = d.alternatives.filter((x): x is string => typeof x === "string");
      }
      if (d.refusal_paths && typeof d.refusal_paths === "object") {
        refusal_paths = {};
        for (const [k, v] of Object.entries(d.refusal_paths as Record<string, unknown>)) {
          if (typeof v === "number") refusal_paths[k] = v;
        }
      }
      if (typeof d.note === "string") note = d.note;
    }
  } catch {
    /* plain text */
  }
  return {
    refused: res.status === 501,
    status: res.status,
    detail: text,
    error,
    batch_mode_only,
    alternatives,
    refusal_paths,
    note,
  };
}

export function fetchInstallerConfiglets(hostOs: string) {
  const q = new URLSearchParams({ host_os: hostOs });
  return api<{
    host_os: string;
    family?: string;
    configlet_dir?: string | null;
    names: string[];
    interactive_installer?: boolean;
    note?: string | null;
    webui_modes?: Record<string, boolean>;
  }>(`/api/v1/installer-configlets?${q.toString()}`);
}

export function fetchResStatus() {
  return api<{
    status: string;
    res_dir: string;
    res_ok: boolean;
    configlets_dir: string;
    configlets_ok: boolean;
    configlet_os_count: number;
    configlet_os: string[];
    soft_complete_phase?: string;
    soft_fertig_honesty_track?: boolean;
    honesty_milestone?: number;
    honesty_milestone_note?: string;
    hard_gap_open?: string[];
    hard_gap_count?: number;
  }>("/api/v1/res-status");
}

export function fetchInstallerCapabilities(hostOs: string) {
  const q = new URLSearchParams({ host_os: hostOs });
  return api<{
    host_os: string;
    family?: string;
    interactive_installer?: boolean;
    recommended_webui_mode?: string;
    webui_modes?: Record<string, boolean>;
    note?: string | null;
    names?: string[];
    expect_install_plan?: {
      available?: boolean;
      executable?: boolean;
      path?: string;
      run_path?: string;
      run_status?: number;
      note?: string;
    };
    ssh_auth?: {
      batch_mode?: boolean;
      password_supported?: boolean;
      keyboard_interactive_supported?: boolean;
      note?: string;
    };
    expect_installer?: {
      implemented?: boolean;
      needed?: boolean;
      desktop_steps?: string[];
      names?: string[];
      has_pre_config?: boolean;
      has_post_config?: boolean;
      note?: string;
    };
  }>(`/api/v1/installer-capabilities?${q.toString()}`);
}

export function deployFirewall(
  sessionId: string,
  body: {
    firewall_id: string;
    host?: string;
    user?: string;
    remote_dir?: string;
    identity_file?: string;
    activate?: boolean;
    compile_first?: boolean;
    dry_run?: boolean;
    compress?: boolean;
    use_scp?: boolean;
    copy_fwb?: boolean;
    force_limited_installer?: boolean;
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
      mode?: string;
      host: string;
      user: string;
      remote_path: string;
      commands: string[];
      log: string;
      note?: string;
      plan?: string[];
      activation_source?: string;
      activation_cmd?: string;
      identity_file?: string | null;
      copy_fwb?: boolean;
      files?: Array<{ local: string; remote: string }>;
      manifest?: Array<{ local: string; remote: string; main?: boolean }>;
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
