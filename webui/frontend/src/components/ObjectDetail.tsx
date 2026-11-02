import type { TreeNode } from "../api/client";

type Props = {
  object?: TreeNode | null;
};

export function ObjectDetail({ object }: Props) {
  if (!object) {
    return (
      <div className="panel empty">
        <p>Select an object in the tree.</p>
      </div>
    );
  }

  const attrs = object.attrs ?? {};

  return (
    <div className="panel">
      <header className="panel-header">
        <h2>{object.name || "(unnamed)"}</h2>
        <p className="muted">
          {object.type} · {object.id}
          {object.ro ? " · read-only" : ""}
        </p>
      </header>
      {object.comment ? <p className="comment">{object.comment}</p> : null}
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
