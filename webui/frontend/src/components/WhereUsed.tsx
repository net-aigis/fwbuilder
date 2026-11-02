import { useEffect, useState } from "react";
import { fetchWhereUsed } from "../api/client";

type Props = {
  sessionId: string;
  objectId: string;
  busy?: boolean;
  onBusy?: (b: boolean) => void;
  onStatus?: (s: string) => void;
  onError?: (e: string | null) => void;
  onSelect?: (id: string) => void;
};

type UseRow = {
  id: string;
  name: string;
  type: string;
  parent_id?: string;
  parent_name?: string;
  parent_type?: string;
};

export function WhereUsed({
  sessionId,
  objectId,
  busy,
  onBusy,
  onStatus,
  onError,
  onSelect,
}: Props) {
  const [uses, setUses] = useState<UseRow[]>([]);

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await fetchWhereUsed(sessionId, objectId);
      setUses(res.uses ?? []);
      onStatus?.(`Where used: ${res.count ?? 0}`);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  useEffect(() => {
    void reload();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionId, objectId]);

  return (
    <div className="create-object">
      <header className="panel-header">
        <h3>Where used</h3>
        <button type="button" className="ghost" disabled={busy} onClick={() => void reload()}>
          Reload
        </button>
        {uses.length ? (
          <button
            type="button"
            className="ghost"
            disabled={busy}
            title="Download where-used list as JSON"
            onClick={() => {
              const blob = new Blob(
                [JSON.stringify({ object_id: objectId, count: uses.length, uses }, null, 2)],
                { type: "application/json" },
              );
              const url = URL.createObjectURL(blob);
              const a = document.createElement("a");
              a.href = url;
              a.download = "fwbweb-where-used.json";
              a.click();
              URL.revokeObjectURL(url);
              onStatus?.(`Downloaded ${uses.length} where-used hit(s)`);
            }}
          >
            JSON
          </button>
        ) : null}
      </header>
      {uses.length ? (
        <ul className="picker-list">
          {uses.map((u) => (
            <li key={`${u.id}-${u.parent_id || ""}`}>
              <button type="button" disabled={busy} onClick={() => onSelect?.(u.id)}>
                {u.type} · {u.name}
                {u.parent_name ? ` ← ${u.parent_type} ${u.parent_name}` : ""}
              </button>
            </li>
          ))}
        </ul>
      ) : (
        <p className="muted pad">Not referenced elsewhere.</p>
      )}
    </div>
  );
}
