import { useState } from "react";
import { reparentObject, searchObjects } from "../api/client";

type Props = {
  sessionId: string;
  objectId: string;
  objectName?: string;
  busy?: boolean;
  onMoved: (id: string) => void;
  onBusy?: (busy: boolean) => void;
  onError?: (msg: string | null) => void;
  onStatus?: (msg: string) => void;
};

export function MoveObject({
  sessionId,
  objectId,
  objectName,
  busy,
  onMoved,
  onBusy,
  onError,
  onStatus,
}: Props) {
  const [q, setQ] = useState("");
  const [hits, setHits] = useState<Array<{ id: string; name: string; type: string }>>([]);

  async function search() {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await searchObjects(sessionId, q.trim());
      setHits(
        (res.results || [])
          .filter(
            (r) =>
              r.id !== objectId &&
              (r.type.endsWith("Group") ||
                r.type === "Library" ||
                r.type === "Firewall" ||
                r.type === "Host" ||
                r.type === "Cluster"),
          )
          .slice(0, 20)
          .map((r) => ({ id: r.id, name: r.name, type: r.type })),
      );
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  async function moveTo(parentId: string, parentName: string) {
    onBusy?.(true);
    onError?.(null);
    try {
      await reparentObject(sessionId, objectId, parentId);
      onStatus?.(`Moved ${objectName || objectId} → ${parentName}`);
      onMoved(objectId);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  return (
    <div className="create-object">
      <header className="panel-header">
        <h3>Move object</h3>
      </header>
      <div className="btn-row pad">
        <input
          value={q}
          disabled={busy}
          placeholder="Search new parent…"
          onChange={(e) => setQ(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === "Enter") void search();
          }}
        />
        <button type="button" className="ghost" disabled={busy} onClick={() => void search()}>
          Search
        </button>
      </div>
      {hits.length ? (
        <ul className="picker-list">
          {hits.map((h) => (
            <li key={h.id}>
              <button type="button" disabled={busy} onClick={() => void moveTo(h.id, h.name)}>
                {h.type} · {h.name}
              </button>
            </li>
          ))}
        </ul>
      ) : null}
    </div>
  );
}
