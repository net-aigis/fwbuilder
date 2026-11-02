import { useMemo, useState } from "react";
import {
  closeProject,
  fetchObject,
  fetchTree,
  getToken,
  openProject,
  saveProject,
  setToken,
  type TreeNode,
} from "./api/client";
import { ObjectDetail } from "./components/ObjectDetail";
import { ObjectTree } from "./components/ObjectTree";

type Theme = "light" | "dark";

export function App() {
  const [theme, setTheme] = useState<Theme>(() =>
    window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light",
  );
  const [token, setTokenState] = useState(getToken());
  const [path, setPath] = useState("../fixtures/sample.fwb");
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [tree, setTree] = useState<TreeNode | null>(null);
  const [selected, setSelected] = useState<TreeNode | null>(null);
  const [status, setStatus] = useState<string>("Not connected");
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const canOperate = useMemo(() => Boolean(sessionId) && !busy, [sessionId, busy]);

  async function onOpen() {
    setBusy(true);
    setError(null);
    try {
      setToken(token);
      const opened = await openProject(path);
      setSessionId(opened.session_id);
      const t = await fetchTree(opened.session_id, 4);
      setTree(t.root);
      setSelected(null);
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
    } catch (err) {
      setSelected(node);
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

  async function onClose() {
    if (!sessionId) return;
    setBusy(true);
    setError(null);
    try {
      await closeProject(sessionId);
      setSessionId(null);
      setTree(null);
      setSelected(null);
      setStatus("Closed");
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
          <span className="muted">WebUI · Phase 1</span>
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
          {tree ? (
            <ObjectTree node={tree} selectedId={selected?.id} onSelect={onSelect} />
          ) : (
            <p className="muted pad">Open a `.fwb` project to load the object tree.</p>
          )}
        </aside>
        <main className="main">
          <ObjectDetail object={selected} />
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
