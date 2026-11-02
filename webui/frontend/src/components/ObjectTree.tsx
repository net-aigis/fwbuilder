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

  return (
    <div className="tree-node" style={{ paddingLeft: depth === 0 ? 0 : 12 }}>
      <button
        type="button"
        className={`tree-item${selected ? " selected" : ""}`}
        onClick={() => onSelect(node)}
        title={node.comment || node.type}
      >
        <span className="tree-type">{node.type}</span>
        <span className="tree-name">{node.name || "(unnamed)"}</span>
      </button>
      {kids.map((child) => (
        <ObjectTree
          key={child.id}
          node={child}
          selectedId={selectedId}
          onSelect={onSelect}
          depth={depth + 1}
        />
      ))}
    </div>
  );
}
