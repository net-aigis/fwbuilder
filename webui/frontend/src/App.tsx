import { useEffect, useMemo, useRef, useState } from "react";
import {
  addRule,
  addRuleRef,
  closeProject,
  compileAllFirewalls,
  compileFirewall,
  createObject,
  deployFirewall,
  deleteObject,
  emptyDeletedObjects,
  findUnusedObjects,
  fetchProjectStats,
  fetchWhereUsed,
  fetchObjectPath,
  listDeletedObjects,
  listSessions,
  formatRuleObjects,
  type ProjectSessionInfo,
  duplicateObject,
  restoreDeletedObject,
  duplicateRule,
  downloadCompileOutput,
  downloadCompileOutputsZip,
  downloadProjectUrl,
  deleteRule,
  fetchObject,
  fetchRuleset,
  fetchTree,
  getToken,
  moveRule,
  newProject,
  openProject,
  saveProject,
  searchObjects,
  removeRuleRef,
  setObjectRo,
  setRuleAny,
  setRuleNeg,
  setToken,
  updateObject,
  updateRule,
  type AnyRule,
  type NatRule,
  type PolicyRule,
  type RuleElement,
  type RoutingRuleRow,
  type ObjectPathEntry,
  type ProjectStats,
  type RulesetListEntry,
  type TreeNode,
} from "./api/client";
import { CreateObject } from "./components/CreateObject";
import { FirewallExtras } from "./components/FirewallExtras";
import { HostOptions } from "./components/HostOptions";
import { InterfaceOptions } from "./components/InterfaceOptions";
import { MoveObject } from "./components/MoveObject";
import { GroupMembers } from "./components/GroupMembers";
import { WhereUsed } from "./components/WhereUsed";
import { ObjectDetail } from "./components/ObjectDetail";
import { ObjectPicker } from "./components/ObjectPicker";
import { ObjectTree } from "./components/ObjectTree";
import { RuleGrid } from "./components/RuleGrid";
import { RuleMeta } from "./components/RuleMeta";
import { RuleOptions } from "./components/RuleOptions";
import { SHORTCUTS, shortcutsAsText } from "./shortcuts";

type Theme = "light" | "dark";
type MainTab = "object" | "rules";
type RulesWhich = "policy" | "nat" | "routing";

type PickerTarget = { ruleId: string; element: string };

export function App() {
  const [theme, setTheme] = useState<Theme>(() => {
    try {
      const stored = localStorage.getItem("fwbweb.theme");
      if (stored === "dark" || stored === "light") return stored;
    } catch {
      /* ignore */
    }
    return window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
  });
  const [token, setTokenState] = useState(getToken());
  const [path, setPath] = useState(() => {
    try {
      const recent = JSON.parse(localStorage.getItem("fwbweb.recent") || "[]") as string[];
      return recent[0] || "../fixtures/sample-v24.fwb";
    } catch {
      return "../fixtures/sample-v24.fwb";
    }
  });
  const [recentPaths, setRecentPaths] = useState<string[]>(() => {
    try {
      return JSON.parse(localStorage.getItem("fwbweb.recent") || "[]") as string[];
    } catch {
      return [];
    }
  });
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [tree, setTree] = useState<TreeNode | null>(null);
  const [selected, setSelected] = useState<TreeNode | null>(null);
  const [status, setStatus] = useState<string>("Not connected");
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [tab, setTab] = useState<MainTab>(() => {
    try {
      const t = sessionStorage.getItem("fwbweb.mainTab");
      if (t === "object" || t === "rules") return t;
    } catch {
      /* ignore */
    }
    return "object";
  });
  const [rulesWhich, setRulesWhich] = useState<RulesWhich>(() => {
    try {
      const w = sessionStorage.getItem("fwbweb.rulesWhich");
      if (w === "policy" || w === "nat" || w === "routing") return w;
    } catch {
      /* ignore */
    }
    return "policy";
  });
  const [rulesFwId, setRulesFwId] = useState<string | null>(null);
  const [rulesFwMeta, setRulesFwMeta] = useState<{
    name: string;
    platform?: string;
    host_OS?: string;
    lastCompiled?: string;
    lastInstalled?: string;
    lastModified?: string;
  } | null>(null);
  const [compileLogWrap, setCompileLogWrap] = useState(() => {
    try {
      const v = sessionStorage.getItem("fwbweb.compileLogWrap");
      if (v === "0") return false;
      if (v === "1") return true;
    } catch {
      /* ignore */
    }
    return true;
  });
  const [rulesetId, setRulesetId] = useState<string | null>(null);
  const [rulesetList, setRulesetList] = useState<RulesetListEntry[]>([]);
  const [rules, setRules] = useState<AnyRule[]>([]);
  const [rulesetName, setRulesetName] = useState("");
  const [selectedRuleId, setSelectedRuleId] = useState<string | undefined>();
  const [searchQ, setSearchQ] = useState("");
  const [searchType, setSearchType] = useState(() => {
    try {
      return sessionStorage.getItem("fwbweb.searchType") || "";
    } catch {
      return "";
    }
  });
  const [searchHits, setSearchHits] = useState<TreeNode[]>([]);
  const [picker, setPicker] = useState<PickerTarget | null>(null);
  const [compileLog, setCompileLog] = useState<string | null>(null);
  const [compileOutputs, setCompileOutputs] = useState<string[]>([]);
  const [dirty, setDirty] = useState(false);
  const [hideDisabled, setHideDisabled] = useState(() => {
    try {
      const raw = sessionStorage.getItem("fwbweb.ruleFilters");
      if (!raw) return false;
      return Boolean(JSON.parse(raw).hideDisabled);
    } catch {
      return false;
    }
  });
  const [onlyDisabled, setOnlyDisabled] = useState(() => {
    try {
      const raw = sessionStorage.getItem("fwbweb.ruleFilters");
      if (!raw) return false;
      return Boolean(JSON.parse(raw).onlyDisabled);
    } catch {
      return false;
    }
  });
  const [ruleActionFilter, setRuleActionFilter] = useState(() => {
    try {
      const raw = sessionStorage.getItem("fwbweb.ruleFilters");
      if (!raw) return "";
      const v = JSON.parse(raw).ruleActionFilter;
      return typeof v === "string" ? v : "";
    } catch {
      return "";
    }
  });
  const [ruleGroupFilter, setRuleGroupFilter] = useState(() => {
    try {
      const raw = sessionStorage.getItem("fwbweb.ruleFilters");
      if (!raw) return "";
      const v = JSON.parse(raw).ruleGroupFilter;
      return typeof v === "string" ? v : "";
    } catch {
      return "";
    }
  });
  const [ruleTextFilter, setRuleTextFilter] = useState(() => {
    try {
      const raw = sessionStorage.getItem("fwbweb.ruleFilters");
      if (!raw) return "";
      const v = JSON.parse(raw).ruleTextFilter;
      return typeof v === "string" ? v : "";
    } catch {
      return "";
    }
  });
  const [treeFilter, setTreeFilter] = useState(() => {
    try {
      return sessionStorage.getItem("fwbweb.treeFilter") || "";
    } catch {
      return "";
    }
  });
  const [unusedTypeFilter, setUnusedTypeFilter] = useState(() => {
    try {
      return sessionStorage.getItem("fwbweb.unusedTypeFilter") || "";
    } catch {
      return "";
    }
  });
  const [trashTypeFilter, setTrashTypeFilter] = useState(() => {
    try {
      return sessionStorage.getItem("fwbweb.trashTypeFilter") || "";
    } catch {
      return "";
    }
  });
  const compileLogRef = useRef<HTMLPreElement>(null);
  const [trashCount, setTrashCount] = useState(0);
  const [trashOpen, setTrashOpen] = useState(false);
  const [trashItems, setTrashItems] = useState<
    Array<{
      id: string;
      name: string;
      type: string;
      comment?: string;
      deleted_from_parent_id?: string;
    }>
  >([]);
  const [unusedHits, setUnusedHits] = useState<
    Array<{ id: string; name: string; type: string; comment?: string }>
  >([]);
  const [sessionCount, setSessionCount] = useState(0);
  const [sessionsOpen, setSessionsOpen] = useState(false);
  const [sessionList, setSessionList] = useState<ProjectSessionInfo[]>([]);
  const [helpOpen, setHelpOpen] = useState(false);
  const [objectPath, setObjectPath] = useState<ObjectPathEntry[]>([]);
  const [stats, setStats] = useState<ProjectStats | null>(null);
  const [statsFirewalls, setStatsFirewalls] = useState<TreeNode[]>([]);
  const [renameFocusToken, setRenameFocusToken] = useState(0);
  const [whereUsedCount, setWhereUsedCount] = useState<number | null>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);
  const ruleFilterRef = useRef<HTMLInputElement>(null);

  const canOperate = useMemo(() => Boolean(sessionId) && !busy, [sessionId, busy]);

  const visibleRules = useMemo(() => {
    let list = rules;
    if (hideDisabled) list = list.filter((r) => !r.disabled);
    else if (onlyDisabled) list = list.filter((r) => r.disabled);
    if (ruleActionFilter.trim()) {
      list = list.filter(
        (r) => "action" in r && String((r as PolicyRule).action ?? "") === ruleActionFilter,
      );
    }
    if (ruleGroupFilter.trim()) {
      const q = ruleGroupFilter.trim().toLowerCase();
      list = list.filter((r) => (r.group ?? "").toLowerCase().includes(q));
    }
    if (ruleTextFilter.trim()) {
      const q = ruleTextFilter.trim().toLowerCase();
      list = list.filter((r) => {
        const action = "action" in r ? String((r as PolicyRule).action ?? "") : "";
        const els: string[] = [];
        for (const key of Object.keys(r) as (keyof typeof r)[]) {
          const val = r[key];
          if (val && typeof val === "object" && "objects" in (val as object)) {
            els.push(formatRuleObjects(val as RuleElement));
          }
        }
        const blob = `${r.comment ?? ""} ${r.group ?? ""} ${action} ${els.join(" ")}`.toLowerCase();
        return blob.includes(q);
      });
    }
    return list;
  }, [rules, hideDisabled, onlyDisabled, ruleActionFilter, ruleGroupFilter, ruleTextFilter]);

  const ruleGroups = useMemo(() => {
    const set = new Set<string>();
    for (const r of rules) {
      if (r.group?.trim()) set.add(r.group.trim());
    }
    return Array.from(set).sort();
  }, [rules]);

  const ruleActions = useMemo(() => {
    const set = new Set<string>();
    for (const r of rules) {
      if ("action" in r && (r as PolicyRule).action) set.add(String((r as PolicyRule).action));
    }
    return Array.from(set).sort();
  }, [rules]);

  const unusedTypes = useMemo(() => {
    const set = new Set<string>();
    for (const h of unusedHits) {
      if (h.type) set.add(h.type);
    }
    return Array.from(set).sort();
  }, [unusedHits]);

  const visibleUnused = useMemo(() => {
    if (!unusedTypeFilter) return unusedHits;
    return unusedHits.filter((h) => h.type === unusedTypeFilter);
  }, [unusedHits, unusedTypeFilter]);

  const trashTypes = useMemo(() => {
    const set = new Set<string>();
    for (const h of trashItems) {
      if (h.type) set.add(h.type);
    }
    return Array.from(set).sort();
  }, [trashItems]);

  const visibleTrash = useMemo(() => {
    if (!trashTypeFilter) return trashItems;
    return trashItems.filter((h) => h.type === trashTypeFilter);
  }, [trashItems, trashTypeFilter]);

  useEffect(() => {
    const onBeforeUnload = (e: BeforeUnloadEvent) => {
      if (!dirty) return;
      e.preventDefault();
      e.returnValue = "";
    };
    window.addEventListener("beforeunload", onBeforeUnload);
    return () => window.removeEventListener("beforeunload", onBeforeUnload);
  }, [dirty]);

  useEffect(() => {
    try {
      localStorage.setItem("fwbweb.theme", theme);
    } catch {
      /* ignore */
    }
  }, [theme]);

  useEffect(() => {
    try {
      sessionStorage.setItem(
        "fwbweb.ruleFilters",
        JSON.stringify({
          hideDisabled,
          onlyDisabled,
          ruleActionFilter,
          ruleGroupFilter,
          ruleTextFilter,
        }),
      );
    } catch {
      /* ignore */
    }
  }, [hideDisabled, onlyDisabled, ruleActionFilter, ruleGroupFilter, ruleTextFilter]);

  useEffect(() => {
    try {
      sessionStorage.setItem("fwbweb.mainTab", tab);
    } catch {
      /* ignore */
    }
  }, [tab]);

  useEffect(() => {
    try {
      sessionStorage.setItem("fwbweb.treeFilter", treeFilter);
    } catch {
      /* ignore */
    }
  }, [treeFilter]);

  useEffect(() => {
    try {
      sessionStorage.setItem("fwbweb.searchType", searchType);
    } catch {
      /* ignore */
    }
  }, [searchType]);

  useEffect(() => {
    try {
      sessionStorage.setItem("fwbweb.unusedTypeFilter", unusedTypeFilter);
    } catch {
      /* ignore */
    }
  }, [unusedTypeFilter]);

  useEffect(() => {
    try {
      sessionStorage.setItem("fwbweb.trashTypeFilter", trashTypeFilter);
    } catch {
      /* ignore */
    }
  }, [trashTypeFilter]);

  useEffect(() => {
    if (!compileLog) return;
    compileLogRef.current?.scrollIntoView({ behavior: "smooth", block: "nearest" });
  }, [compileLog]);

  useEffect(() => {
    try {
      sessionStorage.setItem("fwbweb.compileLogWrap", compileLogWrap ? "1" : "0");
    } catch {
      /* ignore */
    }
  }, [compileLogWrap]);

  useEffect(() => {
    void refreshObjectPath(selected?.id ?? null);
  }, [sessionId, selected?.id]);

  useEffect(() => {
    if (!sessionId || !selected?.id || selected.deleted) {
      setWhereUsedCount(null);
      return;
    }
    let cancelled = false;
    void fetchWhereUsed(sessionId, selected.id)
      .then((res) => {
        if (!cancelled) setWhereUsedCount(res.count ?? 0);
      })
      .catch(() => {
        if (!cancelled) setWhereUsedCount(null);
      });
    return () => {
      cancelled = true;
    };
  }, [sessionId, selected?.id, selected?.deleted]);

  function rememberPath(p: string) {
    const next = [p, ...recentPaths.filter((x) => x !== p)].slice(0, 8);
    setRecentPaths(next);
    try {
      localStorage.setItem("fwbweb.recent", JSON.stringify(next));
    } catch {
      /* ignore quota */
    }
  }

  function persistRulesCtx(fwId: string, which: RulesWhich, rsId: string | null) {
    try {
      sessionStorage.setItem(
        "fwbweb.rulesCtx",
        JSON.stringify({ fwId, which, rulesetId: rsId }),
      );
      sessionStorage.setItem("fwbweb.rulesWhich", which);
    } catch {
      /* ignore */
    }
  }

  function metaFromFirewall(fw: {
    name?: string;
    attrs?: Record<string, string | number | undefined> | null;
  }) {
    const a = fw.attrs ?? {};
    return {
      name: fw.name || "",
      platform: a.platform != null ? String(a.platform) : undefined,
      host_OS: a.host_OS != null ? String(a.host_OS) : undefined,
      lastCompiled: a.lastCompiled != null ? String(a.lastCompiled) : undefined,
      lastInstalled: a.lastInstalled != null ? String(a.lastInstalled) : undefined,
      lastModified: a.lastModified != null ? String(a.lastModified) : undefined,
    };
  }

  async function refreshRulesFwMeta(fwId?: string | null) {
    const id = fwId || rulesFwId;
    if (!sessionId || !id) return;
    try {
      const fw = await fetchObject(sessionId, id);
      setRulesFwMeta(metaFromFirewall(fw));
    } catch {
      /* ignore */
    }
  }

  async function tryRestoreRulesCtx(sid: string) {
    try {
      const raw = sessionStorage.getItem("fwbweb.rulesCtx");
      if (!raw) return;
      const ctx = JSON.parse(raw) as {
        fwId?: string;
        which?: string;
        rulesetId?: string | null;
      };
      if (!ctx.fwId) return;
      if (ctx.which !== "policy" && ctx.which !== "nat" && ctx.which !== "routing") return;
      const fw = await fetchObject(sid, ctx.fwId);
      await loadRules(ctx.fwId, ctx.which, ctx.rulesetId || undefined);
      setStatus(`Restored ${ctx.which} for ${fw.name || ctx.fwId}`);
    } catch {
      /* stale or missing firewall — ignore */
    }
  }

  async function applyOpened(opened: {
    session_id: string;
    path: string;
    work_path: string;
  }, label: string) {
    setSessionId(opened.session_id);
    setPath(opened.path || opened.work_path);
    rememberPath(opened.path || opened.work_path);
    const t = await fetchTree(opened.session_id, 2);
    setTree(t.root);
    setSelected(null);
    setRules([]);
    setRulesFwId(null);
    setRulesFwMeta(null);
    setRulesetId(null);
    setRulesetList([]);
    setTab("object");
    setCompileLog(null);
    setCompileOutputs([]);
    setUnusedHits([]);
    setTrashOpen(false);
    setDirty(Boolean(t.dirty));
    setStatus(`${label}: ${t.path}`);
    await refreshTrashCount(opened.session_id);
    await refreshSessionCount();
  }

  async function onOpen() {
    if (sessionId && dirty && !window.confirm("Discard unsaved changes and open another project?"))
      return;
    if (sessionId) {
      try {
        await closeProject(sessionId);
      } catch {
        /* best-effort close before reopen */
      }
    }
    setBusy(true);
    setError(null);
    try {
      setToken(token);
      const opened = await openProject(path);
      await applyOpened(opened, "Open");
      await tryRestoreRulesCtx(opened.session_id);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onNewProject() {
    if (sessionId && dirty && !window.confirm("Discard unsaved changes and create a new project?"))
      return;
    const name = window.prompt("New project file name", "untitled.fwb");
    if (name === null) return;
    if (sessionId) {
      try {
        await closeProject(sessionId);
      } catch {
        /* best-effort */
      }
    }
    setBusy(true);
    setError(null);
    try {
      setToken(token);
      const opened = await newProject(name.trim() || "untitled.fwb");
      await applyOpened(opened, "New");
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onJumpWhereUsed(row: {
    id: string;
    name: string;
    type: string;
    parent_id?: string;
    parent_name?: string;
    parent_type?: string;
  }) {
    if (!sessionId) return;
    const isRule =
      row.type === "PolicyRule" ||
      row.type === "NATRule" ||
      row.type === "RoutingRule" ||
      row.type.endsWith("Rule");
    if (isRule) {
      setError(null);
      try {
        const pathRes = await fetchObjectPath(sessionId, row.id);
        const fw = [...(pathRes.path ?? [])]
          .reverse()
          .find((p) => p.type === "Firewall" || p.type === "Cluster");
        if (!fw) {
          setError("Could not find firewall for this rule");
          return;
        }
        const which: RulesWhich =
          row.parent_type === "NAT" || row.type === "NATRule"
            ? "nat"
            : row.parent_type === "Routing" || row.type === "RoutingRule"
              ? "routing"
              : "policy";
        await loadRules(fw.id, which, row.parent_id);
        setSelectedRuleId(row.id);
        setStatus(`Opened rule ${row.id} in ${fw.name}`);
      } catch (err) {
        setError(err instanceof Error ? err.message : String(err));
      }
      return;
    }
    await refreshTreeSelect(row.id);
  }

  async function onSelect(node: TreeNode) {
    if (!sessionId) {
      setSelected(node);
      return;
    }
    setBusy(true);
    setError(null);
    try {
      const full = await fetchObject(sessionId, node.id);
      setSelected(full);
      if (full.type === "Policy" || full.type === "NAT" || full.type === "Routing") {
        const which =
          full.type === "NAT" ? "nat" : full.type === "Routing" ? "routing" : "policy";
        const fwId =
          full.parent_type === "Firewall" || full.parent_type === "Cluster"
            ? full.parent_id
            : full.id;
        const data = await fetchRuleset(sessionId, full.id, which);
        setRules(data.rules ?? []);
        setRulesetName(data.name || full.name || which);
        setRulesFwId(fwId ?? full.id);
        setRulesetId(full.id);
        setRulesWhich(which);
        persistRulesCtx(fwId ?? full.id, which, full.id);
        if (fwId) {
          try {
            const fw = await fetchObject(sessionId, fwId);
            setRulesetList(fw.ruleset_list ?? []);
            setRulesFwMeta(metaFromFirewall(fw));
          } catch {
            setRulesetList([]);
          }
        }
        setTab("rules");
        setStatus(`${full.name} · ${data.rules?.length ?? 0} rules`);
      } else {
        setTab("object");
      }
    } catch (err) {
      setSelected(node);
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function loadRules(fwId: string, which: RulesWhich, preferRulesetId?: string) {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const fw = await fetchObject(sessionId, fwId);
      const list = fw.ruleset_list ?? [];
      setRulesetList(list);
      const wantType = which === "nat" ? "NAT" : which === "routing" ? "Routing" : "Policy";
      const candidates = list.filter((r) => r.type === wantType);
      const chosen =
        candidates.find((r) => r.id === preferRulesetId) ||
        candidates.find((r) => r.top) ||
        candidates[0] ||
        null;
      const targetId = chosen?.id || fw.rulesets?.[which] || fwId;
      const data = await fetchRuleset(sessionId, targetId, which);
      setRules(data.rules ?? []);
      setRulesetName(chosen?.name || data.name || which);
      setRulesFwId(fwId);
      setRulesFwMeta(metaFromFirewall(fw));
      setRulesetId(targetId);
      setRulesWhich(which);
      persistRulesCtx(fwId, which, targetId);
      setTab("rules");
      setStatus(`${chosen?.name || which} · ${data.rules?.length ?? 0} rules`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function refreshRules(opts?: { announce?: boolean }) {
    if (!sessionId || !rulesFwId) return;
    const target = rulesetId || rulesFwId;
    const data = await fetchRuleset(sessionId, target, rulesWhich);
    setRules(data.rules ?? []);
    setRulesetName(data.name || rulesWhich);
    const msg = `${rulesWhich} · ${data.rules?.length ?? 0} rules`;
    setStatus(opts?.announce ? `Refreshed ${msg}` : msg);
  }

  function onCopySelectedObjectTsv() {
    if (!selected) return;
    const line = [selected.type, selected.name || "", selected.id]
      .map((c) => String(c).replace(/\t|\n/g, " "))
      .join("\t");
    void navigator.clipboard.writeText(line).then(
      () => setStatus(`Copied object TSV ${selected.id}`),
      () => setError("Clipboard write failed"),
    );
  }

  function onDownloadShortcuts() {
    const blob = new Blob([shortcutsAsText()], { type: "text/plain" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "fwbweb-shortcuts.txt";
    a.click();
    URL.revokeObjectURL(url);
    setStatus("Downloaded shortcuts");
  }

  async function onSave(writeThrough = false) {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const res = await saveProject(sessionId, writeThrough);
      setDirty(false);
      setStatus(writeThrough ? `Saved + write-through: ${res.path}` : `Saved: ${res.path}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onSaveAs() {
    if (!sessionId) return;
    const dest = window.prompt("Save as path", path.replace(/\.fwb$/i, "") + "-copy.fwb");
    if (!dest?.trim()) return;
    setBusy(true);
    setError(null);
    try {
      const res = await saveProject(sessionId, false, dest.trim());
      setDirty(false);
      if (res.source_path) {
        setPath(res.source_path);
        rememberPath(res.source_path);
      }
      setStatus(`Saved as: ${res.source_path || dest}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onBulkDisable(disabled: boolean) {
    if (!sessionId || !visibleRules.length) return;
    const verb = disabled ? "Disable" : "Enable";
    if (!window.confirm(`${verb} ${visibleRules.length} visible rule(s)?`)) return;
    setBusy(true);
    setError(null);
    try {
      for (const rule of visibleRules) {
        if (Boolean(rule.disabled) === disabled) continue;
        await updateRule(sessionId, rule.id, { disabled });
      }
      setDirty(true);
      await refreshRules();
      setStatus(disabled ? `Disabled ${visibleRules.length} visible rules` : `Enabled ${visibleRules.length} visible rules`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onBulkLogging(logging: boolean) {
    if (!sessionId || !visibleRules.length) return;
    const verb = logging ? "Enable logging on" : "Disable logging on";
    if (!window.confirm(`${verb} ${visibleRules.length} visible rule(s)?`)) return;
    setBusy(true);
    setError(null);
    try {
      for (const rule of visibleRules) {
        const cur = "logging" in rule ? Boolean((rule as PolicyRule).logging) : false;
        if (cur === logging) continue;
        await updateRule(sessionId, rule.id, { logging });
      }
      setDirty(true);
      await refreshRules();
      setStatus(
        logging
          ? `Logging on for ${visibleRules.length} visible rules`
          : `Logging off for ${visibleRules.length} visible rules`,
      );
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onBulkDirection() {
    if (!sessionId || !visibleRules.length) return;
    const withDir = visibleRules.filter((r) => "direction" in r);
    if (!withDir.length) {
      setError("Visible rules have no direction field");
      return;
    }
    const current = String((withDir[0] as PolicyRule).direction ?? "Both");
    const next = window.prompt(
      `Set direction on ${withDir.length} visible rule(s) (Inbound|Outbound|Both)`,
      current,
    );
    if (next === null) return;
    const direction = next.trim();
    if (!direction) return;
    if (!["Inbound", "Outbound", "Both"].includes(direction)) {
      setError("direction must be Inbound, Outbound, or Both");
      return;
    }
    if (!window.confirm(`Set direction “${direction}” on ${withDir.length} visible rule(s)?`))
      return;
    setBusy(true);
    setError(null);
    try {
      for (const rule of withDir) {
        if (String((rule as PolicyRule).direction ?? "") === direction) continue;
        await updateRule(sessionId, rule.id, { direction });
      }
      setDirty(true);
      await refreshRules();
      setStatus(`Set direction “${direction}” on ${withDir.length} visible rules`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onBulkAction() {
    if (!sessionId || !visibleRules.length) return;
    const withAction = visibleRules.filter((r) => "action" in r);
    if (!withAction.length) {
      setError("Visible rules have no action field (Routing?)");
      return;
    }
    const current = String((withAction[0] as PolicyRule | NatRule).action ?? "");
    const next = window.prompt(
      `Set action on ${withAction.length} visible rule(s)`,
      current || "Accept",
    );
    if (next === null) return;
    const action = next.trim();
    if (!action) return;
    if (!window.confirm(`Set action “${action}” on ${withAction.length} visible rule(s)?`)) return;
    setBusy(true);
    setError(null);
    try {
      for (const rule of withAction) {
        if (String((rule as PolicyRule | NatRule).action ?? "") === action) continue;
        await updateRule(sessionId, rule.id, { action });
      }
      setDirty(true);
      await refreshRules();
      setStatus(`Set action “${action}” on ${withAction.length} visible rules`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      const target = e.target as HTMLElement | null;
      const typing =
        target &&
        (target.tagName === "INPUT" ||
          target.tagName === "TEXTAREA" ||
          target.tagName === "SELECT" ||
          target.isContentEditable);
      const mod = e.ctrlKey || e.metaKey;
      if (!typing && !mod && !e.altKey && e.key === "?") {
        e.preventDefault();
        setHelpOpen((v) => !v);
        return;
      }
      if (e.key === "Escape" && !typing && helpOpen) {
        e.preventDefault();
        setHelpOpen(false);
        return;
      }
      if (!sessionId || busy) return;
      if (mod && e.key.toLowerCase() === "s") {
        e.preventDefault();
        void onSave(e.shiftKey);
        return;
      }
      if (mod && e.key.toLowerCase() === "f") {
        e.preventDefault();
        searchInputRef.current?.focus();
        searchInputRef.current?.select();
        return;
      }
      if (mod && e.key.toLowerCase() === "n" && !e.shiftKey) {
        e.preventDefault();
        void onNewProject();
        return;
      }
      if (mod && e.key.toLowerCase() === "e") {
        e.preventDefault();
        if (e.shiftKey) void onCompileAll();
        else if (rulesFwId) void onCompile();
        return;
      }
      if (e.altKey && !mod && e.key.toLowerCase() === "r") {
        // Open Policy rules for selected Firewall/Cluster, or current rulesFwId.
        e.preventDefault();
        if (selected && (selected.type === "Firewall" || selected.type === "Cluster")) {
          void loadRules(selected.id, "policy");
        } else if (rulesFwId) {
          void loadRules(rulesFwId, "policy");
        }
        return;
      }
      if (e.altKey && !mod && e.key.toLowerCase() === "n") {
        e.preventDefault();
        if (selected && (selected.type === "Firewall" || selected.type === "Cluster")) {
          void loadRules(selected.id, "nat");
        } else if (rulesFwId) {
          void loadRules(rulesFwId, "nat");
        }
        return;
      }
      if (e.altKey && !mod && e.key.toLowerCase() === "g") {
        e.preventDefault();
        if (selected && (selected.type === "Firewall" || selected.type === "Cluster")) {
          void loadRules(selected.id, "routing");
        } else if (rulesFwId) {
          void loadRules(rulesFwId, "routing");
        }
        return;
      }
      if (e.altKey && !mod && e.key.toLowerCase() === "p") {
        // Cycle Policy → NAT → Routing for current firewall.
        e.preventDefault();
        const fwId =
          selected && (selected.type === "Firewall" || selected.type === "Cluster")
            ? selected.id
            : rulesFwId;
        if (!fwId) return;
        const order: RulesWhich[] = ["policy", "nat", "routing"];
        const cur =
          fwId === rulesFwId ? rulesWhich : ("policy" as RulesWhich);
        const next = order[(order.indexOf(cur) + 1) % order.length] ?? "policy";
        void loadRules(fwId, next);
        setStatus(`Rules: ${next}`);
        return;
      }
      if (e.altKey && !mod && e.key.toLowerCase() === "d" && (rulesFwId || selected)) {
        e.preventDefault();
        const fw =
          selected && (selected.type === "Firewall" || selected.type === "Cluster")
            ? selected.id
            : rulesFwId || undefined;
        if (fw) void onDeployDryRun(fw);
        return;
      }
      if (e.altKey && !mod && (e.key === "," || e.key === "<") && recentPaths.length) {
        e.preventDefault();
        onCycleRecent(-1);
        return;
      }
      if (e.altKey && !mod && (e.key === "." || e.key === ">") && recentPaths.length) {
        e.preventDefault();
        onCycleRecent(1);
        return;
      }
      if (mod && e.key.toLowerCase() === "i") {
        e.preventDefault();
        void onShowStats();
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "f") {
        e.preventDefault();
        setTab("rules");
        queueMicrotask(() => {
          ruleFilterRef.current?.focus();
          ruleFilterRef.current?.select();
        });
        return;
      }
      if (!mod && !e.altKey && e.key === "F2") {
        e.preventDefault();
        setTab("object");
        setRenameFocusToken((n) => n + 1);
        return;
      }
      if (e.key === "Escape" && !typing) {
        if (picker) {
          setPicker(null);
          return;
        }
        if (stats) {
          setStats(null);
          return;
        }
        if (sessionsOpen) {
          setSessionsOpen(false);
          return;
        }
        if (trashOpen) {
          setTrashOpen(false);
          return;
        }
        if (unusedHits.length) {
          setUnusedHits([]);
          return;
        }
        if (searchHits.length || searchQ) {
          setSearchHits([]);
          setSearchQ("");
          return;
        }
        if (
          tab === "rules" &&
          (ruleTextFilter ||
            ruleGroupFilter ||
            ruleActionFilter ||
            hideDisabled ||
            onlyDisabled)
        ) {
          e.preventDefault();
          setRuleTextFilter("");
          setRuleGroupFilter("");
          setRuleActionFilter("");
          setHideDisabled(false);
          setOnlyDisabled(false);
          setStatus("Filters cleared");
          return;
        }
        if (compileLog) {
          e.preventDefault();
          onClearCompileLog();
          return;
        }
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "c" && selected) {
        e.preventDefault();
        void navigator.clipboard.writeText(selected.id).then(
          () => setStatus(`Copied object id ${selected.id}`),
          () => setError("Clipboard write failed"),
        );
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "n" && selected?.name) {
        e.preventDefault();
        void navigator.clipboard.writeText(selected.name).then(
          () => setStatus(`Copied object name ${selected.name}`),
          () => setError("Clipboard write failed"),
        );
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "y" && selected) {
        e.preventDefault();
        onCopySelectedObjectTsv();
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "m" && selected) {
        e.preventDefault();
        const text = selected.comment ?? "";
        void navigator.clipboard.writeText(text).then(
          () => setStatus(text ? "Copied object comment" : "Object has no comment"),
          () => setError("Clipboard write failed"),
        );
        return;
      }
      if (mod && !e.shiftKey && e.key === "[" && sessionId) {
        e.preventDefault();
        void onCollapseTree();
        return;
      }
      if (mod && !e.shiftKey && e.key === "]" && sessionId) {
        e.preventDefault();
        void onExpandTree();
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "p" && objectPath.length) {
        e.preventDefault();
        const text = objectPath.map((p) => p.name || p.type).join(" / ");
        void navigator.clipboard.writeText(text).then(
          () => setStatus("Copied object path"),
          () => setError("Clipboard write failed"),
        );
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "g" && path) {
        e.preventDefault();
        void navigator.clipboard.writeText(path).then(
          () => setStatus("Copied project path"),
          () => setError("Clipboard write failed"),
        );
        return;
      }
      if (mod && e.key.toLowerCase() === "d") {
        if (tab === "rules" && selectedRuleId) {
          e.preventDefault();
          void onDuplicateRule();
          return;
        }
        if (tab === "object" && selected && !selected.ro && selected.type !== "FWObjectDatabase") {
          e.preventDefault();
          void onDuplicateObject();
          return;
        }
      }
      if (
        tab === "rules" &&
        !typing &&
        !e.altKey &&
        rulesFwId &&
        ((e.key === "Insert" && !mod) || (e.key === "Enter" && mod && !e.metaKey))
      ) {
        e.preventDefault();
        void onAddRule(e.shiftKey ? "top" : "bottom");
        return;
      }
      if (!mod && !e.altKey && e.key === "/" && !typing) {
        e.preventDefault();
        searchInputRef.current?.focus();
        searchInputRef.current?.select();
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "l" && !typing) {
        e.preventDefault();
        setTheme((t) => (t === "dark" ? "light" : "dark"));
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "u" && sessionId) {
        e.preventDefault();
        void onFindUnused();
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "k" && compileLog) {
        e.preventDefault();
        onCopyCompileLog();
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "x" && compileLog) {
        e.preventDefault();
        onClearCompileLog();
        return;
      }
      if (mod && e.shiftKey && e.key.toLowerCase() === "d" && compileLog) {
        e.preventDefault();
        onDownloadCompileLog();
        return;
      }
      if (mod && !e.shiftKey && e.key === "1") {
        e.preventDefault();
        setTab("object");
        return;
      }
      if (mod && !e.shiftKey && e.key === "2") {
        e.preventDefault();
        setTab("rules");
        return;
      }
      if (
        tab === "rules" &&
        !mod &&
        !e.altKey &&
        e.key.toLowerCase() === "i" &&
        selectedRuleId &&
        !typing
      ) {
        e.preventDefault();
        void navigator.clipboard.writeText(selectedRuleId).then(
          () => setStatus(`Copied rule id ${selectedRuleId}`),
          () => setError("Clipboard write failed"),
        );
        return;
      }
      if (
        tab === "rules" &&
        !mod &&
        !e.altKey &&
        e.key.toLowerCase() === "p" &&
        selectedRuleId &&
        !typing
      ) {
        e.preventDefault();
        const rule = visibleRules.find((r) => r.id === selectedRuleId) ||
          rules.find((r) => r.id === selectedRuleId);
        if (!rule) return;
        const pos = String(rule.position ?? "");
        void navigator.clipboard.writeText(pos).then(
          () => setStatus(`Copied rule position ${pos}`),
          () => setError("Clipboard write failed"),
        );
        return;
      }
      if (
        tab === "object" &&
        !typing &&
        !mod &&
        (e.key === "Delete" || e.key === "Backspace") &&
        selected &&
        !selected.ro &&
        selected.type !== "FWObjectDatabase" &&
        selected.type !== "Library"
      ) {
        e.preventDefault();
        void onDeleteObject(false);
        return;
      }
      if (tab !== "rules" || typing) return;
      if (!mod && !e.altKey && e.key.toLowerCase() === "r" && rulesFwId) {
        e.preventDefault();
        void refreshRules({ announce: true });
        return;
      }
      if (e.altKey && selectedRuleId && (e.key === "ArrowUp" || e.key === "ArrowDown")) {
        e.preventDefault();
        void onMoveRule(e.key === "ArrowUp" ? "up" : "down");
        return;
      }
      if (!mod && !e.altKey && (e.key === "ArrowUp" || e.key === "ArrowDown") && visibleRules.length) {
        e.preventDefault();
        const idx = visibleRules.findIndex((r) => r.id === selectedRuleId);
        const next =
          e.key === "ArrowUp"
            ? Math.max(0, (idx < 0 ? 0 : idx) - 1)
            : Math.min(visibleRules.length - 1, (idx < 0 ? -1 : idx) + 1);
        setSelectedRuleId(visibleRules[next]?.id);
        return;
      }
      if (!mod && !e.altKey && e.key === "Home" && visibleRules.length) {
        e.preventDefault();
        setSelectedRuleId(visibleRules[0]?.id);
        return;
      }
      if (!mod && !e.altKey && e.key === "End" && visibleRules.length) {
        e.preventDefault();
        setSelectedRuleId(visibleRules[visibleRules.length - 1]?.id);
        return;
      }
      if (
        !mod &&
        !e.altKey &&
        (e.key === "PageUp" || e.key === "PageDown") &&
        visibleRules.length
      ) {
        e.preventDefault();
        const step = 10;
        const idx = visibleRules.findIndex((r) => r.id === selectedRuleId);
        const cur = idx < 0 ? 0 : idx;
        const next =
          e.key === "PageUp"
            ? Math.max(0, cur - step)
            : Math.min(visibleRules.length - 1, cur + step);
        setSelectedRuleId(visibleRules[next]?.id);
        return;
      }
      if (!mod && !e.altKey && e.key.toLowerCase() === "n") {
        const disabled = rules.filter((r) => r.disabled);
        if (!disabled.length) return;
        e.preventDefault();
        if (hideDisabled) setHideDisabled(false);
        if (!onlyDisabled) setOnlyDisabled(true);
        const idx = disabled.findIndex((r) => r.id === selectedRuleId);
        const pick = e.shiftKey
          ? disabled[(idx <= 0 ? disabled.length : idx) - 1]
          : disabled[(idx + 1) % disabled.length];
        if (pick) setSelectedRuleId(pick.id);
        return;
      }
      if (!mod && !e.altKey && e.key.toLowerCase() === "o") {
        e.preventDefault();
        setOnlyDisabled((v) => {
          const next = !v;
          if (next) setHideDisabled(false);
          return next;
        });
        return;
      }
      if (!mod && !e.altKey && e.key.toLowerCase() === "f") {
        // Cycle disabled filter: all → hide → only → all
        e.preventDefault();
        if (!hideDisabled && !onlyDisabled) {
          setHideDisabled(true);
          setOnlyDisabled(false);
          setStatus("Filter: hide disabled");
        } else if (hideDisabled) {
          setHideDisabled(false);
          setOnlyDisabled(true);
          setStatus("Filter: only disabled");
        } else {
          setHideDisabled(false);
          setOnlyDisabled(false);
          setStatus("Filter: all rules");
        }
        return;
      }
      if (!mod && !e.altKey && e.key.toLowerCase() === "a" && ruleActions.length) {
        e.preventDefault();
        const opts = ["", ...ruleActions];
        const idx = opts.indexOf(ruleActionFilter);
        const next = opts[(idx + 1) % opts.length] ?? "";
        setRuleActionFilter(next);
        setStatus(next ? `Filter: action=${next}` : "Filter: all actions");
        return;
      }
      if (!mod && !e.altKey && e.key.toLowerCase() === "u" && ruleGroups.length) {
        e.preventDefault();
        const opts = ["", ...ruleGroups];
        const idx = opts.indexOf(ruleGroupFilter);
        const next = opts[(idx + 1) % opts.length] ?? "";
        setRuleGroupFilter(next);
        setStatus(next ? `Filter: group=${next}` : "Filter: all groups");
        return;
      }
      if (!mod && !e.altKey && e.key.toLowerCase() === "t" && selectedRuleId) {
        e.preventDefault();
        onCopySelectedRuleTsv();
        return;
      }
      if (!mod && !e.altKey && e.key.toLowerCase() === "y" && selectedRuleId) {
        e.preventDefault();
        onCopySelectedRuleJson();
        return;
      }
      if (!mod && !e.altKey && e.key.toLowerCase() === "j" && rules.length) {
        e.preventDefault();
        onJumpToRulePosition();
        return;
      }
      if (e.key === " " && selectedRuleId && !mod && !e.altKey) {
        e.preventDefault();
        const rule = visibleRules.find((r) => r.id === selectedRuleId);
        if (rule) void onToggleRule(rule);
        return;
      }
      if (e.key.toLowerCase() === "c" && selectedRuleId && !mod && !e.altKey) {
        e.preventDefault();
        void onCommentSelectedRule();
        return;
      }
      if (e.key.toLowerCase() === "m" && selectedRuleId && !mod && !e.altKey) {
        e.preventDefault();
        void onGroupSelectedRule();
        return;
      }
      if (e.key.toLowerCase() === "l" && selectedRuleId && !mod && !e.altKey) {
        e.preventDefault();
        const rule = visibleRules.find((r) => r.id === selectedRuleId);
        if (rule) void onToggleLogging(rule);
        return;
      }
      if (e.key.toLowerCase() === "g" && selectedRuleId && !mod && !e.altKey) {
        e.preventDefault();
        const rule = visibleRules.find((r) => r.id === selectedRuleId);
        if (rule) void onCycleDirection(rule);
        return;
      }
      if ((e.key === "Delete" || e.key === "Backspace") && selectedRuleId && !mod) {
        e.preventDefault();
        if (window.confirm("Delete selected rule?")) void onDeleteRule();
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [
    sessionId,
    busy,
    tab,
    selectedRuleId,
    selected,
    visibleRules,
    rules,
    hideDisabled,
    onlyDisabled,
    ruleActionFilter,
    ruleActions,
    ruleGroupFilter,
    ruleGroups,
    picker,
    trashOpen,
    unusedHits,
    searchHits,
    searchQ,
    stats,
    sessionsOpen,
    helpOpen,
    rulesFwId,
    rulesWhich,
    ruleTextFilter,
    ruleGroupFilter,
    ruleActionFilter,
    objectPath,
    compileLog,
    recentPaths,
    path,
  ]);

  async function onApplyObject(patch: {
    name: string;
    comment: string;
    attrs: Record<string, string | number>;
  }) {
    if (!sessionId || !selected) return;
    setBusy(true);
    setError(null);
    try {
      const updated = await updateObject(sessionId, selected.id, patch);
      setSelected(updated);
      setDirty(true);
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus(`Updated ${updated.name}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onToggleRo() {
    if (!sessionId || !selected) return;
    setBusy(true);
    setError(null);
    try {
      const updated = await setObjectRo(sessionId, selected.id, !selected.ro);
      setSelected(updated);
      setDirty(true);
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus(`${updated.ro ? "Locked" : "Unlocked"} ${updated.name}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDeleteObject(permanent = false) {
    if (!sessionId || !selected) return;
    const inTrash = Boolean(selected.deleted);
    const isRuleset =
      selected.type === "Policy" || selected.type === "NAT" || selected.type === "Routing";
    const purge = permanent || inTrash || isRuleset;
    let usedNote = "";
    if (!purge && !inTrash) {
      try {
        const wu = await fetchWhereUsed(sessionId, selected.id);
        if (wu.count > 0) usedNote = `\nReferenced in ${wu.count} place(s).`;
      } catch {
        /* ignore */
      }
    }
    const msg = purge
      ? `Permanently purge ${selected.type} “${selected.name}”?${
          isRuleset ? "\nRulesets are always removed permanently." : ""
        }`
      : `Move ${selected.type} “${selected.name}” to Deleted Objects?${usedNote}`;
    if (!window.confirm(msg)) return;
    setBusy(true);
    setError(null);
    try {
      const res = await deleteObject(sessionId, selected.id, purge);
      const deletedId = selected.id;
      setSelected(null);
      setDirty(true);
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      if (isRuleset && rulesFwId) {
        setUnusedHits((prev) => prev.filter((u) => u.id !== deletedId));
        await loadRules(rulesFwId, rulesWhich);
      }
      setStatus(res.purged ? "Object purged" : "Object moved to Deleted Objects");
      await refreshTrashCount();
      await refreshSessionCount();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDeleteUnused() {
    if (!sessionId || !unusedHits.length) return;
    const targets = unusedTypeFilter
      ? unusedHits.filter((h) => h.type === unusedTypeFilter)
      : unusedHits;
    if (!targets.length) return;
    if (
      !window.confirm(
        `Move ${targets.length} unused object(s) to Deleted Objects?`,
      )
    )
      return;
    setBusy(true);
    setError(null);
    try {
      let n = 0;
      const gone = new Set<string>();
      for (const hit of targets) {
        await deleteObject(sessionId, hit.id, false);
        gone.add(hit.id);
        n += 1;
      }
      setUnusedHits((prev) => prev.filter((u) => !gone.has(u.id)));
      setDirty(true);
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus(`Moved ${n} unused object(s) to Deleted Objects`);
      await refreshTrashCount();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDeleteOneUnused(objectId: string) {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      await deleteObject(sessionId, objectId, false);
      setUnusedHits((prev) => prev.filter((u) => u.id !== objectId));
      setDirty(true);
      if (selected?.id === objectId) setSelected(null);
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus("Moved unused object to Deleted Objects");
      await refreshTrashCount();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDeleteRuleset() {
    if (!sessionId || !rulesetId || !rulesFwId) return;
    const entry = rulesetList.find((r) => r.id === rulesetId);
    if (!entry) return;
    const sameType = rulesetList.filter((r) => r.type === entry.type);
    if (sameType.length < 2) {
      setError("Cannot delete the only ruleset of this type");
      return;
    }
    if (entry.top) {
      setError("Demote or switch away from the top ruleset before deleting it");
      return;
    }
    if (
      !window.confirm(
        `Permanently delete ruleset “${entry.name}” and all its rules?`,
      )
    )
      return;
    setBusy(true);
    setError(null);
    try {
      await deleteObject(sessionId, rulesetId, true);
      setDirty(true);
      setStatus(`Deleted ruleset ${entry.name}`);
      await loadRules(rulesFwId, rulesWhich);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function refreshSessionCount() {
    try {
      const res = await listSessions();
      setSessionCount(res.count ?? 0);
      setSessionList(res.sessions ?? []);
    } catch {
      /* ignore */
    }
  }

  async function onShowSessions() {
    setBusy(true);
    setError(null);
    try {
      const res = await listSessions();
      setSessionCount(res.count ?? 0);
      setSessionList(res.sessions ?? []);
      setSessionsOpen(true);
      setStatus(`Open sessions: ${res.count ?? 0}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onExpandTree() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus("Tree expanded (depth 5)");
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function restoreObjectById(objectId: string) {
    if (!sessionId) return;
    const restored = await restoreDeletedObject(sessionId, objectId);
    setDirty(true);
    await refreshTreeSelect(restored.id);
    setStatus(`Restored ${restored.name} → ${restored.parent_id ?? "?"}`);
    await refreshTrashCount();
  }

  async function onRestoreObject() {
    if (!sessionId || !selected?.deleted) return;
    setBusy(true);
    setError(null);
    try {
      await restoreObjectById(selected.id);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onRestoreFromTrash(objectId: string) {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      await restoreObjectById(objectId);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onPurgeFromTrash(objectId: string) {
    if (!sessionId) return;
    if (!window.confirm("Permanently purge this deleted object?")) return;
    setBusy(true);
    setError(null);
    try {
      await deleteObject(sessionId, objectId, true);
      setDirty(true);
      if (selected?.id === objectId) setSelected(null);
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus("Purged deleted object");
      await refreshTrashCount();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onEmptyDeleted() {
    if (!sessionId) return;
    if (!window.confirm("Permanently purge all objects in Deleted Objects?")) return;
    setBusy(true);
    setError(null);
    try {
      const res = await emptyDeletedObjects(sessionId);
      setDirty(true);
      if (selected?.deleted) setSelected(null);
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus(`Emptied Deleted Objects (${res.purged_count ?? 0} purged)`);
      await refreshTrashCount();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onRestoreAllTrash() {
    if (!sessionId || !trashItems.length) return;
    if (!window.confirm(`Restore all ${trashItems.length} deleted object(s)?`)) return;
    setBusy(true);
    setError(null);
    try {
      let n = 0;
      for (const item of [...trashItems]) {
        await restoreDeletedObject(sessionId, item.id);
        n += 1;
      }
      setDirty(true);
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus(`Restored ${n} object(s) from trash`);
      await refreshTrashCount();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onCollapseTree() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const t = await fetchTree(sessionId, 1);
      setTree(t.root);
      setStatus("Tree collapsed");
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onShowStats() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const res = await fetchProjectStats(sessionId);
      setStats(res);
      try {
        const fw = await searchObjects(sessionId, "", "Firewall");
        const basic = (fw.results ?? []).filter((r) => !String(r.id).startsWith("std"));
        const enriched: TreeNode[] = [];
        for (const row of basic.slice(0, 40)) {
          try {
            enriched.push(await fetchObject(sessionId, row.id));
          } catch {
            enriched.push(row);
          }
        }
        setStatsFirewalls(enriched);
      } catch {
        setStatsFirewalls([]);
      }
      setStatus(
        `Stats: ${res.objects} objects, ${res.rules} rules, ${res.deleted} deleted`,
      );
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  function onDownloadStats() {
    if (!stats) return;
    const payload = { ...stats, firewalls_list: statsFirewalls.map((f) => ({
      id: f.id,
      name: f.name,
      type: f.type,
      platform: f.attrs?.platform,
      host_OS: f.attrs?.host_OS,
    })) };
    const blob = new Blob([JSON.stringify(payload, null, 2)], {
      type: "application/json",
    });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "fwbweb-stats.json";
    a.click();
    URL.revokeObjectURL(url);
    setStatus("Downloaded stats JSON");
  }

  function statsToTsv(): string {
    if (!stats) return "";
    const rows: Array<[string, string]> = [
      ["libraries", String(stats.libraries)],
      ["objects", String(stats.objects)],
      ["firewalls", String(stats.firewalls)],
      ["clusters", String(stats.clusters ?? 0)],
      ["hosts", String(stats.hosts)],
      ["interfaces", String(stats.interfaces)],
      ["addresses", String(stats.addresses)],
      ["services", String(stats.services)],
      ["rulesets", String(stats.rulesets ?? 0)],
      ["rules", String(stats.rules)],
      ["deleted", String(stats.deleted)],
      ["unused", String(stats.unused ?? 0)],
    ];
    const lines = ["metric\tvalue", ...rows.map(([k, v]) => `${k}\t${v}`)];
    if (statsFirewalls.length) {
      lines.push("", "firewall_id\tname\tplatform\thost_OS");
      for (const f of statsFirewalls) {
        lines.push(
          [
            f.id,
            (f.name || "").replace(/\t|\n/g, " "),
            String(f.attrs?.platform ?? "").replace(/\t|\n/g, " "),
            String(f.attrs?.host_OS ?? "").replace(/\t|\n/g, " "),
          ].join("\t"),
        );
      }
    }
    return lines.join("\n");
  }

  function onDownloadStatsTsv() {
    if (!stats) return;
    const blob = new Blob([statsToTsv()], { type: "text/tab-separated-values" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "fwbweb-stats.tsv";
    a.click();
    URL.revokeObjectURL(url);
    setStatus("Downloaded stats TSV");
  }

  function onDownloadCompileLog() {
    if (!compileLog) return;
    const blob = new Blob([compileLog], { type: "text/plain" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "fwbweb-compile.log";
    a.click();
    URL.revokeObjectURL(url);
    setStatus("Downloaded compile log");
  }

  function onCopyCompileLog() {
    if (!compileLog) return;
    void navigator.clipboard.writeText(compileLog).then(
      () => setStatus("Copied compile/deploy log"),
      () => setError("Clipboard write failed"),
    );
  }

  function onClearCompileLog() {
    if (!compileLog && !compileOutputs.length) return;
    setCompileLog(null);
    setCompileOutputs([]);
    setStatus("Cleared compile/deploy log");
  }

  async function onFindUnused() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const res = await findUnusedObjects(sessionId);
      const sorted = [...(res.objects ?? [])].sort((a, b) => {
        const t = a.type.localeCompare(b.type);
        if (t !== 0) return t;
        return (a.name || "").localeCompare(b.name || "");
      });
      setUnusedHits(sorted);
      setSearchHits([]);
      setStatus(`Unused objects: ${res.count ?? 0}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onJumpParent() {
    if (!sessionId || !selected?.parent_id) return;
    setBusy(true);
    setError(null);
    try {
      const parent = await fetchObject(sessionId, selected.parent_id);
      setSelected(parent);
      setStatus(`Parent: ${parent.name}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function refreshObjectPath(id?: string | null) {
    if (!sessionId || !id) {
      setObjectPath([]);
      return;
    }
    try {
      const res = await fetchObjectPath(sessionId, id);
      setObjectPath(res.path ?? []);
    } catch {
      setObjectPath([]);
    }
  }

  async function onMakeRulesetTop() {
    if (!sessionId || !rulesetId || !rulesFwId) return;
    setBusy(true);
    setError(null);
    try {
      await updateObject(sessionId, rulesetId, { attrs: { top: "True" } });
      setDirty(true);
      setStatus("Ruleset marked as top");
      await loadRules(rulesFwId, rulesWhich, rulesetId);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onRenameRuleset() {
    if (!sessionId || !rulesetId || !rulesFwId) return;
    const next = window.prompt("Rename ruleset", rulesetName || "");
    if (next === null) return;
    const name = next.trim();
    if (!name || name === rulesetName) return;
    setBusy(true);
    setError(null);
    try {
      await updateObject(sessionId, rulesetId, { name });
      setDirty(true);
      setStatus(`Ruleset renamed → ${name}`);
      await loadRules(rulesFwId, rulesWhich, rulesetId);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDuplicateRuleset() {
    if (!sessionId || !rulesFwId) return;
    const wantType =
      rulesWhich === "nat" ? "NAT" : rulesWhich === "routing" ? "Routing" : "Policy";
    if (wantType === "Routing") {
      setError("Cannot duplicate Routing: Firewall allows only one Routing ruleset");
      return;
    }
    const suggested = `${rulesetName || wantType} Copy`;
    const next = window.prompt(`Duplicate ${wantType} as`, suggested);
    if (next === null) return;
    const name = next.trim();
    if (!name) return;
    if (
      !window.confirm(
        `Create secondary ${wantType} “${name}” and copy ${rules.length} rule(s)?`,
      )
    )
      return;
    setBusy(true);
    setError(null);
    try {
      const created = await createObject(sessionId, {
        parent_id: rulesFwId,
        type: wantType,
        name,
      });
      const sourceRules = [...rules].sort(
        (a, b) => (a.position ?? 0) - (b.position ?? 0),
      );
      for (const rule of sourceRules) {
        await duplicateRule(sessionId, rule.id, created.id);
      }
      setDirty(true);
      setStatus(`Duplicated ruleset → ${name} (${sourceRules.length} rules)`);
      await loadRules(rulesFwId, rulesWhich, created.id);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  function rulesToTsv(list: AnyRule[] = visibleRules): string {
    const cols = [
      "id",
      "pos",
      "disabled",
      "logging",
      "direction",
      "group",
      "action",
      "src",
      "dst",
      "srv",
      "itf",
      "when",
      "comment",
    ];
    const lines = [cols.join("\t")];
    for (const r of list) {
      const action = "action" in r ? String((r as PolicyRule).action ?? "") : "";
      const direction = "direction" in r ? String((r as PolicyRule).direction ?? "") : "";
      const logging =
        "logging" in r ? ((r as PolicyRule).logging ? "1" : "0") : "";
      const cell = (el: RuleElement | undefined) =>
        el ? formatRuleObjects(el).replace(/\t|\n/g, " ") : "";
      const pr = r as PolicyRule;
      lines.push(
        [
          r.id,
          String(r.position ?? ""),
          r.disabled ? "1" : "0",
          logging,
          direction,
          (r.group ?? "").replace(/\t|\n/g, " "),
          action,
          cell(pr.src),
          cell(pr.dst),
          cell(pr.srv),
          cell(pr.itf),
          cell(pr.when),
          (r.comment ?? "").replace(/\t|\n/g, " "),
        ].join("\t"),
      );
    }
    return lines.join("\n");
  }

  function onCopyRulesTsv() {
    if (!visibleRules.length) return;
    void navigator.clipboard.writeText(rulesToTsv()).then(
      () => setStatus(`Copied ${visibleRules.length} rule(s) as TSV`),
      () => setError("Clipboard write failed"),
    );
  }

  function onCopySelectedRuleTsv() {
    const rule = visibleRules.find((r) => r.id === selectedRuleId);
    if (!rule) return;
    void navigator.clipboard.writeText(rulesToTsv([rule])).then(
      () => setStatus(`Copied selected rule ${rule.id} as TSV`),
      () => setError("Clipboard write failed"),
    );
  }

  function onDownloadRulesTsv() {
    if (!visibleRules.length) return;
    const blob = new Blob([rulesToTsv()], { type: "text/tab-separated-values" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `${rulesetName || rulesWhich || "rules"}.tsv`;
    a.click();
    URL.revokeObjectURL(url);
    setStatus(`Downloaded ${visibleRules.length} rule(s) as TSV`);
  }

  function rulesJsonPayload(list: AnyRule[] = visibleRules) {
    return {
      ruleset_id: rulesetId,
      ruleset_name: rulesetName,
      which: rulesWhich,
      count: list.length,
      rules: list,
    };
  }

  function onDownloadRulesJson() {
    if (!visibleRules.length) return;
    const blob = new Blob([JSON.stringify(rulesJsonPayload(), null, 2)], {
      type: "application/json",
    });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `${rulesetName || rulesWhich || "rules"}.json`;
    a.click();
    URL.revokeObjectURL(url);
    setStatus(`Downloaded ${visibleRules.length} rule(s) as JSON`);
  }

  function onCopyRulesJson() {
    if (!visibleRules.length) return;
    void navigator.clipboard.writeText(JSON.stringify(rulesJsonPayload(), null, 2)).then(
      () => setStatus(`Copied ${visibleRules.length} rule(s) as JSON`),
      () => setError("Clipboard write failed"),
    );
  }

  function onCopySelectedRuleJson() {
    const rule = visibleRules.find((r) => r.id === selectedRuleId);
    if (!rule) return;
    void navigator.clipboard.writeText(JSON.stringify(rulesJsonPayload([rule]), null, 2)).then(
      () => setStatus(`Copied selected rule ${rule.id} as JSON`),
      () => setError("Clipboard write failed"),
    );
  }

  async function onDuplicateObject() {
    if (!sessionId || !selected) return;
    if (
      (selected.type === "Firewall" || selected.type === "Cluster") &&
      !window.confirm(`Duplicate ${selected.type} “${selected.name}” with its rulesets?`)
    )
      return;
    setBusy(true);
    setError(null);
    try {
      const copy = await duplicateObject(sessionId, selected.id);
      setStatus(`Duplicated → ${copy.name}`);
      await refreshTreeSelect(copy.id);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function refreshTreeSelect(id: string) {
    if (!sessionId) return;
    const t = await fetchTree(sessionId, 5);
    setTree(t.root);
    const full = await fetchObject(sessionId, id);
    setSelected(full);
  }

  async function onToggleRule(rule: AnyRule) {
    if (!sessionId || !rulesFwId) return;
    setBusy(true);
    setError(null);
    try {
      await updateRule(sessionId, rule.id, { disabled: !rule.disabled });
      setDirty(true);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function refreshTrashCount(sid?: string | null) {
    const id = sid === undefined ? sessionId : sid;
    if (!id) {
      setTrashCount(0);
      setTrashItems([]);
      return;
    }
    try {
      const res = await listDeletedObjects(id);
      setTrashCount(res.count ?? 0);
      setTrashItems(res.objects ?? []);
      if (!(res.count ?? 0)) setTrashOpen(false);
    } catch {
      /* ignore */
    }
  }

  async function onToggleLogging(rule: AnyRule) {
    if (!sessionId || rule.type !== "PolicyRule") return;
    setBusy(true);
    setError(null);
    try {
      await updateRule(sessionId, rule.id, {
        logging: !(rule as PolicyRule).logging,
      });
      setDirty(true);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onCycleDirection(rule: AnyRule) {
    if (!sessionId || rule.type !== "PolicyRule") return;
    const order = ["Inbound", "Outbound", "Both"];
    const cur = String((rule as PolicyRule).direction || "Both");
    const next = order[(order.indexOf(cur) + 1) % order.length] || "Both";
    setBusy(true);
    setError(null);
    try {
      await updateRule(sessionId, rule.id, { direction: next });
      setDirty(true);
      await refreshRules();
      setStatus(`Direction → ${next}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onCommentSelectedRule() {
    if (!sessionId || !selectedRuleId) return;
    const rule = rules.find((r) => r.id === selectedRuleId);
    if (!rule) return;
    const text = window.prompt("Rule comment", rule.comment ?? "");
    if (text === null) return;
    setBusy(true);
    setError(null);
    try {
      await updateRule(sessionId, rule.id, { comment: text });
      setDirty(true);
      await refreshRules();
      setStatus("Rule comment updated");
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onGroupSelectedRule() {
    if (!sessionId || !selectedRuleId) return;
    const rule = rules.find((r) => r.id === selectedRuleId);
    if (!rule) return;
    const text = window.prompt("Rule group", rule.group ?? "");
    if (text === null) return;
    setBusy(true);
    setError(null);
    try {
      await updateRule(sessionId, rule.id, { group: text });
      setDirty(true);
      await refreshRules();
      setStatus(text.trim() ? `Rule group → ${text.trim()}` : "Rule group cleared");
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  function onJumpToRulePosition() {
    if (!rules.length) return;
    const positions = rules
      .map((r) => r.position)
      .filter((p): p is number => typeof p === "number")
      .sort((a, b) => a - b);
    const cur = rules.find((r) => r.id === selectedRuleId)?.position;
    const raw = window.prompt(
      `Jump to rule position (${positions[0] ?? 0}…${positions[positions.length - 1] ?? 0})`,
      cur != null ? String(cur) : String(positions[0] ?? 0),
    );
    if (raw === null) return;
    const pos = Number(raw.trim());
    if (!Number.isFinite(pos)) {
      setError("invalid rule position");
      return;
    }
    const hit =
      rules.find((r) => r.position === pos) ||
      visibleRules.find((r) => r.position === pos);
    if (!hit) {
      setError(`No rule at position ${pos}`);
      return;
    }
    if (hideDisabled && hit.disabled) setHideDisabled(false);
    if (onlyDisabled && !hit.disabled) setOnlyDisabled(false);
    setSelectedRuleId(hit.id);
    setStatus(`Jumped to rule position ${pos}`);
  }

  async function onBulkComment() {
    if (!sessionId || !visibleRules.length) return;
    const text = window.prompt(
      `Set comment on ${visibleRules.length} visible rule(s)`,
      "",
    );
    if (text === null) return;
    setBusy(true);
    setError(null);
    try {
      for (const rule of visibleRules) {
        await updateRule(sessionId, rule.id, { comment: text });
      }
      setDirty(true);
      await refreshRules();
      setStatus(`Commented ${visibleRules.length} visible rules`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onBulkGroup() {
    if (!sessionId || !visibleRules.length) return;
    const text = window.prompt(
      `Set group on ${visibleRules.length} visible rule(s)`,
      ruleGroupFilter || "",
    );
    if (text === null) return;
    setBusy(true);
    setError(null);
    try {
      for (const rule of visibleRules) {
        await updateRule(sessionId, rule.id, { group: text });
      }
      setDirty(true);
      await refreshRules();
      setStatus(`Grouped ${visibleRules.length} visible rules as “${text}”`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onChangeAction(rule: PolicyRule | NatRule, action: string) {
    if (!sessionId || !rulesFwId) return;
    setBusy(true);
    setError(null);
    try {
      await updateRule(sessionId, rule.id, { action });
      setDirty(true);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onChangeMetric(rule: RoutingRuleRow, metric: number) {
    if (!sessionId || !rulesFwId) return;
    if (rule.metric === metric) return;
    setBusy(true);
    setError(null);
    try {
      await updateRule(sessionId, rule.id, { metric });
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onAddRule(where: "bottom" | "before" | "after" | "top" = "bottom") {
    if (!sessionId || !rulesFwId) return;
    if ((where === "before" || where === "after") && !selectedRuleId) return;
    const selected = rules.find((r) => r.id === selectedRuleId);
    const target = rulesetId || rulesFwId;
    setBusy(true);
    setError(null);
    try {
      const created = await addRule(sessionId, target, {
        which: rulesWhich,
        where,
        position: selected?.position,
      });
      setSelectedRuleId(created.id);
      setDirty(true);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDeleteRule() {
    if (!sessionId || !selectedRuleId) return;
    setBusy(true);
    setError(null);
    try {
      await deleteRule(sessionId, selectedRuleId);
      setSelectedRuleId(undefined);
      setDirty(true);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onBulkDeleteVisible() {
    if (!sessionId || !visibleRules.length) return;
    if (
      !window.confirm(
        `Permanently delete ${visibleRules.length} visible rule(s)? This cannot be undone.`,
      )
    )
      return;
    setBusy(true);
    setError(null);
    try {
      const ids = visibleRules.map((r) => r.id);
      for (const id of ids) {
        await deleteRule(sessionId, id);
      }
      setSelectedRuleId(undefined);
      setDirty(true);
      setStatus(`Deleted ${ids.length} visible rule(s)`);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDuplicateRule() {
    if (!sessionId || !selectedRuleId) return;
    setBusy(true);
    setError(null);
    try {
      const copy = await duplicateRule(sessionId, selectedRuleId);
      setSelectedRuleId(copy.id);
      setDirty(true);
      setStatus(`Rule duplicated → ${copy.id}`);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  function pickTargetRuleset(promptLabel: string): RulesetListEntry | null {
    const wantType = rulesWhich === "nat" ? "NAT" : rulesWhich === "routing" ? "Routing" : "Policy";
    const candidates = rulesetList.filter(
      (r) => r.type === wantType && r.id !== rulesetId,
    );
    if (!candidates.length) {
      setError(`No other ${wantType} ruleset on this firewall`);
      return null;
    }
    const labels = candidates.map((c, i) => `${i + 1}. ${c.name}${c.top ? " (top)" : ""}`).join("\n");
    const raw = window.prompt(`${promptLabel}\n${labels}\nEnter number:`, "1");
    if (raw === null) return null;
    const idx = Number(raw) - 1;
    if (!Number.isFinite(idx) || idx < 0 || idx >= candidates.length) {
      setError("invalid ruleset choice");
      return null;
    }
    return candidates[idx];
  }

  async function onCopyRuleToRuleset() {
    if (!sessionId || !selectedRuleId || !rulesFwId) return;
    const wantType = rulesWhich === "nat" ? "NAT" : rulesWhich === "routing" ? "Routing" : "Policy";
    const target = pickTargetRuleset(`Copy selected rule to which ${wantType}?`);
    if (!target) return;
    setBusy(true);
    setError(null);
    try {
      const copy = await duplicateRule(sessionId, selectedRuleId, target.id);
      setDirty(true);
      setStatus(`Copied rule → ${target.name} (${copy.id})`);
      await loadRules(rulesFwId, rulesWhich, target.id);
      setSelectedRuleId(copy.id);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onCopyVisibleToRuleset(move = false) {
    if (!sessionId || !rulesFwId || !visibleRules.length) return;
    const wantType = rulesWhich === "nat" ? "NAT" : rulesWhich === "routing" ? "Routing" : "Policy";
    const verb = move ? "Move" : "Copy";
    const target = pickTargetRuleset(
      `${verb} ${visibleRules.length} visible rule(s) to which ${wantType}?`,
    );
    if (!target) return;
    if (
      !window.confirm(
        `${verb} ${visibleRules.length} visible rule(s) ${move ? "from this ruleset into" : "into"} “${target.name}”?`,
      )
    )
      return;
    setBusy(true);
    setError(null);
    try {
      const ordered = [...visibleRules].sort(
        (a, b) => (a.position ?? 0) - (b.position ?? 0),
      );
      const sourceIds = ordered.map((r) => r.id);
      let lastId: string | undefined;
      for (const rule of ordered) {
        const copy = await duplicateRule(sessionId, rule.id, target.id);
        lastId = copy.id;
      }
      if (move) {
        for (const id of sourceIds) {
          await deleteRule(sessionId, id);
        }
      }
      setDirty(true);
      setStatus(
        `${move ? "Moved" : "Copied"} ${ordered.length} rule(s) → ${target.name}`,
      );
      await loadRules(rulesFwId, rulesWhich, target.id);
      if (lastId) setSelectedRuleId(lastId);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onMoveRule(direction: "up" | "down") {
    if (!sessionId || !selectedRuleId) return;
    setBusy(true);
    setError(null);
    try {
      await moveRule(sessionId, selectedRuleId, { direction });
      setDirty(true);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onMoveRuleTo() {
    if (!sessionId || !selectedRuleId) return;
    const raw = window.prompt("Move selected rule to position #", "0");
    if (raw === null) return;
    const to = Number(raw);
    if (!Number.isFinite(to) || to < 0) {
      setError("position must be a non-negative number");
      return;
    }
    setBusy(true);
    setError(null);
    try {
      await moveRule(sessionId, selectedRuleId, { to });
      setDirty(true);
      await refreshRules();
      setStatus(`Moved rule to #${to}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDropObject(rule: AnyRule, element: string, objectId: string) {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      await addRuleRef(sessionId, rule.id, element, objectId);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onPickObject(obj: TreeNode) {
    if (!sessionId || !picker) return;
    setBusy(true);
    setError(null);
    try {
      await addRuleRef(sessionId, picker.ruleId, picker.element, obj.id);
      setPicker(null);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onPickAny() {
    if (!sessionId || !picker) return;
    setBusy(true);
    setError(null);
    try {
      await setRuleAny(sessionId, picker.ruleId, picker.element);
      setPicker(null);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onToggleNeg() {
    if (!sessionId || !picker) return;
    const rule = rules.find((r) => r.id === picker.ruleId);
    const el = rule ? (rule as Record<string, unknown>)[picker.element] : null;
    const current =
      el && typeof el === "object" && el !== null && "neg" in el
        ? Boolean((el as { neg?: boolean }).neg)
        : false;
    setBusy(true);
    setError(null);
    try {
      await setRuleNeg(sessionId, picker.ruleId, picker.element, !current);
      setStatus(`Negate ${picker.element} → ${!current}`);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onRemoveRef(objectId: string) {
    if (!sessionId || !picker) return;
    setBusy(true);
    setError(null);
    try {
      await removeRuleRef(sessionId, picker.ruleId, picker.element, objectId);
      setStatus(`Removed ${objectId} from ${picker.element}`);
      await refreshRules();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  const pickerCurrent = useMemo(() => {
    if (!picker) return [];
    const rule = rules.find((r) => r.id === picker.ruleId);
    if (!rule) return [];
    const el = (rule as Record<string, unknown>)[picker.element];
    if (!el || typeof el !== "object" || el === null || !("objects" in el)) return [];
    const objs = (el as { objects?: { id: string; name: string; type: string }[] }).objects;
    return objs ?? [];
  }, [picker, rules]);

  async function onCompile(fwId?: string) {
    const target = fwId || rulesFwId;
    if (!sessionId || !target) return;
    setBusy(true);
    setError(null);
    setCompileLog(null);
    setCompileOutputs([]);
    try {
      const res = await compileFirewall(sessionId, target);
      setCompileOutputs(res.outputs ?? []);
      setCompileLog(
        `${res.compiler} → ${res.destdir}\noutputs: ${res.outputs.join(", ") || "(none)"}\n\n${res.log}`,
      );
      setStatus(`Compiled ${res.firewall} (${res.platform})`);
      if (target === rulesFwId || !rulesFwId) await refreshRulesFwMeta(target);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDeployDryRun(fwId?: string) {
    const target = fwId || rulesFwId;
    if (!sessionId || !target) return;
    setBusy(true);
    setError(null);
    setCompileLog(null);
    try {
      const res = await deployFirewall(sessionId, {
        firewall_id: target,
        dry_run: true,
        compile_first: true,
      });
      const cmds = (res.deploy?.commands || []).join("\n");
      const plan = (res.deploy?.plan || []).join("\n");
      setCompileOutputs(res.compile?.outputs ?? []);
      setCompileLog(
        `Deploy dry-run ${res.firewall} (${res.platform})\n` +
          `host=${res.deploy?.host || "(unset)"} user=${res.deploy?.user || "(unset)"}\n` +
          `remote=${res.deploy?.remote_path || ""}\n` +
          (res.deploy?.mode ? `mode=${res.deploy.mode}\n` : "") +
          (res.deploy?.activation_source
            ? `activation_source=${res.deploy.activation_source}\n`
            : "") +
          `\n${plan ? `${plan}\n\n` : ""}` +
          `${cmds}\n\n` +
          `${res.deploy?.log || ""}\n` +
          `${res.compile?.log || ""}`,
      );
      setStatus(`Deploy dry-run for ${res.firewall}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDeployLive(fwId?: string) {
    const target = fwId || rulesFwId;
    if (!sessionId || !target) return;
    if (
      !window.confirm(
        "LIVE deploy will run scp/ssh against the management host. " +
          "Interactive Cisco/Juniper installers are not fully supported. Continue?",
      )
    ) {
      return;
    }
    const typed = window.prompt('Type DEPLOY to confirm live install', "");
    if (typed !== "DEPLOY") {
      setStatus("Live deploy cancelled");
      return;
    }
    setBusy(true);
    setError(null);
    setCompileLog(null);
    try {
      const res = await deployFirewall(sessionId, {
        firewall_id: target,
        dry_run: false,
        compile_first: true,
        force_limited_installer: true,
      });
      const cmds = (res.deploy?.commands || []).join("\n");
      const plan = (res.deploy?.plan || []).join("\n");
      setCompileOutputs(res.compile?.outputs ?? []);
      setCompileLog(
        `Deploy LIVE ${res.firewall} (${res.platform})\n` +
          `host=${res.deploy?.host || "(unset)"} user=${res.deploy?.user || "(unset)"}\n` +
          `remote=${res.deploy?.remote_path || ""}\n` +
          (res.deploy?.mode ? `mode=${res.deploy.mode}\n` : "") +
          (res.deploy?.activation_source
            ? `activation_source=${res.deploy.activation_source}\n`
            : "") +
          `\n${plan ? `${plan}\n\n` : ""}` +
          `${cmds}\n\n` +
          `${res.deploy?.log || ""}\n` +
          `${res.compile?.log || ""}`,
      );
      setStatus(`Deployed ${res.firewall} → ${res.deploy?.host || "?"}`);
      if (target === rulesFwId || !rulesFwId) await refreshRulesFwMeta(target);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onCompileAll() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    setCompileLog(null);
    setCompileOutputs([]);
    try {
      const res = await compileAllFirewalls(sessionId);
      const lines = res.results.map((r) =>
        r.ok
          ? `OK ${r.name} (${r.platform}) → ${(r.outputs || []).join(", ") || "(none)"}`
          : `FAIL ${r.name}: ${r.error || "error"}`,
      );
      setCompileLog(`Compile all: ${res.succeeded}/${res.count} ok\n${lines.join("\n")}`);
      const lastOk = [...res.results].reverse().find((r) => r.ok);
      if (lastOk?.outputs?.length) setCompileOutputs(lastOk.outputs);
      setStatus(`Compiled all: ${res.succeeded}/${res.count} succeeded`);
      if (res.failed) setError(`${res.failed} firewall(s) failed to compile`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDownloadOutput(filename: string) {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      await downloadCompileOutput(sessionId, filename);
      setStatus(`Downloaded ${filename}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDownloadCompileZip() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      await downloadCompileOutputsZip(sessionId);
      setStatus("Downloaded compile outputs zip");
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onClose() {
    if (!sessionId) return;
    if (dirty && !window.confirm("Discard unsaved changes and close?")) return;
    setBusy(true);
    setError(null);
    try {
      await closeProject(sessionId);
      setSessionId(null);
      setTree(null);
      setSelected(null);
      setRules([]);
      setRulesFwId(null);
      setRulesFwMeta(null);
      setSearchHits([]);
      setCompileLog(null);
      setCompileOutputs([]);
      setDirty(false);
      setTrashCount(0);
      setTrashItems([]);
      setTrashOpen(false);
      setTrashTypeFilter("");
      setUnusedHits([]);
      setUnusedTypeFilter("");
      setSessionsOpen(false);
      setHelpOpen(false);
      setWhereUsedCount(null);
      setStatus("Closed");
      await refreshSessionCount();
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onDownloadFwb() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const res = await fetch(downloadProjectUrl(sessionId), {
        headers: { Authorization: `Bearer ${getToken()}` },
      });
      if (!res.ok) throw new Error(`download failed (${res.status})`);
      const blob = await res.blob();
      const url = URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url;
      a.download = path.split("/").pop() || "project.fwb";
      a.click();
      URL.revokeObjectURL(url);
      setDirty(false);
      setStatus("Downloaded .fwb");
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onSearch() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const q = searchQ.trim();
      const res = await searchObjects(sessionId, q, searchType);
      let hits = [...(res.results ?? [])];
      // Exact id lookup when query looks like a libfwbuilder string id.
      if (/^id[\w-]+$/i.test(q) && !hits.some((h) => h.id === q)) {
        try {
          const byId = await fetchObject(sessionId, q);
          if (!searchType || byId.type === searchType) {
            hits = [
              {
                id: byId.id,
                name: byId.name,
                type: byId.type,
                children_count: byId.children_count,
              },
              ...hits,
            ];
          }
        } catch {
          /* not found by id — keep name search results */
        }
      }
      const sorted = hits.sort((a, b) => {
        const t = (a.type || "").localeCompare(b.type || "");
        if (t !== 0) return t;
        return (a.name || "").localeCompare(b.name || "");
      });
      setSearchHits(sorted);
      setStatus(`Search: ${sorted.length} hits${searchType ? ` · ${searchType}` : ""}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  function onCycleRecent(delta: number) {
    if (!recentPaths.length) return;
    const idx = Math.max(0, recentPaths.indexOf(path));
    const next = recentPaths[(idx + delta + recentPaths.length) % recentPaths.length];
    if (next) {
      setPath(next);
      setStatus(`Recent project: ${next}`);
    }
  }

  function onClearRecent() {
    setRecentPaths([]);
    try {
      localStorage.removeItem("fwbweb.recent");
    } catch {
      /* ignore */
    }
    setStatus("Cleared recent project paths");
  }

  return (
    <div className="app" data-theme={theme}>
      <header className="topbar">
        <div className="brand">
          <strong>Firewall Builder</strong>
          <span className="muted">WebUI · rules + compile</span>
        </div>
        <div className="top-actions">
          <label className="field">
            Token
            <input value={token} onChange={(e) => setTokenState(e.target.value)} />
          </label>
          <label className="field grow">
            Project path
            <input
              value={path}
              list="fwbweb-recent"
              onChange={(e) => setPath(e.target.value)}
            />
            <datalist id="fwbweb-recent">
              {recentPaths.map((p) => (
                <option key={p} value={p} />
              ))}
            </datalist>
          </label>
          <button
            type="button"
            className="ghost"
            disabled={!path}
            title="Copy project path (Ctrl+Shift+G)"
            onClick={() => {
              void navigator.clipboard.writeText(path).then(
                () => setStatus("Copied project path"),
                () => setError("Clipboard write failed"),
              );
            }}
          >
            Copy path
          </button>
          <button type="button" onClick={onOpen} disabled={busy}>
            Open
          </button>
          {recentPaths.length ? (
            <>
              <button
                type="button"
                className="ghost"
                disabled={busy}
                title="Previous recent project path (Alt+,)"
                onClick={() => onCycleRecent(-1)}
              >
                ‹
              </button>
              <button
                type="button"
                className="ghost"
                disabled={busy}
                title="Next recent project path (Alt+.)"
                onClick={() => onCycleRecent(1)}
              >
                ›
              </button>
              <button
                type="button"
                className="ghost"
                disabled={busy}
                title="Clear recent project paths"
                onClick={onClearRecent}
              >
                Clear recent
              </button>
            </>
          ) : null}
          <button
            type="button"
            className="ghost"
            onClick={() => void onNewProject()}
            disabled={busy}
            title="New blank project (Ctrl+N)"
          >
            New
          </button>
          <button type="button" onClick={() => void onSave(false)} disabled={!canOperate}>
            Save
          </button>
          <button type="button" className="ghost" onClick={() => void onSaveAs()} disabled={!canOperate}>
            Save as…
          </button>
          <button type="button" className="ghost" onClick={() => void onDownloadFwb()} disabled={!canOperate}>
            Download .fwb
          </button>
          <button
            type="button"
            className="ghost"
            onClick={() => void onSave(true)}
            disabled={!canOperate}
            title="Also copy workspace file back to the original path"
          >
            Save through
          </button>
          <button type="button" onClick={onClose} disabled={!canOperate}>
            Close
          </button>
          <button
            type="button"
            className="ghost"
            disabled={!canOperate}
            onClick={() => void onShowStats()}
            title="Project stats (Ctrl+I)"
          >
            Stats
          </button>
          <button
            type="button"
            className="ghost"
            title="Toggle theme (Ctrl+Shift+L)"
            onClick={() => setTheme((t) => (t === "dark" ? "light" : "dark"))}
          >
            {theme === "dark" ? "Light" : "Dark"}
          </button>
          <button
            type="button"
            className="ghost"
            title="Keyboard shortcuts (?)"
            onClick={() => setHelpOpen(true)}
          >
            Help
          </button>
        </div>
      </header>

      <div className="workspace">
        <aside className="sidebar">
          <div className="sidebar-title">
            Objects
            {sessionId && trashCount > 0 ? (
              <button
                type="button"
                className="ghost trash-count"
                disabled={busy}
                title="Show Deleted Objects panel"
                onClick={() => setTrashOpen((v) => !v)}
              >
                trash {trashCount}
              </button>
            ) : null}
          </div>
          {trashOpen && trashItems.length ? (
            <div className="trash-panel">
              <div className="trash-panel-head">
                <span>
                  Deleted Objects ({visibleTrash.length}
                  {visibleTrash.length !== trashItems.length ? `/${trashItems.length}` : ""})
                </span>
                {trashTypes.length > 1 ? (
                  <select
                    value={trashTypeFilter}
                    disabled={busy}
                    onChange={(e) => setTrashTypeFilter(e.target.value)}
                    title="Filter deleted list by type"
                  >
                    <option value="">All types</option>
                    {trashTypes.map((t) => (
                      <option key={t} value={t}>
                        {t}
                      </option>
                    ))}
                  </select>
                ) : null}
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  title="Download Deleted Objects as JSON"
                  onClick={() => {
                    const blob = new Blob(
                      [
                        JSON.stringify(
                          { count: visibleTrash.length, objects: visibleTrash },
                          null,
                          2,
                        ),
                      ],
                      { type: "application/json" },
                    );
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = "fwbweb-deleted.json";
                    a.click();
                    URL.revokeObjectURL(url);
                    setStatus(`Downloaded ${visibleTrash.length} deleted object(s)`);
                  }}
                >
                  JSON
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  title="Download Deleted Objects as TSV"
                  onClick={() => {
                    const lines = [
                      "id\ttype\tname\tcomment\tdeleted_from_parent_id",
                      ...visibleTrash.map(
                        (h) =>
                          `${h.id}\t${h.type}\t${(h.name ?? "").replace(/\t|\n/g, " ")}\t${(h.comment ?? "").replace(/\t|\n/g, " ")}\t${h.deleted_from_parent_id ?? ""}`,
                      ),
                    ];
                    const blob = new Blob([lines.join("\n")], {
                      type: "text/tab-separated-values",
                    });
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = "fwbweb-deleted.tsv";
                    a.click();
                    URL.revokeObjectURL(url);
                    setStatus(`Downloaded ${visibleTrash.length} deleted object(s) as TSV`);
                  }}
                >
                  TSV
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  onClick={() => void onRestoreAllTrash()}
                  title="Restore every deleted object to its previous parent"
                >
                  Restore all
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  onClick={() => void onEmptyDeleted()}
                >
                  Empty
                </button>
              </div>
              {visibleTrash.map((item) => (
                <div key={item.id} className="trash-row">
                  <button
                    type="button"
                    className="tree-item"
                    onClick={() => void onSelect({ ...item, deleted: true })}
                    title={
                      item.deleted_from_parent_id
                        ? `Was under ${item.deleted_from_parent_id}`
                        : undefined
                    }
                  >
                    <span className="tree-type">{item.type}</span>
                    <span className="tree-name">{item.name || item.id}</span>
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={busy}
                    title="Restore to previous parent"
                    onClick={() => void onRestoreFromTrash(item.id)}
                  >
                    Restore
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={busy}
                    title="Permanently purge"
                    onClick={() => void onPurgeFromTrash(item.id)}
                  >
                    Purge
                  </button>
                </div>
              ))}
            </div>
          ) : null}
          <div className="search-row">
            <input
              placeholder="Filter tree…"
              value={treeFilter}
              disabled={!sessionId || busy}
              onChange={(e) => setTreeFilter(e.target.value)}
              title="Filter loaded tree nodes by name/type/hint"
            />
            <button
              type="button"
              className="ghost"
              disabled={!sessionId || busy}
              onClick={() => void onCollapseTree()}
              title="Reload tree at depth 1 (Ctrl+[)"
            >
              Collapse
            </button>
            <button
              type="button"
              className="ghost"
              disabled={!sessionId || busy}
              onClick={() => void onExpandTree()}
              title="Reload tree at depth 5 (Ctrl+])"
            >
              Expand
            </button>
            <button
              type="button"
              className="ghost"
              disabled={!tree}
              title="Download currently loaded object tree as JSON"
              onClick={() => {
                if (!tree) return;
                const blob = new Blob([JSON.stringify({ root: tree }, null, 2)], {
                  type: "application/json",
                });
                const url = URL.createObjectURL(blob);
                const a = document.createElement("a");
                a.href = url;
                a.download = "fwbweb-tree.json";
                a.click();
                URL.revokeObjectURL(url);
                setStatus("Downloaded object tree JSON");
              }}
            >
              Tree JSON
            </button>
          </div>
          <div className="search-row">
            <input
              ref={searchInputRef}
              placeholder="Search… (Ctrl+F /)"
              value={searchQ}
              disabled={!sessionId || busy}
              onChange={(e) => setSearchQ(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === "Enter") void onSearch();
              }}
            />
            <select
              value={searchType}
              disabled={!sessionId || busy}
              onChange={(e) => setSearchType(e.target.value)}
              title="Type filter"
            >
              <option value="">Any type</option>
              <option value="Network">Network</option>
              <option value="NetworkIPv6">NetworkIPv6</option>
              <option value="Host">Host</option>
              <option value="Firewall">Firewall</option>
              <option value="Cluster">Cluster</option>
              <option value="DynamicGroup">DynamicGroup</option>
              <option value="Interface">Interface</option>
              <option value="AddressRange">AddressRange</option>
              <option value="DNSName">DNSName</option>
              <option value="TCPService">TCPService</option>
              <option value="UDPService">UDPService</option>
              <option value="IPService">IPService</option>
              <option value="ICMPService">ICMPService</option>
              <option value="TagService">TagService</option>
              <option value="UserService">UserService</option>
              <option value="CustomService">CustomService</option>
              <option value="Interval">Interval</option>
              <option value="Policy">Policy</option>
              <option value="NAT">NAT</option>
              <option value="Library">Library</option>
            </select>
            <button type="button" className="ghost" disabled={!canOperate} onClick={onSearch}>
              Go
            </button>
            <button
              type="button"
              className="ghost"
              disabled={!canOperate}
              onClick={() => void onFindUnused()}
              title="Find unused objects (Ctrl+Shift+U)"
            >
              Unused
            </button>
          </div>
              {unusedHits.length ? (
            <div className="search-hits">
              <div className="trash-panel-head">
                <span>
                  Unused ({visibleUnused.length}
                  {visibleUnused.length !== unusedHits.length ? `/${unusedHits.length}` : ""})
                </span>
                {unusedTypes.length > 1 ? (
                  <select
                    value={unusedTypeFilter}
                    disabled={busy}
                    onChange={(e) => setUnusedTypeFilter(e.target.value)}
                    title="Filter unused list by type"
                  >
                    <option value="">All types</option>
                    {unusedTypes.map((t) => (
                      <option key={t} value={t}>
                        {t}
                      </option>
                    ))}
                  </select>
                ) : null}
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  onClick={() => {
                    const blob = new Blob(
                      [
                        JSON.stringify(
                          { count: visibleUnused.length, objects: visibleUnused },
                          null,
                          2,
                        ),
                      ],
                      { type: "application/json" },
                    );
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = "fwbweb-unused.json";
                    a.click();
                    URL.revokeObjectURL(url);
                    setStatus(`Downloaded ${visibleUnused.length} unused object(s)`);
                  }}
                  title="Download unused list as JSON"
                >
                  JSON
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  onClick={() => {
                    const lines = [
                      "id\ttype\tname\tcomment",
                      ...visibleUnused.map(
                        (h) =>
                          `${h.id}\t${h.type}\t${(h.name ?? "").replace(/\t|\n/g, " ")}\t${(h.comment ?? "").replace(/\t|\n/g, " ")}`,
                      ),
                    ];
                    const blob = new Blob([lines.join("\n")], {
                      type: "text/tab-separated-values",
                    });
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = "fwbweb-unused.tsv";
                    a.click();
                    URL.revokeObjectURL(url);
                    setStatus(`Downloaded ${visibleUnused.length} unused object(s) as TSV`);
                  }}
                  title="Download unused list as TSV"
                >
                  TSV
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  onClick={() => void onDeleteUnused()}
                  title="Soft-delete all listed unused objects"
                >
                  Delete all
                </button>
                <button
                  type="button"
                  className="ghost"
                  onClick={() => {
                    setUnusedHits([]);
                    setUnusedTypeFilter("");
                  }}
                >
                  Clear
                </button>
              </div>
              {visibleUnused.map((h) => (
                <div key={h.id} className="trash-row">
                  <button
                    type="button"
                    className="tree-item"
                    onClick={() => void onSelect(h)}
                  >
                    <span className="tree-type">{h.type}</span>
                    <span className="tree-name">{h.name}</span>
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={busy}
                    title="Soft-delete this unused object"
                    onClick={() => void onDeleteOneUnused(h.id)}
                  >
                    Delete
                  </button>
                </div>
              ))}
            </div>
          ) : null}
          {searchHits.length ? (
            <div className="search-hits">
              <div className="trash-panel-head">
                <span>Search ({searchHits.length})</span>
                <button
                  type="button"
                  className="ghost"
                  onClick={() => {
                    const blob = new Blob(
                      [JSON.stringify({ count: searchHits.length, results: searchHits }, null, 2)],
                      { type: "application/json" },
                    );
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = "fwbweb-search.json";
                    a.click();
                    URL.revokeObjectURL(url);
                    setStatus(`Downloaded ${searchHits.length} search hit(s)`);
                  }}
                  title="Download search hits as JSON"
                >
                  JSON
                </button>
                <button
                  type="button"
                  className="ghost"
                  onClick={() => {
                    const lines = [
                      "id\ttype\tname\tcomment",
                      ...searchHits.map(
                        (h) =>
                          `${h.id}\t${h.type}\t${(h.name ?? "").replace(/\t|\n/g, " ")}\t${(h.comment ?? "").replace(/\t|\n/g, " ")}`,
                      ),
                    ];
                    const blob = new Blob([lines.join("\n")], {
                      type: "text/tab-separated-values",
                    });
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = "fwbweb-search.tsv";
                    a.click();
                    URL.revokeObjectURL(url);
                    setStatus(`Downloaded ${searchHits.length} search hit(s) as TSV`);
                  }}
                  title="Download search hits as TSV"
                >
                  TSV
                </button>
                <button
                  type="button"
                  className="ghost"
                  onClick={() => {
                    setSearchHits([]);
                    setSearchQ("");
                  }}
                >
                  Clear
                </button>
              </div>
              {searchHits.map((h) => (
                <button
                  key={h.id}
                  type="button"
                  className="tree-item"
                  draggable
                  onDragStart={(e) => {
                    e.dataTransfer.setData("application/x-fwb-object-id", h.id);
                    e.dataTransfer.effectAllowed = "copy";
                  }}
                  onClick={() => void onSelect(h)}
                  onDoubleClick={() => {
                    void onSelect(h);
                    if (h.type === "Firewall" || h.type === "Cluster") {
                      void loadRules(h.id, "policy");
                    }
                  }}
                  title={
                    h.type === "Firewall" || h.type === "Cluster"
                      ? `${h.comment || h.id} · double-click opens Policy`
                      : h.comment || h.id
                  }
                >
                  <span className="tree-type">{h.type}</span>
                  <span className="tree-name">{h.name}</span>
                  {h.comment ? <span className="muted tree-hint">{h.comment}</span> : null}
                </button>
              ))}
            </div>
          ) : null}
          {tree ? (
            <ObjectTree
              node={tree}
              selectedId={selected?.id}
              onSelect={onSelect}
              filter={treeFilter}
              onExpand={async (n) => {
                if (!sessionId) return undefined;
                const full = await fetchObject(sessionId, n.id);
                return full.children ?? [];
              }}
            />
          ) : (
            <p className="muted pad">Open a `.fwb` project to load the object tree.</p>
          )}
        </aside>
        <main className="main">
          <div className="tab-row">
            <button
              type="button"
              className={tab === "object" ? undefined : "ghost"}
              title="Object tab (Ctrl+1)"
              onClick={() => setTab("object")}
            >
              Object
            </button>
            <button
              type="button"
              className={tab === "rules" ? undefined : "ghost"}
              disabled={!rulesFwId}
              title="Rules tab (Ctrl+2)"
              onClick={() => setTab("rules")}
            >
              Rules {rulesFwId ? `(${rulesWhich})` : ""}
            </button>
          </div>

          {tab === "object" ? (
            <>
              {objectPath.length ? (
                <nav className="object-path pad" aria-label="Object path">
                  {objectPath.map((p, i) => (
                    <span key={p.id}>
                      {i > 0 ? <span className="muted"> / </span> : null}
                      <button
                        type="button"
                        className="linkish"
                        disabled={busy || p.id === selected?.id}
                        onClick={() => void onSelect({ id: p.id, name: p.name, type: p.type })}
                      >
                        {p.name || p.type}
                      </button>
                    </span>
                  ))}
                  <button
                    type="button"
                    className="ghost"
                    disabled={busy}
                    title="Copy object path (Ctrl+Shift+P)"
                    onClick={() => {
                      const text = objectPath.map((p) => p.name || p.type).join(" / ");
                      void navigator.clipboard.writeText(text).then(
                        () => setStatus("Copied object path"),
                        () => setError("Clipboard write failed"),
                      );
                    }}
                  >
                    Copy path
                  </button>
                  {selected?.name ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={busy}
                      title="Copy object name (Ctrl+Shift+N)"
                      onClick={() => {
                        void navigator.clipboard.writeText(selected.name).then(
                          () => setStatus(`Copied object name ${selected.name}`),
                          () => setError("Clipboard write failed"),
                        );
                      }}
                    >
                      Copy name
                    </button>
                  ) : null}
                  {selected ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={busy}
                      title="Copy type/name/id as TSV (Ctrl+Shift+Y)"
                      onClick={onCopySelectedObjectTsv}
                    >
                      Copy TSV
                    </button>
                  ) : null}
                  {selected ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={busy}
                      title="Copy object comment (Ctrl+Shift+M)"
                      onClick={() => {
                        const text = selected.comment ?? "";
                        void navigator.clipboard.writeText(text).then(
                          () =>
                            setStatus(
                              text ? "Copied object comment" : "Object has no comment",
                            ),
                          () => setError("Clipboard write failed"),
                        );
                      }}
                    >
                      Copy comment
                    </button>
                  ) : null}
                </nav>
              ) : null}
            <ObjectDetail
              object={selected}
              busy={busy}
              renameFocusToken={renameFocusToken}
              onSave={sessionId ? onApplyObject : undefined}
              onOpenRules={
                sessionId && selected
                  ? (which) => void loadRules(selected.id, which)
                  : undefined
              }
              extras={
                sessionId && selected ? (
                  <>
                    <div className="btn-row pad">
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy || selected.type === "FWObjectDatabase"}
                        onClick={() => void onToggleRo()}
                      >
                        {selected.ro ? "Unlock" : "Lock"}
                      </button>
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy || !selected.parent_id}
                        onClick={() => void onJumpParent()}
                        title="Select parent object"
                      >
                        Parent
                      </button>
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy || selected.ro}
                        onClick={() => void onDuplicateObject()}
                      >
                        Duplicate
                      </button>
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy || selected.ro}
                        onClick={() => void onDeleteObject(false)}
                      >
                        {selected.deleted ? "Purge object" : "Delete object"}
                      </button>
                      {selected.deleted ? (
                        <button
                          type="button"
                          className="ghost"
                          disabled={busy || selected.ro}
                          onClick={() => void onRestoreObject()}
                          title="Move back into User Objects"
                        >
                          Restore
                        </button>
                      ) : (
                        <button
                          type="button"
                          className="ghost"
                          disabled={busy || selected.ro}
                          onClick={() => void onDeleteObject(true)}
                          title="Permanently destroy without Deleted Objects"
                        >
                          Purge…
                        </button>
                      )}
                      {selected.type === "Library" && selected.name === "Deleted Objects" ? (
                        <button
                          type="button"
                          className="ghost"
                          disabled={busy}
                          onClick={() => void onEmptyDeleted()}
                        >
                          Empty trash
                        </button>
                      ) : null}
                    </div>
                    {selected.type === "Firewall" || selected.type === "Cluster" ? (
                      <div className="btn-row pad">
                        <button
                          type="button"
                          disabled={busy}
                          title="Open Policy rules (Alt+R)"
                          onClick={() => void loadRules(selected.id, "policy")}
                        >
                          Open Policy
                        </button>
                        <button
                          type="button"
                          className="ghost"
                          disabled={busy}
                          title="Open NAT rules (Alt+N)"
                          onClick={() => void loadRules(selected.id, "nat")}
                        >
                          Open NAT
                        </button>
                        <button
                          type="button"
                          className="ghost"
                          disabled={busy}
                          title="Open Routing rules (Alt+G)"
                          onClick={() => void loadRules(selected.id, "routing")}
                        >
                          Open Routing
                        </button>
                        <button
                          type="button"
                          className="ghost"
                          disabled={busy}
                          title="Compile then deploy dry-run (Alt+D)"
                          onClick={() => void onDeployDryRun(selected.id)}
                        >
                          Deploy dry-run
                        </button>
                        <button
                          type="button"
                          className="ghost"
                          disabled={busy}
                          title="Compile then live scp/ssh (double confirm)"
                          onClick={() => void onDeployLive(selected.id)}
                        >
                          Deploy live
                        </button>
                      </div>
                    ) : null}
                    {selected.type === "Firewall" ? (
                      <FirewallExtras
                        sessionId={sessionId}
                        firewallId={selected.id}
                        platform={String(selected.attrs?.platform ?? "")}
                        hostOs={String(selected.attrs?.host_OS ?? "")}
                        busy={busy}
                        onBusy={setBusy}
                        onStatus={setStatus}
                        onError={setError}
                      />
                    ) : null}
                    {selected.type === "Interface" ? (
                      <InterfaceOptions
                        sessionId={sessionId}
                        interfaceId={selected.id}
                        hostOs={String(selected.attrs?.host_OS ?? "")}
                        busy={busy}
                        onBusy={setBusy}
                        onStatus={setStatus}
                        onError={setError}
                      />
                    ) : null}
                    {selected.type === "Host" ? (
                      <HostOptions
                        sessionId={sessionId}
                        hostId={selected.id}
                        busy={busy}
                        onBusy={setBusy}
                        onStatus={setStatus}
                        onError={setError}
                      />
                    ) : null}
                    {!selected.ro &&
                    !["FWObjectDatabase", "Library"].includes(selected.type) &&
                    !selected.type.endsWith("Rule") ? (
                      <MoveObject
                        sessionId={sessionId}
                        objectId={selected.id}
                        objectName={selected.name}
                        busy={busy}
                        onBusy={setBusy}
                        onStatus={setStatus}
                        onError={setError}
                        onMoved={(id) => void refreshTreeSelect(id)}
                      />
                    ) : null}
                    {!["FWObjectDatabase"].includes(selected.type) ? (
                      <WhereUsed
                        sessionId={sessionId}
                        objectId={selected.id}
                        busy={busy}
                        onBusy={setBusy}
                        onStatus={setStatus}
                        onError={setError}
                        onSelect={(id) => void refreshTreeSelect(id)}
                        onJumpUse={(row) => void onJumpWhereUsed(row)}
                      />
                    ) : null}
                    {selected.type.endsWith("Group") || selected.type === "ObjectGroup" || selected.type === "ServiceGroup" ? (
                      <GroupMembers
                        sessionId={sessionId}
                        groupId={selected.id}
                        groupName={selected.name}
                        readOnly={selected.ro}
                        busy={busy}
                        onBusy={setBusy}
                        onStatus={setStatus}
                        onError={setError}
                        onSelect={(id) => void refreshTreeSelect(id)}
                      />
                    ) : null}
                    {["ObjectGroup", "Library", "ServiceGroup", "FWObjectDatabase", "Firewall", "Host", "Cluster"].includes(
                      selected.type,
                    ) || selected.type.endsWith("Group") ? (
                      <CreateObject
                        key={selected.id}
                        sessionId={sessionId}
                        parentId={selected.id}
                        parentName={selected.name}
                        parentType={selected.type}
                        busy={busy}
                        onBusy={setBusy}
                        onStatus={setStatus}
                        onError={setError}
                        onCreated={(id) => void refreshTreeSelect(id)}
                      />
                    ) : null}
                  </>
                ) : null
              }
            />
            </>
          ) : (
            <div className="panel">
              <header className="panel-header">
                <h2>
                  {rulesetName || "Rules"}
                  {rulesFwMeta ? (
                    <span className="muted">
                      {" "}
                      · {rulesFwMeta.name}
                      {rulesFwMeta.platform ? ` · ${rulesFwMeta.platform}` : ""}
                      {rulesFwMeta.host_OS ? `/${rulesFwMeta.host_OS}` : ""}
                      {rulesFwMeta.lastCompiled
                        ? ` · compiled ${rulesFwMeta.lastCompiled}`
                        : ""}
                      {rulesFwMeta.lastInstalled
                        ? ` · installed ${rulesFwMeta.lastInstalled}`
                        : ""}
                    </span>
                  ) : null}
                  {rules.length ? (
                    <span className="muted">
                      {" "}
                      · {visibleRules.length}
                      {visibleRules.length !== rules.length ? `/${rules.length}` : ""} rules
                      {rules.some((r) => r.disabled)
                        ? ` · ${rules.filter((r) => r.disabled).length} disabled`
                        : ""}
                      {hideDisabled ? " · hide-disabled" : ""}
                      {onlyDisabled ? " · only-disabled" : ""}
                      {ruleActionFilter ? ` · action=${ruleActionFilter}` : ""}
                      {ruleGroupFilter ? ` · group=${ruleGroupFilter}` : ""}
                    </span>
                  ) : null}
                </h2>
                <div className="btn-row">
                  {rulesFwId ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={busy}
                      title="Select the firewall object"
                      onClick={() => void onSelect({ id: rulesFwId, name: "", type: "Firewall" })}
                    >
                      Firewall
                    </button>
                  ) : null}
                  {rulesFwId ? (
                    <button
                      type="button"
                      className="ghost"
                      title="Copy firewall object id"
                      onClick={() => {
                        void navigator.clipboard.writeText(rulesFwId).then(
                          () => setStatus(`Copied firewall id ${rulesFwId}`),
                          () => setError("Clipboard write failed"),
                        );
                      }}
                    >
                      Copy fw id
                    </button>
                  ) : null}
                  {rulesFwMeta?.name ? (
                    <button
                      type="button"
                      className="ghost"
                      title="Copy firewall name"
                      onClick={() => {
                        void navigator.clipboard.writeText(rulesFwMeta.name).then(
                          () => setStatus(`Copied firewall name ${rulesFwMeta.name}`),
                          () => setError("Clipboard write failed"),
                        );
                      }}
                    >
                      Copy fw name
                    </button>
                  ) : null}
                  {rulesFwId ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={busy}
                      title="Reload rules from bridge (r)"
                      onClick={() => void refreshRules({ announce: true })}
                    >
                      Refresh
                    </button>
                  ) : null}
                  {(["policy", "nat", "routing"] as RulesWhich[]).map((w) => (
                    <button
                      key={w}
                      type="button"
                      className={rulesWhich === w ? undefined : "ghost"}
                      disabled={!rulesFwId || busy}
                      onClick={() => rulesFwId && void loadRules(rulesFwId, w)}
                    >
                      {w}
                    </button>
                  ))}
                  {rulesFwId ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={busy}
                      title="Cycle Policy → NAT → Routing (Alt+P)"
                      onClick={() => {
                        const order: RulesWhich[] = ["policy", "nat", "routing"];
                        const next =
                          order[(order.indexOf(rulesWhich) + 1) % order.length] ?? "policy";
                        void loadRules(rulesFwId, next);
                        setStatus(`Rules: ${next}`);
                      }}
                    >
                      Cycle ruleset
                    </button>
                  ) : null}
                  {rulesetList.filter((r) => {
                    const want =
                      rulesWhich === "nat"
                        ? "NAT"
                        : rulesWhich === "routing"
                          ? "Routing"
                          : "Policy";
                    return r.type === want;
                  }).length > 1 ? (
                    <label className="field inline">
                      Ruleset
                      <select
                        value={rulesetId ?? ""}
                        disabled={busy || !rulesFwId}
                        onChange={(e) => {
                          if (rulesFwId) void loadRules(rulesFwId, rulesWhich, e.target.value);
                        }}
                      >
                        {rulesetList
                          .filter((r) => {
                            const want =
                              rulesWhich === "nat"
                                ? "NAT"
                                : rulesWhich === "routing"
                                  ? "Routing"
                                  : "Policy";
                            return r.type === want;
                          })
                          .map((r) => (
                            <option key={r.id} value={r.id}>
                              {r.name}
                              {r.top ? " (top)" : ""}
                              {typeof r.rule_count === "number" ? ` · ${r.rule_count}` : ""}
                            </option>
                          ))}
                      </select>
                    </label>
                  ) : null}
                  {rulesetId ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={!canOperate}
                      onClick={() => void onRenameRuleset()}
                      title="Rename the current ruleset"
                    >
                      Rename…
                    </button>
                  ) : null}
                  {rulesFwId && rulesWhich !== "routing" ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={!canOperate || !rules.length}
                      onClick={() => void onDuplicateRuleset()}
                      title="Create a secondary Policy/NAT and copy all rules into it"
                    >
                      Duplicate ruleset…
                    </button>
                  ) : null}
                  {rulesetId ? (
                    <button
                      type="button"
                      className="ghost"
                      title="Copy ruleset object id"
                      onClick={() => {
                        void navigator.clipboard.writeText(rulesetId).then(
                          () => setStatus(`Copied ruleset id ${rulesetId}`),
                          () => setError("Clipboard write failed"),
                        );
                      }}
                    >
                      Copy id
                    </button>
                  ) : null}
                  {rulesetId &&
                  !rulesetList.find((r) => r.id === rulesetId)?.top ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={!canOperate}
                      onClick={() => void onMakeRulesetTop()}
                      title="Mark this ruleset as the top Policy/NAT/Routing"
                    >
                      Make top
                    </button>
                  ) : null}
                  {rulesetId &&
                  rulesetList.filter((r) => {
                    const want =
                      rulesWhich === "nat"
                        ? "NAT"
                        : rulesWhich === "routing"
                          ? "Routing"
                          : "Policy";
                    return r.type === want;
                  }).length > 1 &&
                  !rulesetList.find((r) => r.id === rulesetId)?.top ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={!canOperate}
                      onClick={() => void onDeleteRuleset()}
                      title="Permanently delete this secondary ruleset"
                    >
                      Delete ruleset
                    </button>
                  ) : null}
                  <button
                    type="button"
                    disabled={!canOperate}
                    title="Add rule at bottom (Insert / Ctrl+Enter; Shift+Insert = top)"
                    onClick={() => void onAddRule("bottom")}
                  >
                    Add
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !selectedRuleId}
                    onClick={() => void onAddRule("before")}
                  >
                    Insert before
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !selectedRuleId}
                    onClick={() => void onAddRule("after")}
                  >
                    Insert after
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !selectedRuleId}
                    onClick={() => void onMoveRule("up")}
                  >
                    Up
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !selectedRuleId}
                    onClick={() => void onMoveRule("down")}
                  >
                    Down
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !selectedRuleId}
                    onClick={() => void onMoveRuleTo()}
                  >
                    Move to…
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!rules.length}
                    onClick={onJumpToRulePosition}
                    title="Jump to rule by position (j)"
                  >
                    Jump…
                  </button>
                  <label className="field inline">
                    <input
                      type="checkbox"
                      checked={hideDisabled}
                      disabled={busy}
                      onChange={(e) => {
                        setHideDisabled(e.target.checked);
                        if (e.target.checked) setOnlyDisabled(false);
                      }}
                    />{" "}
                    Hide disabled
                  </label>
                  <label className="field inline">
                    <input
                      type="checkbox"
                      checked={onlyDisabled}
                      disabled={busy}
                      onChange={(e) => {
                        setOnlyDisabled(e.target.checked);
                        if (e.target.checked) setHideDisabled(false);
                      }}
                      title="Show only disabled rules (also enabled by N / Shift+N)"
                    />{" "}
                    Only disabled
                  </label>
                  <button
                    type="button"
                    className="ghost"
                    disabled={busy}
                    title="Cycle disabled filter: all → hide → only (f)"
                    onClick={() => {
                      if (!hideDisabled && !onlyDisabled) {
                        setHideDisabled(true);
                        setOnlyDisabled(false);
                        setStatus("Filter: hide disabled");
                      } else if (hideDisabled) {
                        setHideDisabled(false);
                        setOnlyDisabled(true);
                        setStatus("Filter: only disabled");
                      } else {
                        setHideDisabled(false);
                        setOnlyDisabled(false);
                        setStatus("Filter: all rules");
                      }
                    }}
                  >
                    Cycle disabled
                  </button>
                  {ruleActions.length ? (
                    <label className="field inline">
                      Action
                      <select
                        value={ruleActionFilter}
                        disabled={busy}
                        onChange={(e) => setRuleActionFilter(e.target.value)}
                        title="Filter Policy/NAT rules by action"
                      >
                        <option value="">All actions</option>
                        {ruleActions.map((a) => (
                          <option key={a} value={a}>
                            {a}
                          </option>
                        ))}
                      </select>
                    </label>
                  ) : null}
                  {ruleActions.length ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={busy}
                      title="Cycle action filter: all → each action (a)"
                      onClick={() => {
                        const opts = ["", ...ruleActions];
                        const idx = opts.indexOf(ruleActionFilter);
                        const next = opts[(idx + 1) % opts.length] ?? "";
                        setRuleActionFilter(next);
                        setStatus(next ? `Filter: action=${next}` : "Filter: all actions");
                      }}
                    >
                      Cycle action
                    </button>
                  ) : null}
                  <label className="field inline">
                    Group
                    <select
                      value={ruleGroupFilter}
                      disabled={busy}
                      onChange={(e) => setRuleGroupFilter(e.target.value)}
                    >
                      <option value="">All groups</option>
                      {ruleGroups.map((g) => (
                        <option key={g} value={g}>
                          {g}
                        </option>
                      ))}
                    </select>
                  </label>
                  {ruleGroups.length ? (
                    <button
                      type="button"
                      className="ghost"
                      disabled={busy}
                      title="Cycle group filter: all → each group (u)"
                      onClick={() => {
                        const opts = ["", ...ruleGroups];
                        const idx = opts.indexOf(ruleGroupFilter);
                        const next = opts[(idx + 1) % opts.length] ?? "";
                        setRuleGroupFilter(next);
                        setStatus(next ? `Filter: group=${next}` : "Filter: all groups");
                      }}
                    >
                      Cycle group
                    </button>
                  ) : null}
                  <label className="field inline">
                    Filter
                    <input
                      ref={ruleFilterRef}
                      value={ruleTextFilter}
                      disabled={busy}
                      placeholder="comment/action/objects… (Ctrl+Shift+F)"
                      onChange={(e) => setRuleTextFilter(e.target.value)}
                    />
                  </label>
                  {(ruleTextFilter ||
                    ruleGroupFilter ||
                    ruleActionFilter ||
                    hideDisabled ||
                    onlyDisabled) && (
                    <button
                      type="button"
                      className="ghost"
                      disabled={busy}
                      onClick={() => {
                        setRuleTextFilter("");
                        setRuleGroupFilter("");
                        setRuleActionFilter("");
                        setHideDisabled(false);
                        setOnlyDisabled(false);
                      }}
                      title="Clear rule filters"
                    >
                      Clear filters
                    </button>
                  )}
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onBulkDisable(true)}
                    title="Disable all currently visible rules"
                  >
                    Disable visible
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onBulkDisable(false)}
                    title="Enable all currently visible rules"
                  >
                    Enable visible
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onBulkLogging(true)}
                    title="Turn logging on for all visible rules"
                  >
                    Log on visible
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onBulkLogging(false)}
                    title="Turn logging off for all visible rules"
                  >
                    Log off visible
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onBulkComment()}
                    title="Set the same comment on all visible rules"
                  >
                    Comment visible…
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onBulkGroup()}
                    title="Set the same group on all visible rules"
                  >
                    Group visible…
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onBulkAction()}
                    title="Set the same action on all visible Policy/NAT rules"
                  >
                    Action visible…
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onBulkDirection()}
                    title="Set direction on all visible Policy rules"
                  >
                    Direction visible…
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onBulkDeleteVisible()}
                    title="Permanently delete all currently visible rules"
                  >
                    Delete visible
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!visibleRules.length}
                    onClick={onCopyRulesTsv}
                    title="Copy visible rules as tab-separated text"
                  >
                    Copy TSV
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!selectedRuleId}
                    onClick={onCopySelectedRuleTsv}
                    title="Copy selected rule as TSV (t)"
                  >
                    Copy selected TSV
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!visibleRules.length}
                    onClick={onCopyRulesJson}
                    title="Copy visible rules as JSON"
                  >
                    Copy JSON
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!selectedRuleId}
                    onClick={onCopySelectedRuleJson}
                    title="Copy selected rule as JSON (y)"
                  >
                    Copy selected JSON
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!visibleRules.length}
                    onClick={onDownloadRulesTsv}
                    title="Download visible rules as .tsv"
                  >
                    Download TSV
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!visibleRules.length}
                    onClick={onDownloadRulesJson}
                    title="Download visible rules as JSON"
                  >
                    Download JSON
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !selectedRuleId}
                    onClick={() => void onDuplicateRule()}
                  >
                    Duplicate
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !selectedRuleId}
                    onClick={() => void onCopyRuleToRuleset()}
                    title="Copy into another Policy/NAT/Routing on this firewall"
                  >
                    Copy to ruleset…
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onCopyVisibleToRuleset(false)}
                    title="Copy all visible rules into another Policy/NAT/Routing"
                  >
                    Copy visible to…
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !visibleRules.length}
                    onClick={() => void onCopyVisibleToRuleset(true)}
                    title="Move all visible rules into another Policy/NAT/Routing"
                  >
                    Move visible to…
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !selectedRuleId}
                    onClick={() => void onDeleteRule()}
                  >
                    Delete
                  </button>
                  <button
                    type="button"
                    disabled={!canOperate}
                    onClick={() => void onCompile()}
                    title="Compile this firewall (Ctrl+E)"
                  >
                    Compile
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !rulesFwId}
                    onClick={() => void onDeployDryRun()}
                    title="Deploy dry-run for this firewall (compile first)"
                  >
                    Deploy dry-run
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate || !rulesFwId}
                    onClick={() => void onDeployLive()}
                    title="Live deploy (scp/ssh) with double confirm"
                  >
                    Deploy live
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate}
                    onClick={() => void onCompileAll()}
                    title="Compile every firewall in this project (Ctrl+Shift+E)"
                  >
                    Compile all
                  </button>
                </div>
              </header>
              <RuleGrid
                rules={visibleRules}
                kind={rulesWhich}
                busy={busy}
                selectedId={selectedRuleId}
                onSelectRule={(r) => setSelectedRuleId(r.id)}
                onToggleDisabled={onToggleRule}
                onChangeAction={onChangeAction}
                onChangeMetric={onChangeMetric}
                onEditCell={(rule, element) => setPicker({ ruleId: rule.id, element })}
                onDropObject={onDropObject}
                onJumpObject={(id) => {
                  setTab("object");
                  void refreshTreeSelect(id);
                }}
                onToggleLogging={onToggleLogging}
                onCycleDirection={onCycleDirection}
              />
              {sessionId && selectedRuleId ? (
                <>
                  {rules.find((r) => r.id === selectedRuleId) ? (
                    <RuleMeta
                      sessionId={sessionId}
                      rule={rules.find((r) => r.id === selectedRuleId)!}
                      busy={busy}
                      onBusy={setBusy}
                      onStatus={setStatus}
                      onError={setError}
                      onSaved={() => {
                        setDirty(true);
                        void refreshRules();
                      }}
                    />
                  ) : null}
                  <RuleOptions
                    sessionId={sessionId}
                    ruleId={selectedRuleId}
                    ruleKind={rulesWhich}
                    busy={busy}
                    onBusy={setBusy}
                    onStatus={setStatus}
                    onError={setError}
                  />
                </>
              ) : null}
              {compileOutputs.length ? (
                <div className="btn-row pad">
                  <span className="muted">Outputs:</span>
                  <button
                    type="button"
                    className="ghost"
                    disabled={busy}
                    onClick={() => void onDownloadCompileZip()}
                  >
                    Download zip
                  </button>
                  {compileOutputs.map((f) => (
                    <button
                      key={f}
                      type="button"
                      className="ghost"
                      disabled={busy}
                      onClick={() => void onDownloadOutput(f)}
                    >
                      {f}
                    </button>
                  ))}
                </div>
              ) : null}
              {compileLog ? (
                <>
                  <div className="btn-row pad">
                    <button
                      type="button"
                      className="ghost"
                      onClick={onCopyCompileLog}
                      title="Copy compile/deploy log (Ctrl+Shift+K)"
                    >
                      Copy log
                    </button>
                    <button
                      type="button"
                      className="ghost"
                      onClick={onDownloadCompileLog}
                      title="Save compile log as text file (Ctrl+Shift+D)"
                    >
                      Download log
                    </button>
                    <button
                      type="button"
                      className="ghost"
                      onClick={onClearCompileLog}
                      title="Clear compile/deploy log (Ctrl+Shift+X)"
                    >
                      Clear log
                    </button>
                    <button
                      type="button"
                      className="ghost"
                      title="Toggle soft-wrap for compile log"
                      onClick={() => {
                        setCompileLogWrap((v) => !v);
                        setStatus(
                          compileLogWrap
                            ? "Compile log: no wrap"
                            : "Compile log: soft wrap",
                        );
                      }}
                    >
                      {compileLogWrap ? "No wrap" : "Wrap"}
                    </button>
                  </div>
                  <pre
                    ref={compileLogRef}
                    className={
                      compileLogWrap ? "compile-log pad" : "compile-log pad nowrap"
                    }
                  >
                    {compileLog}
                  </pre>
                </>
              ) : (
                <p className="muted pad">
                  Compile uses the same <code>fwb_*</code> CLIs as the desktop GUI. Deploy runs
                  via scp/ssh from the Firewall panel (dry-run by default).
                </p>
              )}
            </div>
          )}
        </main>
      </div>

      <footer className="statusbar">
        <span>{status}</span>
        {sessionCount > 0 ? (
          <button
            type="button"
            className="ghost"
            title="List open API sessions"
            onClick={() => void onShowSessions()}
          >
            sessions {sessionCount}
          </button>
        ) : null}
        {whereUsedCount !== null && selected && !selected.deleted ? (
          <span className="muted" title="Where-used references">
            used {whereUsedCount}
          </span>
        ) : null}
        {tab === "rules" && visibleRules.length ? (
          <span className="muted">
            rule{" "}
            {Math.max(
              0,
              visibleRules.findIndex((r) => r.id === selectedRuleId),
            ) + (selectedRuleId ? 1 : 0)}
            /{visibleRules.length}
            {(() => {
              const sel = visibleRules.find((r) => r.id === selectedRuleId);
              return sel && sel.position != null ? ` · pos ${sel.position}` : "";
            })()}
          </span>
        ) : null}
        {dirty ? <span className="dirty-flag">Unsaved</span> : null}
        {busy ? <span className="muted">Working…</span> : null}
        {error ? <span className="error">{error}</span> : null}
      </footer>

      {sessionId && picker ? (
        <ObjectPicker
          sessionId={sessionId}
          title={`Pick object for ${picker.element}`}
          busy={busy}
          current={pickerCurrent}
          onPick={(obj) => void onPickObject(obj)}
          onAny={() => void onPickAny()}
          onToggleNeg={() => void onToggleNeg()}
          onRemove={(id) => void onRemoveRef(id)}
          onCancel={() => setPicker(null)}
        />
      ) : null}

      {helpOpen ? (
        <div className="stats-overlay" role="dialog" aria-label="Keyboard shortcuts">
          <div className="stats-panel help-panel">
            <header className="panel-header">
              <h2>Keyboard shortcuts</h2>
              <div className="btn-row">
                <button
                  type="button"
                  className="ghost"
                  title="Copy shortcuts as text"
                  onClick={() => {
                    void navigator.clipboard.writeText(shortcutsAsText()).then(
                      () => setStatus("Copied shortcuts"),
                      () => setStatus("Copy failed"),
                    );
                  }}
                >
                  Copy
                </button>
                <button
                  type="button"
                  className="ghost"
                  title="Download shortcuts as text file"
                  onClick={onDownloadShortcuts}
                >
                  Download
                </button>
                <button type="button" className="ghost" onClick={() => setHelpOpen(false)}>
                  Close
                </button>
              </div>
            </header>
            <div className="help-list pad">
              <table className="help-table">
                <tbody>
                  {SHORTCUTS.map((s) => (
                    <tr key={`${s.keys}-${s.action}`}>
                      <th scope="row">
                        <kbd>{s.keys}</kbd>
                      </th>
                      <td>
                        {s.action}
                        {s.scope ? <span className="muted"> · {s.scope}</span> : null}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      ) : null}

      {sessionsOpen ? (
        <div className="stats-overlay" role="dialog" aria-label="Open sessions">
          <div className="stats-panel">
            <header className="panel-header">
              <h2>Open sessions</h2>
              <div className="btn-row">
                {sessionList.length ? (
                  <button
                    type="button"
                    className="ghost"
                    title="Download sessions list as JSON"
                    onClick={() => {
                      const blob = new Blob(
                        [
                          JSON.stringify(
                            { count: sessionList.length, sessions: sessionList },
                            null,
                            2,
                          ),
                        ],
                        { type: "application/json" },
                      );
                      const url = URL.createObjectURL(blob);
                      const a = document.createElement("a");
                      a.href = url;
                      a.download = "fwbweb-sessions.json";
                      a.click();
                      URL.revokeObjectURL(url);
                      setStatus(`Downloaded ${sessionList.length} session(s)`);
                    }}
                  >
                    JSON
                  </button>
                ) : null}
                <button type="button" className="ghost" onClick={() => setSessionsOpen(false)}>
                  Close
                </button>
              </div>
            </header>
            {sessionList.length ? (
              <ul className="stats-fw-list pad">
                {sessionList.map((s) => (
                  <li key={s.session_id}>
                    <code className="muted">{s.session_id.slice(0, 8)}</code>{" "}
                    {s.path}
                    {sessionId === s.session_id ? (
                      <span className="muted"> · current</span>
                    ) : null}
                    {s.new ? <span className="muted"> · new</span> : null}
                  </li>
                ))}
              </ul>
            ) : (
              <p className="muted pad">No open sessions</p>
            )}
          </div>
        </div>
      ) : null}

      {stats ? (
        <div className="stats-overlay" role="dialog" aria-label="Project stats">
          <div className="stats-panel">
            <header className="panel-header">
              <h2>Project stats</h2>
              <div className="btn-row">
                <button type="button" className="ghost" onClick={onDownloadStats}>
                  Download JSON
                </button>
                <button type="button" className="ghost" onClick={onDownloadStatsTsv}>
                  Download TSV
                </button>
                <button type="button" className="ghost" onClick={() => setStats(null)}>
                  Close
                </button>
              </div>
            </header>
            <dl className="stats-grid">
              {(
                [
                  ["Libraries", stats.libraries],
                  ["Objects (User)", stats.objects],
                  ["Firewalls", stats.firewalls],
                  ["Clusters", stats.clusters ?? 0],
                  ["Hosts", stats.hosts],
                  ["Interfaces", stats.interfaces],
                  ["Addresses", stats.addresses],
                  ["Services", stats.services],
                  ["Rulesets", stats.rulesets ?? 0],
                  ["Rules", stats.rules],
                  ["Deleted", stats.deleted],
                  ["Unused", stats.unused ?? 0],
                ] as const
              ).map(([label, value]) => (
                <div key={label}>
                  <dt>{label}</dt>
                  <dd>{value}</dd>
                </div>
              ))}
            </dl>
            {statsFirewalls.length ? (
              <div className="pad">
                <div className="muted">Firewalls</div>
                <ul className="stats-fw-list">
                  {statsFirewalls.map((f) => (
                    <li key={f.id} className="btn-row">
                      <button
                        type="button"
                        className="linkish"
                        onClick={() => {
                          setStats(null);
                          void onSelect(f);
                        }}
                      >
                        {f.name}
                        {f.attrs?.platform ? (
                          <span className="muted"> · {String(f.attrs.platform)}</span>
                        ) : null}
                      </button>
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy}
                        title="Open Policy rules for this firewall"
                        onClick={() => {
                          setStats(null);
                          void loadRules(f.id, "policy");
                        }}
                      >
                        Rules
                      </button>
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy}
                        title="Compile this firewall"
                        onClick={() => {
                          setStats(null);
                          setRulesFwId(f.id);
                          setRulesFwMeta({
                            name: f.name,
                            platform:
                              f.attrs?.platform != null
                                ? String(f.attrs.platform)
                                : undefined,
                            host_OS:
                              f.attrs?.host_OS != null
                                ? String(f.attrs.host_OS)
                                : undefined,
                          });
                          void onCompile(f.id);
                        }}
                      >
                        Compile
                      </button>
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy}
                        title="Deploy dry-run (compile first, no scp/ssh)"
                        onClick={() => {
                          setStats(null);
                          setRulesFwId(f.id);
                          setRulesFwMeta({
                            name: f.name,
                            platform:
                              f.attrs?.platform != null
                                ? String(f.attrs.platform)
                                : undefined,
                            host_OS:
                              f.attrs?.host_OS != null
                                ? String(f.attrs.host_OS)
                                : undefined,
                          });
                          void onDeployDryRun(f.id);
                        }}
                      >
                        Deploy dry-run
                      </button>
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy}
                        title="Live deploy with double confirm"
                        onClick={() => {
                          setStats(null);
                          setRulesFwId(f.id);
                          setRulesFwMeta({
                            name: f.name,
                            platform:
                              f.attrs?.platform != null
                                ? String(f.attrs.platform)
                                : undefined,
                            host_OS:
                              f.attrs?.host_OS != null
                                ? String(f.attrs.host_OS)
                                : undefined,
                          });
                          void onDeployLive(f.id);
                        }}
                      >
                        Deploy live
                      </button>
                    </li>
                  ))}
                </ul>
              </div>
            ) : null}
            <p className="muted pad">{stats.path}</p>
          </div>
        </div>
      ) : null}
    </div>
  );
}
