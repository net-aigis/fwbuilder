import { useMemo, useState } from "react";
import {
  addRule,
  addRuleRef,
  closeProject,
  compileFirewall,
  deleteObject,
  duplicateObject,
  duplicateRule,
  downloadCompileOutput,
  downloadProjectUrl,
  deleteRule,
  fetchObject,
  fetchRuleset,
  fetchTree,
  getToken,
  moveRule,
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
  type RoutingRuleRow,
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
  const [path, setPath] = useState("../fixtures/sample-v24.fwb");
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [tree, setTree] = useState<TreeNode | null>(null);
  const [selected, setSelected] = useState<TreeNode | null>(null);
  const [status, setStatus] = useState<string>("Not connected");
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [tab, setTab] = useState<MainTab>("object");
  const [rulesWhich, setRulesWhich] = useState<RulesWhich>("policy");
  const [rulesFwId, setRulesFwId] = useState<string | null>(null);
  const [rules, setRules] = useState<AnyRule[]>([]);
  const [rulesetName, setRulesetName] = useState("");
  const [selectedRuleId, setSelectedRuleId] = useState<string | undefined>();
  const [searchQ, setSearchQ] = useState("");
  const [searchHits, setSearchHits] = useState<TreeNode[]>([]);
  const [picker, setPicker] = useState<PickerTarget | null>(null);
  const [compileLog, setCompileLog] = useState<string | null>(null);
  const [compileOutputs, setCompileOutputs] = useState<string[]>([]);
  const [dirty, setDirty] = useState(false);

  const canOperate = useMemo(() => Boolean(sessionId) && !busy, [sessionId, busy]);

  async function onOpen() {
    setBusy(true);
    setError(null);
    try {
      setToken(token);
      const opened = await openProject(path);
      setSessionId(opened.session_id);
      const t = await fetchTree(opened.session_id, 5);
      setTree(t.root);
      setSelected(null);
      setRules([]);
      setTab("object");
      setCompileLog(null);
      setCompileOutputs([]);
      setDirty(Boolean(t.dirty));
      setStatus(`Open: ${t.path}`);
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
      setTab("object");
    } catch (err) {
      setSelected(node);
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function loadRules(fwId: string, which: RulesWhich) {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const data = await fetchRuleset(sessionId, fwId, which);
      setRules(data.rules ?? []);
      setRulesetName(data.name || which);
      setRulesFwId(fwId);
      setRulesWhich(which);
      setTab("rules");
      setStatus(`${which} · ${data.rules?.length ?? 0} rules`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function refreshRules() {
    if (!sessionId || !rulesFwId) return;
    const data = await fetchRuleset(sessionId, rulesFwId, rulesWhich);
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

  async function onDeleteObject() {
    if (!sessionId || !selected) return;
    if (!window.confirm(`Delete ${selected.type} “${selected.name}”?`)) return;
    setBusy(true);
    setError(null);
    try {
      await deleteObject(sessionId, selected.id);
      setSelected(null);
      setDirty(true);
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus("Object deleted");
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
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
    setBusy(true);
    setError(null);
    try {
      const created = await addRule(sessionId, rulesFwId, {
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
      setStatus(`Rule duplicated → ${copy.id}`);
      await refreshRules();
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
      await refreshRules();
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
      setStatus("Closed");
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
      const res = await searchObjects(sessionId, searchQ);
      setSearchHits(res.results ?? []);
      setStatus(`Search: ${res.count} hits`);
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
            <input value={path} onChange={(e) => setPath(e.target.value)} />
          </label>
          <button type="button" onClick={onOpen} disabled={busy}>
            Open
          </button>
          <button type="button" onClick={() => void onSave(false)} disabled={!canOperate}>
            Save
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
          <div className="sidebar-title">Objects</div>
          <div className="search-row">
            <input
              placeholder="Search…"
              value={searchQ}
              disabled={!sessionId || busy}
              onChange={(e) => setSearchQ(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === "Enter") void onSearch();
              }}
            />
            <button type="button" className="ghost" disabled={!canOperate} onClick={onSearch}>
              Go
            </button>
          </div>
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
            <ObjectTree node={tree} selectedId={selected?.id} onSelect={onSelect} />
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
                        disabled={busy || selected.ro}
                        onClick={() => void onDuplicateObject()}
                      >
                        Duplicate
                      </button>
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy || selected.ro}
                        onClick={() => void onDeleteObject()}
                      >
                        Delete object
                      </button>
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
                    onClick={() => void onDuplicateRule()}
                  >
                    Duplicate
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
                </div>
              </header>
              <RuleGrid
                rules={rules}
                kind={rulesWhich}
                busy={busy}
                selectedId={selectedRuleId}
                onSelectRule={(r) => setSelectedRuleId(r.id)}
                onToggleDisabled={onToggleRule}
                onChangeAction={onChangeAction}
                onChangeMetric={onChangeMetric}
                onEditCell={(rule, element) => setPicker({ ruleId: rule.id, element })}
                onDropObject={onDropObject}
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
                      onSaved={() => void refreshRules()}
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
