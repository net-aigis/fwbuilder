import { useEffect, useState } from "react";
import type { TreeNode } from "../api/client";

type Props = {
  node: TreeNode;
  selectedId?: string;
  onSelect: (node: TreeNode) => void;
  depth?: number;
  onExpand?: (node: TreeNode) => Promise<TreeNode[] | undefined>;
  filter?: string;
};

function hintOf(node: TreeNode): string | null {
  const a = node.attrs ?? {};
  for (const key of ["address", "dnsname", "filename", "tagcode", "userid", "phys_address"]) {
    const v = a[key];
    if (v !== undefined && v !== null && String(v).trim()) return String(v);
  }
  return null;
}

function matchesFilter(node: TreeNode, q: string): boolean {
  if (!q) return true;
  const hint = hintOf(node) || "";
  const blob = `${node.name || ""} ${node.type || ""} ${hint}`.toLowerCase();
  if (blob.includes(q)) return true;
  return (node.children || []).some((c) => matchesFilter(c, q));
}

export function ObjectTree({
  node,
  selectedId,
  onSelect,
  depth = 0,
  onExpand,
  filter = "",
}: Props) {
  const q = filter.trim().toLowerCase();
  const selected = node.id === selectedId;
  const [kids, setKids] = useState<TreeNode[]>(node.children ?? []);
  const hasKids = kids.length > 0 || (node.children_count ?? 0) > 0;
  const [open, setOpen] = useState(depth < 2 || Boolean(q));
  const [loading, setLoading] = useState(false);
  const color =
    typeof node.attrs?.color === "string" && node.attrs.color.trim()
      ? node.attrs.color.trim()
      : null;
  const hint = hintOf(node);

  useEffect(() => {
    setKids(node.children ?? []);
  }, [node.children]);

  useEffect(() => {
    if (q) setOpen(true);
  }, [q]);

  if (q && depth > 0 && !matchesFilter(node, q)) return null;

  async function toggle() {
    const next = !open;
    setOpen(next);
    if (next && kids.length === 0 && (node.children_count ?? 0) > 0 && onExpand) {
      setLoading(true);
      try {
        const loaded = await onExpand(node);
        if (loaded) setKids(loaded);
      } finally {
        setLoading(false);
      }
    }
  }

  const visibleKids = q ? kids.filter((c) => matchesFilter(c, q)) : kids;

  return (
    <div className="tree-node" style={{ paddingLeft: depth === 0 ? 0 : 12 }}>
      <div className="tree-row">
        {hasKids ? (
          <button
            type="button"
            className="tree-twist"
            aria-label={open ? "Collapse" : "Expand"}
            onClick={() => void toggle()}
          >
            {loading ? "…" : open ? "▾" : "▸"}
          </button>
        ) : (
          <span className="tree-twist spacer" />
        )}
        <button
          type="button"
          className={`tree-item${selected ? " selected" : ""}${
            node.deleted || node.name === "Deleted Objects" ? " deleted" : ""
          }`}
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
          {node.deleted || node.name === "Deleted Objects" ? (
            <span className="tree-badge">trash</span>
          ) : null}
          {hint ? <span className="tree-hint">{hint}</span> : null}
        </button>
      </div>
      {open
        ? visibleKids.map((child) => (
            <ObjectTree
              key={child.id}
              node={child}
              selectedId={selectedId}
              onSelect={onSelect}
              depth={depth + 1}
              onExpand={onExpand}
              filter={filter}
            />
          ))
        : null}
    </div>
  );
}
