import { useEffect, useMemo, useRef, useState } from "react";
import {
  addRule,
  addRuleRef,
  closeProject,
  compileAllFirewalls,
  compileFirewall,
  deleteObject,
  emptyDeletedObjects,
  findUnusedObjects,
  fetchWhereUsed,
  fetchObjectPath,
  listDeletedObjects,
  listSessions,
  formatRuleObjects,
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

type Theme = "light" | "dark";
type MainTab = "object" | "rules";
type RulesWhich = "policy" | "nat" | "routing";

type PickerTarget = { ruleId: string; element: string };

export function App() {
  const [theme, setTheme] = useState<Theme>(() =>
    window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light",
  );
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
  const [tab, setTab] = useState<MainTab>("object");
  const [rulesWhich, setRulesWhich] = useState<RulesWhich>("policy");
  const [rulesFwId, setRulesFwId] = useState<string | null>(null);
  const [rulesetId, setRulesetId] = useState<string | null>(null);
  const [rulesetList, setRulesetList] = useState<RulesetListEntry[]>([]);
  const [rules, setRules] = useState<AnyRule[]>([]);
  const [rulesetName, setRulesetName] = useState("");
  const [selectedRuleId, setSelectedRuleId] = useState<string | undefined>();
  const [searchQ, setSearchQ] = useState("");
  const [searchType, setSearchType] = useState("");
  const [searchHits, setSearchHits] = useState<TreeNode[]>([]);
  const [picker, setPicker] = useState<PickerTarget | null>(null);
  const [compileLog, setCompileLog] = useState<string | null>(null);
  const [compileOutputs, setCompileOutputs] = useState<string[]>([]);
  const [dirty, setDirty] = useState(false);
  const [hideDisabled, setHideDisabled] = useState(false);
  const [ruleGroupFilter, setRuleGroupFilter] = useState("");
  const [ruleTextFilter, setRuleTextFilter] = useState("");
  const [treeFilter, setTreeFilter] = useState("");
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
  const [objectPath, setObjectPath] = useState<ObjectPathEntry[]>([]);
  const searchInputRef = useRef<HTMLInputElement>(null);

  const canOperate = useMemo(() => Boolean(sessionId) && !busy, [sessionId, busy]);

  const visibleRules = useMemo(() => {
    let list = rules;
    if (hideDisabled) list = list.filter((r) => !r.disabled);
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
  }, [rules, hideDisabled, ruleGroupFilter, ruleTextFilter]);

  const ruleGroups = useMemo(() => {
    const set = new Set<string>();
    for (const r of rules) {
      if (r.group?.trim()) set.add(r.group.trim());
    }
    return Array.from(set).sort();
  }, [rules]);

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
    void refreshObjectPath(selected?.id ?? null);
  }, [sessionId, selected?.id]);

  function rememberPath(p: string) {
    const next = [p, ...recentPaths.filter((x) => x !== p)].slice(0, 8);
    setRecentPaths(next);
    try {
      localStorage.setItem("fwbweb.recent", JSON.stringify(next));
    } catch {
      /* ignore quota */
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
        if (fwId) {
          try {
            const fw = await fetchObject(sessionId, fwId);
            setRulesetList(fw.ruleset_list ?? []);
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
      setRulesetId(targetId);
      setRulesWhich(which);
      setTab("rules");
      setStatus(`${chosen?.name || which} · ${data.rules?.length ?? 0} rules`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function refreshRules() {
    if (!sessionId || !rulesFwId) return;
    const target = rulesetId || rulesFwId;
    const data = await fetchRuleset(sessionId, target, rulesWhich);
    setRules(data.rules ?? []);
    setRulesetName(data.name || rulesWhich);
    setStatus(`${rulesWhich} · ${data.rules?.length ?? 0} rules`);
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

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (!sessionId || busy) return;
      const target = e.target as HTMLElement | null;
      const typing =
        target &&
        (target.tagName === "INPUT" ||
          target.tagName === "TEXTAREA" ||
          target.tagName === "SELECT" ||
          target.isContentEditable);
      const mod = e.ctrlKey || e.metaKey;
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
      if (e.key === "Escape" && !typing) {
        if (picker) {
          setPicker(null);
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
      if (tab !== "rules" || typing) return;
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
      if (e.key === " " && selectedRuleId && !mod && !e.altKey) {
        e.preventDefault();
        const rule = visibleRules.find((r) => r.id === selectedRuleId);
        if (rule) void onToggleRule(rule);
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
    picker,
    trashOpen,
    unusedHits,
    searchHits,
    searchQ,
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
    if (
      !window.confirm(
        `Move ${unusedHits.length} unused object(s) to Deleted Objects?`,
      )
    )
      return;
    setBusy(true);
    setError(null);
    try {
      let n = 0;
      for (const hit of unusedHits) {
        await deleteObject(sessionId, hit.id, false);
        n += 1;
      }
      setUnusedHits([]);
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
    } catch {
      /* ignore */
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

  async function onFindUnused() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const res = await findUnusedObjects(sessionId);
      setUnusedHits(res.objects ?? []);
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

  function onCopyRulesTsv() {
    if (!visibleRules.length) return;
    const cols = [
      "pos",
      "disabled",
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
    for (const r of visibleRules) {
      const action = "action" in r ? String((r as PolicyRule).action ?? "") : "";
      const cell = (el: RuleElement | undefined) =>
        el ? formatRuleObjects(el).replace(/\t|\n/g, " ") : "";
      const pr = r as PolicyRule;
      lines.push(
        [
          String(r.position ?? ""),
          r.disabled ? "1" : "0",
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
    void navigator.clipboard.writeText(lines.join("\n")).then(
      () => setStatus(`Copied ${visibleRules.length} rule(s) as TSV`),
      () => setError("Clipboard write failed"),
    );
  }

  async function onDuplicateObject() {
    if (!sessionId || !selected) return;
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

  async function onCopyRuleToRuleset() {
    if (!sessionId || !selectedRuleId || !rulesFwId) return;
    const wantType = rulesWhich === "nat" ? "NAT" : rulesWhich === "routing" ? "Routing" : "Policy";
    const candidates = rulesetList.filter(
      (r) => r.type === wantType && r.id !== rulesetId,
    );
    if (!candidates.length) {
      setError(`No other ${wantType} ruleset on this firewall`);
      return;
    }
    const labels = candidates.map((c, i) => `${i + 1}. ${c.name}${c.top ? " (top)" : ""}`).join("\n");
    const raw = window.prompt(`Copy selected rule to which ${wantType}?\n${labels}\nEnter number:`, "1");
    if (raw === null) return;
    const idx = Number(raw) - 1;
    if (!Number.isFinite(idx) || idx < 0 || idx >= candidates.length) {
      setError("invalid ruleset choice");
      return;
    }
    const target = candidates[idx];
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

  async function onCompile() {
    if (!sessionId || !rulesFwId) return;
    setBusy(true);
    setError(null);
    setCompileLog(null);
    setCompileOutputs([]);
    try {
      const res = await compileFirewall(sessionId, rulesFwId);
      setCompileOutputs(res.outputs ?? []);
      setCompileLog(
        `${res.compiler} → ${res.destdir}\noutputs: ${res.outputs.join(", ") || "(none)"}\n\n${res.log}`,
      );
      setStatus(`Compiled ${res.firewall} (${res.platform})`);
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
      setSearchHits([]);
      setCompileLog(null);
      setCompileOutputs([]);
      setDirty(false);
      setTrashCount(0);
      setTrashItems([]);
      setTrashOpen(false);
      setUnusedHits([]);
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
      const res = await searchObjects(sessionId, searchQ, searchType);
      setSearchHits(res.results ?? []);
      setStatus(`Search: ${res.count} hits${searchType ? ` · ${searchType}` : ""}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
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
          <button type="button" onClick={onOpen} disabled={busy}>
            Open
          </button>
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
            onClick={() => setTheme((t) => (t === "dark" ? "light" : "dark"))}
          >
            {theme === "dark" ? "Light" : "Dark"}
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
                <span>Deleted Objects</span>
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
              {trashItems.map((item) => (
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
              title="Reload tree at depth 1"
            >
              Collapse
            </button>
          </div>
          <div className="search-row">
            <input
              ref={searchInputRef}
              placeholder="Search… (Ctrl+F)"
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
              title="Find Address/Service/Interval objects with no references"
            >
              Unused
            </button>
          </div>
              {unusedHits.length ? (
            <div className="search-hits">
              <div className="trash-panel-head">
                <span>Unused ({unusedHits.length})</span>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  onClick={() => void onDeleteUnused()}
                  title="Soft-delete all listed unused objects"
                >
                  Delete all
                </button>
                <button type="button" className="ghost" onClick={() => setUnusedHits([])}>
                  Clear
                </button>
              </div>
              {unusedHits.map((h) => (
                <button
                  key={h.id}
                  type="button"
                  className="tree-item"
                  onClick={() => void onSelect(h)}
                >
                  <span className="tree-type">{h.type}</span>
                  <span className="tree-name">{h.name}</span>
                </button>
              ))}
            </div>
          ) : null}
          {searchHits.length ? (
            <div className="search-hits">
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
                >
                  <span className="tree-type">{h.type}</span>
                  <span className="tree-name">{h.name}</span>
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
              onClick={() => setTab("object")}
            >
              Object
            </button>
            <button
              type="button"
              className={tab === "rules" ? undefined : "ghost"}
              disabled={!rulesFwId}
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
                </nav>
              ) : null}
            <ObjectDetail
              object={selected}
              busy={busy}
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
                <h2>{rulesetName || "Rules"}</h2>
                <div className="btn-row">
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
                            </option>
                          ))}
                      </select>
                    </label>
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
                  <button type="button" disabled={!canOperate} onClick={() => void onAddRule("bottom")}>
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
                  <label className="field inline">
                    <input
                      type="checkbox"
                      checked={hideDisabled}
                      disabled={busy}
                      onChange={(e) => setHideDisabled(e.target.checked)}
                    />{" "}
                    Hide disabled
                  </label>
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
                  <label className="field inline">
                    Filter
                    <input
                      value={ruleTextFilter}
                      disabled={busy}
                      placeholder="comment/action/objects…"
                      onChange={(e) => setRuleTextFilter(e.target.value)}
                    />
                  </label>
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
                    disabled={!visibleRules.length}
                    onClick={onCopyRulesTsv}
                    title="Copy visible rules as tab-separated text"
                  >
                    Copy TSV
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
                    disabled={!canOperate || !selectedRuleId}
                    onClick={() => void onDeleteRule()}
                  >
                    Delete
                  </button>
                  <button type="button" disabled={!canOperate} onClick={() => void onCompile()}>
                    Compile
                  </button>
                  <button
                    type="button"
                    className="ghost"
                    disabled={!canOperate}
                    onClick={() => void onCompileAll()}
                    title="Compile every firewall in this project"
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
                <pre className="compile-log pad">{compileLog}</pre>
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
          <span className="muted" title="Open API sessions">
            sessions {sessionCount}
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
    </div>
  );
}
