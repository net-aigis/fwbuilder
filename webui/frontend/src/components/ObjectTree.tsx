import { useState } from "react";
import type { TreeNode } from "../api/client";

type Props = {
  node: TreeNode;
  selectedId?: string;
  onSelect: (node: TreeNode) => void;
  depth?: number;
};

export function ObjectTree({ node, selectedId, onSelect, depth = 0 }: Props) {
  const selected = node.id === selectedId;
  const kids = node.children ?? [];
  const hasKids = kids.length > 0 || (node.children_count ?? 0) > 0;
  const [open, setOpen] = useState(depth < 2);
  const color =
    typeof node.attrs?.color === "string" && node.attrs.color.trim()
      ? node.attrs.color.trim()
      : null;
  const hint = (() => {
    const a = node.attrs ?? {};
    for (const key of ["address", "dnsname", "filename", "tagcode", "userid", "phys_address"]) {
      const v = a[key];
      if (v !== undefined && v !== null && String(v).trim()) return String(v);
    }
    return null;
  })();

  return (
    <div className="tree-node" style={{ paddingLeft: depth === 0 ? 0 : 12 }}>
      <div className="tree-row">
        {hasKids ? (
          <button
            type="button"
            className="tree-twist"
            aria-label={open ? "Collapse" : "Expand"}
            onClick={() => setOpen((v) => !v)}
          >
            {open ? "▾" : "▸"}
          </button>
        ) : (
          <span className="tree-twist spacer" />
        )}
        <button
          type="button"
          className={`tree-item${selected ? " selected" : ""}`}
          draggable={node.type !== "FWObjectDatabase"}
          onDragStart={(e) => {
            e.dataTransfer.setData("application/x-fwb-object-id", node.id);
            e.dataTransfer.setData("text/plain", node.name || node.id);
            e.dataTransfer.effectAllowed = "copy";
          }}
          onClick={() => onSelect(node)}
          title={node.comment || node.type}
        >
          {color ? (
            <span className="tree-swatch" style={{ background: color }} title={color} />
          ) : null}
          <span className="tree-type">{node.type}</span>
          <span className="tree-name">{node.name || "(unnamed)"}</span>
          {hint ? <span className="tree-hint">{hint}</span> : null}
        </button>
      </div>
      {open
        ? kids.map((child) => (
            <ObjectTree
              key={child.id}
              node={child}
              selectedId={selectedId}
              onSelect={onSelect}
              depth={depth + 1}
            />
          ))
        : null}
    </div>
  );
}
