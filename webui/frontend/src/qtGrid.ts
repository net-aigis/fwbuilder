import type { CSSProperties } from "react";
import type { OptionFieldMeta } from "./api/client";

export type QtGridSpacer = {
  row?: number;
  column?: number;
  rowspan?: number;
  colspan?: number;
  orientation?: string;
  name?: string;
};

function columnsFromStretch(maxCol: number, stretch: number[]): string {
  const parts: string[] = [];
  for (let i = 0; i <= maxCol; i++) {
    const w = stretch[i] ?? 1;
    parts.push(`minmax(8rem, ${Math.max(w, 1)}fr)`);
  }
  return parts.join(" ");
}

/** Build CSS grid template extents from .ui QGridLayout metadata. */
export function qtGridStyle(
  keys: string[],
  fields: Record<string, OptionFieldMeta | undefined>,
  spacers: QtGridSpacer[] = [],
  columnStretch: number[] = [],
  annotations: QtGridSpacer[] = [],
): { className: string; style?: CSSProperties } {
  const useQt =
    keys.some((k) => fields[k]?.grid) || spacers.length > 0 || annotations.length > 0;
  if (!useQt) return { className: "typed-grid options-grid" };
  let maxCol = Math.max(3, columnStretch.length - 1);
  let maxRow = 0;
  for (const k of keys) {
    const g = fields[k]?.grid;
    if (!g || g.row == null || g.column == null) continue;
    maxRow = Math.max(maxRow, g.row + (g.rowspan || 1) - 1);
    maxCol = Math.max(maxCol, g.column + (g.colspan || 1) - 1);
  }
  for (const s of [...spacers, ...annotations]) {
    if (s.row == null || s.column == null) continue;
    maxRow = Math.max(maxRow, s.row + (s.rowspan || 1) - 1);
    maxCol = Math.max(maxCol, s.column + (s.colspan || 1) - 1);
  }
  const cols =
    columnStretch.length > 0
      ? columnsFromStretch(maxCol, columnStretch)
      : `repeat(${maxCol + 1}, minmax(8rem, 1fr))`;
  return {
    className: "typed-grid options-grid qt-grid",
    style: {
      gridTemplateColumns: cols,
      gridTemplateRows: `repeat(${maxRow + 1}, auto)`,
    },
  };
}

/** CSS placement for a .ui QSpacerItem or free QLabel annotation cell. */
export function qtSpacerStyle(spacer: QtGridSpacer): CSSProperties | undefined {
  if (spacer.row == null || spacer.column == null) return undefined;
  return {
    gridRow:
      spacer.rowspan && spacer.rowspan > 1
        ? `${spacer.row + 1} / span ${spacer.rowspan}`
        : spacer.row + 1,
    gridColumn:
      spacer.colspan && spacer.colspan > 1
        ? `${spacer.column + 1} / span ${spacer.colspan}`
        : spacer.column + 1,
  };
}

export type QtGridAnnotation = QtGridSpacer & { text: string };
