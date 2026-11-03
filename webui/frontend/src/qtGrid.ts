import type { CSSProperties } from "react";
import type { OptionFieldMeta } from "./api/client";

/** Build CSS grid template extents from .ui QGridLayout metadata. */
export function qtGridStyle(
  keys: string[],
  fields: Record<string, OptionFieldMeta | undefined>,
): { className: string; style?: CSSProperties } {
  const useQt = keys.some((k) => fields[k]?.grid);
  if (!useQt) return { className: "typed-grid options-grid" };
  let maxCol = 3;
  let maxRow = 0;
  for (const k of keys) {
    const g = fields[k]?.grid;
    if (!g || g.row == null || g.column == null) continue;
    maxRow = Math.max(maxRow, g.row + (g.rowspan || 1) - 1);
    maxCol = Math.max(maxCol, g.column + (g.colspan || 1) - 1);
  }
  return {
    className: "typed-grid options-grid qt-grid",
    style: {
      gridTemplateColumns: `repeat(${maxCol + 1}, minmax(8rem, 1fr))`,
      gridTemplateRows: `repeat(${maxRow + 1}, auto)`,
    },
  };
}
