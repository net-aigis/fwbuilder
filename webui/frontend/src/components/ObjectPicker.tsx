import { useEffect, useState } from "react";
import { searchObjects, type TreeNode } from "../api/client";

type CellMember = { id: string; name: string; type: string };

type Props = {
  sessionId: string;
  title: string;
  busy?: boolean;
  current?: CellMember[];
  onPick: (obj: TreeNode) => void;
  onCancel: () => void;
  onAny?: () => void;
  onToggleNeg?: () => void;
  onRemove?: (objectId: string) => void;
};

export function ObjectPicker({
  sessionId,
  title,
  busy,
  current,
  onPick,
  onCancel,
  onAny,
  onToggleNeg,
  onRemove,
}: Props) {
  const [q, setQ] = useState("");
  const [hits, setHits] = useState<TreeNode[]>([]);
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    let cancelled = false;
    setLoading(true);
    setError(null);
    void searchObjects(sessionId, q)
      .then((res) => {
        if (!cancelled) setHits(res.results ?? []);
      })
      .catch((err) => {
        if (!cancelled) setError(err instanceof Error ? err.message : String(err));
      })
      .finally(() => {
        if (!cancelled) setLoading(false);
      });
    return () => {
      cancelled = true;
    };
  }, [sessionId, q]);

  return (
    <div className="modal-backdrop" role="presentation" onClick={onCancel}>
      <div
        className="modal"
        role="dialog"
        aria-label={title}
        onClick={(e) => e.stopPropagation()}
      >
        <header className="panel-header">
          <h2>{title}</h2>
          <div className="btn-row">
            {onAny ? (
              <button type="button" className="ghost" disabled={busy} onClick={onAny}>
                Set Any
              </button>
            ) : null}
            {onToggleNeg ? (
              <button type="button" className="ghost" disabled={busy} onClick={onToggleNeg}>
                Toggle negate
              </button>
            ) : null}
            <button type="button" className="ghost" onClick={onCancel}>
              Cancel
            </button>
          </div>
        </header>
        <div className="pad">
          {current?.length ? (
            <div className="picker-current">
              <p className="muted">In this cell</p>
              <ul className="picker-list">
                {current.map((m) => (
                  <li key={m.id} className="btn-row">
                    <span>
                      {m.type} · {m.name}
                    </span>
                    {onRemove ? (
                      <button
                        type="button"
                        className="ghost"
                        disabled={busy}
                        onClick={() => onRemove(m.id)}
                      >
                        Remove
                      </button>
                    ) : null}
                  </li>
                ))}
              </ul>
            </div>
          ) : null}
          <input
            autoFocus
            placeholder="Search objects…"
            value={q}
            disabled={busy}
            onChange={(e) => setQ(e.target.value)}
          />
          {loading ? <p className="muted">Searching…</p> : null}
          {error ? <p className="error">{error}</p> : null}
          <div className="picker-list">
            {hits.map((h) => (
              <button
                key={h.id}
                type="button"
                className="tree-item"
                disabled={busy}
                onClick={() => onPick(h)}
              >
                <span className="tree-type">{h.type}</span>
                <span className="tree-name">{h.name}</span>
              </button>
            ))}
            {!loading && !hits.length ? <p className="muted">No matches.</p> : null}
          </div>
        </div>
      </div>
    </div>
  );
}
