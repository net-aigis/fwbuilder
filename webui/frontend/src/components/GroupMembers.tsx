import { useEffect, useState } from "react";
import { addMember, fetchMembers, removeMember, searchObjects } from "../api/client";

type Props = {
  sessionId: string;
  groupId: string;
  groupName?: string;
  readOnly?: boolean;
  busy?: boolean;
  onBusy?: (b: boolean) => void;
  onStatus?: (s: string) => void;
  onError?: (e: string | null) => void;
  onSelect?: (id: string) => void;
};

type Member = { id: string; name: string; type: string };

export function GroupMembers({
  sessionId,
  groupId,
  groupName,
  readOnly,
  busy,
  onBusy,
  onStatus,
  onError,
  onSelect,
}: Props) {
  const [members, setMembers] = useState<Member[]>([]);
  const [q, setQ] = useState("");
  const [hits, setHits] = useState<Member[]>([]);

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await fetchMembers(sessionId, groupId);
      setMembers(res.members ?? []);
      onStatus?.(`Members: ${res.count ?? 0}${groupName ? ` · ${groupName}` : ""}`);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  useEffect(() => {
    void reload();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionId, groupId]);

  async function search() {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await searchObjects(sessionId, q.trim());
      const existing = new Set(members.map((m) => m.id));
      setHits(
        (res.results || [])
          .filter((r) => r.id !== groupId && !existing.has(r.id))
          .slice(0, 20)
          .map((r) => ({ id: r.id, name: r.name, type: r.type })),
      );
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  async function onAdd(id: string) {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await addMember(sessionId, groupId, id);
      setMembers(res.members ?? []);
      setHits((prev) => prev.filter((h) => h.id !== id));
      onStatus?.("Member added");
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  async function onRemove(id: string) {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await removeMember(sessionId, groupId, id);
      setMembers(res.members ?? []);
      onStatus?.("Member removed");
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  return (
    <div className="create-object">
      <header className="panel-header">
        <h3>Group members</h3>
        <button type="button" className="ghost" disabled={busy} onClick={() => void reload()}>
          Reload
        </button>
      </header>
      {members.length ? (
        <ul className="picker-list">
          {members.map((m) => (
            <li key={m.id} className="btn-row">
              <button type="button" disabled={busy} onClick={() => onSelect?.(m.id)}>
                {m.type} · {m.name}
              </button>
              {!readOnly ? (
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  onClick={() => void onRemove(m.id)}
                >
                  Remove
                </button>
              ) : null}
            </li>
          ))}
        </ul>
      ) : (
        <p className="muted pad">No members.</p>
      )}
      {!readOnly ? (
        <>
          <div className="btn-row pad">
            <input
              value={q}
              disabled={busy}
              placeholder="Search object to add…"
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
                  <button type="button" disabled={busy} onClick={() => void onAdd(h.id)}>
                    Add {h.type} · {h.name}
                  </button>
                </li>
              ))}
            </ul>
          ) : null}
        </>
      ) : null}
    </div>
  );
}
