import { useEffect, useState } from "react";
import type { TreeNode } from "../api/client";

type Props = {
  object?: TreeNode | null;
  readOnly?: boolean;
  busy?: boolean;
  onSave?: (patch: { name: string; comment: string }) => void;
};

export function ObjectDetail({ object, readOnly, busy, onSave }: Props) {
  const [name, setName] = useState("");
  const [comment, setComment] = useState("");

  useEffect(() => {
    setName(object?.name ?? "");
    setComment(object?.comment ?? "");
  }, [object?.id, object?.name, object?.comment]);

  if (!object) {
    return (
      <div className="panel empty">
        <p>Select an object in the tree.</p>
      </div>
    );
  }

  const attrs = object.attrs ?? {};
  const locked = Boolean(readOnly || object.ro || !onSave);

  return (
    <div className="panel">
      <header className="panel-header">
        <h2>{object.name || "(unnamed)"}</h2>
        <p className="muted">
          {object.type} · {object.id}
          {object.ro ? " · read-only" : ""}
        </p>
      </header>

      <label className="field block">
        Name
        <input
          value={name}
          disabled={locked || busy}
          onChange={(e) => setName(e.target.value)}
        />
      </label>
      <label className="field block">
        Comment
        <textarea
          value={comment}
          disabled={locked || busy}
          rows={4}
          onChange={(e) => setComment(e.target.value)}
        />
      </label>
      {!locked ? (
        <button
          type="button"
          disabled={busy}
          onClick={() => onSave?.({ name, comment })}
        >
          Apply object changes
        </button>
      ) : null}

      <dl className="attr-grid">
        {Object.entries(attrs).map(([k, v]) => (
          <div key={k} className="attr-row">
            <dt>{k}</dt>
            <dd>{v}</dd>
          </div>
        ))}
      </dl>
      {!Object.keys(attrs).length ? (
        <p className="muted">No Phase-1 attributes exposed for this type yet.</p>
      ) : null}
    </div>
  );
}
