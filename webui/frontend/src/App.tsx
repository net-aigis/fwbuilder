import { useMemo, useState } from "react";
import {
  closeProject,
  fetchObject,
  fetchRuleset,
  fetchTree,
  getToken,
  openProject,
  saveProject,
  searchObjects,
  setToken,
  updateObject,
  updateRule,
  type AnyRule,
  type PolicyRule,
  type TreeNode,
} from "./api/client";
import { ObjectDetail } from "./components/ObjectDetail";
import { ObjectTree } from "./components/ObjectTree";
import { RuleGrid } from "./components/RuleGrid";

type Theme = "light" | "dark";
type MainTab = "object" | "rules";
type RulesWhich = "policy" | "nat" | "routing";

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

  async function onSave() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      const res = await saveProject(sessionId, false);
      setStatus(`Saved: ${res.path}`);
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
      const t = await fetchTree(sessionId, 5);
      setTree(t.root);
      setStatus(`Updated ${updated.name}`);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  }

  async function onToggleRule(rule: AnyRule) {
    if (!sessionId || !rulesFwId) return;
    setBusy(true);
    setError(null);
    try {
      await updateRule(sessionId, rule.id, { disabled: !rule.disabled });
      await loadRules(rulesFwId, rulesWhich);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
      setBusy(false);
    }
  }

  async function onChangeAction(rule: PolicyRule, action: string) {
    if (!sessionId || !rulesFwId) return;
    setBusy(true);
    setError(null);
    try {
      await updateRule(sessionId, rule.id, { action });
      await loadRules(rulesFwId, rulesWhich);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
      setBusy(false);
    }
  }

  async function onClose() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      await closeProject(sessionId);
      setSessionId(null);
      setTree(null);
      setSelected(null);
      setRules([]);
      setSearchHits([]);
      setStatus("Closed");
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
          <span className="muted">WebUI · Phase 2</span>
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
          <button type="button" onClick={onSave} disabled={!canOperate}>
            Save
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
              />
            </div>
          )}
        </main>
      </div>

      <footer className="statusbar">
        <span>{status}</span>
        {busy ? <span className="muted">Working…</span> : null}
        {error ? <span className="error">{error}</span> : null}
      </footer>
    </div>
  );
}
