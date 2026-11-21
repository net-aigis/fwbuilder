import type { CSSProperties } from "react";
import type { OptionFieldMeta } from "./api/client";

export type QtGridSpacer = {
  row?: number;
  column?: number;
  rowspan?: number;
  colspan?: number;
  orientation?: string;
  size_type?: string;
  name?: string;
  size_hint?: { width?: number; height?: number };
};

function columnsFromStretch(maxCol: number, stretch: number[]): string {
  const parts: string[] = [];
  for (let i = 0; i <= maxCol; i++) {
    const w = stretch[i] ?? 1;
    parts.push(`minmax(8rem, ${Math.max(w, 1)}fr)`);
  }
  return parts.join(" ");
}

function rowsFromStretch(maxRow: number, stretch: number[]): string {
  const parts: string[] = [];
  for (let i = 0; i <= maxRow; i++) {
    const w = stretch[i] ?? 0;
    parts.push(w > 0 ? `minmax(auto, ${w}fr)` : "auto");
  }
  return parts.join(" ");
}

/** Build CSS grid template extents from .ui QGridLayout metadata. */
export type QtGridSpacing = {
  spacing?: number;
  horizontal?: number;
  vertical?: number;
  margin_left?: number;
  margin_top?: number;
  margin_right?: number;
  margin_bottom?: number;
};

export function qtGridStyle(
  keys: string[],
  fields: Record<string, OptionFieldMeta | undefined>,
  spacers: QtGridSpacer[] = [],
  columnStretch: number[] = [],
  annotations: QtGridSpacer[] = [],
  spacing: QtGridSpacing = {},
  rowStretch: number[] = [],
): { className: string; style?: CSSProperties } {
  const useQt =
    keys.some((k) => fields[k]?.grid) || spacers.length > 0 || annotations.length > 0;
  if (!useQt) return { className: "typed-grid options-grid" };
  let maxCol = Math.max(3, columnStretch.length - 1);
  let maxRow = Math.max(0, rowStretch.length - 1);
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
  const rows =
    rowStretch.length > 0
      ? rowsFromStretch(maxRow, rowStretch)
      : `repeat(${maxRow + 1}, auto)`;
  const colGap = spacing.horizontal ?? spacing.spacing;
  const rowGap = spacing.vertical ?? spacing.spacing;
  const style: CSSProperties = {
    gridTemplateColumns: cols,
    gridTemplateRows: rows,
  };
  if (colGap != null || rowGap != null) {
    style.gap =
      rowGap != null && colGap != null
        ? `${rowGap}px ${colGap}px`
        : `${colGap ?? rowGap}px`;
  }
  const pad: string[] = [];
  for (const key of ["margin_top", "margin_right", "margin_bottom", "margin_left"] as const) {
    const v = spacing[key];
    pad.push(v != null ? `${v}px` : "0");
  }
  if (pad.some((p) => p !== "0")) style.padding = pad.join(" ");
  return {
    className: "typed-grid options-grid qt-grid",
    style,
  };
}

/** CSS placement for a .ui QSpacerItem or free QLabel annotation cell. */
export function qtSpacerStyle(spacer: QtGridSpacer): CSSProperties | undefined {
  if (spacer.row == null || spacer.column == null) return undefined;
  const style: CSSProperties = {
    gridRow:
      spacer.rowspan && spacer.rowspan > 1
        ? `${spacer.row + 1} / span ${spacer.rowspan}`
        : spacer.row + 1,
    gridColumn:
      spacer.colspan && spacer.colspan > 1
        ? `${spacer.column + 1} / span ${spacer.colspan}`
        : spacer.column + 1,
  };
  const hint = spacer.size_hint;
  if (hint) {
    const orient = (spacer.orientation || "").toLowerCase();
    if (orient === "horizontal" && hint.width && hint.width > 0) {
      style.minWidth = hint.width;
      style.width = hint.width;
    } else if (orient === "vertical" && hint.height && hint.height > 0) {
      style.minHeight = hint.height;
      style.height = hint.height;
    } else {
      if (hint.width && hint.width > 0) style.minWidth = hint.width;
      if (hint.height && hint.height > 0) style.minHeight = hint.height;
    }
  }
  const sizeType = (spacer.size_type || "").toLowerCase();
  if (sizeType === "expanding" || sizeType === "minimumexpanding") {
    const orient = (spacer.orientation || "").toLowerCase();
    if (orient === "horizontal") style.flexGrow = 1;
    else if (orient === "vertical") style.alignSelf = "stretch";
    else {
      style.flexGrow = 1;
      style.alignSelf = "stretch";
    }
  } else if (sizeType === "fixed" && !hint) {
    style.flexGrow = 0;
  } else if (sizeType === "maximum") {
    style.flexGrow = 1;
    style.maxWidth = "100%";
    style.maxHeight = "100%";
  } else if (sizeType === "minimum") {
    style.flexGrow = 0;
    if (!style.minWidth) style.minWidth = "0.25rem";
    if (!style.minHeight) style.minHeight = "0.25rem";
  } else if (sizeType === "preferred") {
    style.flexGrow = 0.5;
  }
  return style;
}

export type QtGridAnnotation = QtGridSpacer & {
  text: string;
  alignment?: string;
  buddy?: string;
};

/** Map .ui Qt::Align* flags to CSS text/self alignment. */
export function qtAlignmentStyle(alignment?: string): CSSProperties | undefined {
  if (!alignment) return undefined;
  const align = alignment.toLowerCase();
  const style: CSSProperties = {};
  if (align.includes("alignright") || align.includes("aligntrailing")) {
    style.textAlign = "right";
    style.justifySelf = "end";
  } else if (align.includes("alignhcenter") || align.includes("aligncenter")) {
    style.textAlign = "center";
    style.justifySelf = "center";
  } else if (align.includes("alignleft") || align.includes("alignleading")) {
    style.textAlign = "left";
    style.justifySelf = "start";
  }
  if (align.includes("alignvcenter")) style.alignSelf = "center";
  else if (align.includes("aligntop")) style.alignSelf = "start";
  else if (align.includes("alignbottom")) style.alignSelf = "end";
  return Object.keys(style).length ? style : undefined;
}
