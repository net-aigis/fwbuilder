import type { CSSProperties } from "react";
import { qtAlignmentStyle } from "../qtGrid";

type FieldMeta = {
  type?: string;
  choices?: string[];
  label?: string;
  tooltip?: string;
  whats_this?: string;
  widget?: string;
  widget_class?: string;
  grid?: { row?: number; column?: number; rowspan?: number; colspan?: number };
  size_policy?: { horizontal?: string; vertical?: string };
  minimum_size?: { width?: number; height?: number };
  maximum_size?: { width?: number; height?: number };
  alignment?: string;
  external_label?: boolean;
  enabled?: boolean;
  visible?: boolean;
  read_only?: boolean;
};

type Props = {
  name: string;
  value: string;
  meta?: FieldMeta;
  disabled?: boolean;
  onChange: (value: string) => void;
};

function isTruthy(v: string): boolean {
  return ["true", "1", "yes", "on"].includes(v.trim().toLowerCase());
}

function fieldStyle(meta?: FieldMeta): CSSProperties | undefined {
  const style: CSSProperties = {};
  const g = meta?.grid;
  if (g && g.row != null && g.column != null) {
    style.gridRow = g.rowspan && g.rowspan > 1 ? `${g.row + 1} / span ${g.rowspan}` : g.row + 1;
    style.gridColumn =
      g.colspan && g.colspan > 1 ? `${g.column + 1} / span ${g.colspan}` : g.column + 1;
  }
  const ms = meta?.minimum_size;
  if (ms?.width && ms.width > 0) style.minWidth = ms.width;
  if (ms?.height && ms.height > 0) style.minHeight = ms.height;
  const xs = meta?.maximum_size;
  if (xs?.width && xs.width > 0) style.maxWidth = xs.width;
  if (xs?.height && xs.height > 0) style.maxHeight = xs.height;
  Object.assign(style, qtAlignmentStyle(meta?.alignment) || {});
  return Object.keys(style).length ? style : undefined;
}

function sizePolicyClass(meta?: FieldMeta): string {
  const sp = meta?.size_policy;
  if (!sp) return "";
  const parts: string[] = [];
  if (sp.horizontal) parts.push(`size-h-${sp.horizontal}`);
  if (sp.vertical) parts.push(`size-v-${sp.vertical}`);
  return parts.join(" ");
}

export function OptionField({ name, value, meta, disabled, onChange }: Props) {
  const type = meta?.type || "string";
  const external = Boolean(meta?.external_label);
  const uiDisabled = Boolean(disabled || meta?.enabled === false || meta?.read_only);
  // When .ui puts caption in a separate buddy QLabel cell, avoid duplicating it on the control.
  const label = external ? "" : (meta?.label || "").trim() || name;
  const showKeyHint = Boolean(
    !external && meta?.label && meta.label.trim() && meta.label.trim() !== name,
  );
  const tip = (meta?.tooltip || "").trim() || (external ? (meta?.label || "").trim() : "");
  const whats = (meta?.whats_this || "").trim();
  const title =
    [tip, whats].filter(Boolean).join(" — ") ||
    (showKeyHint ? name : undefined) ||
    (external ? name : undefined);
  const style = fieldStyle(meta);
  const sizeClass = sizePolicyClass(meta);
  if (meta?.visible === false) {
    // Keep the .ui grid cell as an invisible hole (layout honesty; not removed from flow).
    return (
      <div
        className={["field", "block", "field-ui-hidden", sizeClass].filter(Boolean).join(" ")}
        style={style}
        aria-hidden="true"
        data-option-key={name}
        title={`hidden (.ui visible=false): ${name}`}
      />
    );
  }
  const fieldClass = [
    "field",
    "block",
    sizeClass,
    external ? "external-label" : "",
    meta?.enabled === false || meta?.read_only ? "field-ui-disabled" : "",
    meta?.read_only ? "field-ui-readonly" : "",
  ]
    .filter(Boolean)
    .join(" ");

  const keyHint = showKeyHint ? <span className="muted option-key-hint"> {name}</span> : null;

  if (type === "bool") {
    return (
      <label className={`${fieldClass} check-field`} title={title} style={style}>
        <span className="check">
          <input
            type="checkbox"
            checked={isTruthy(value)}
            disabled={uiDisabled}
            onChange={(e) => onChange(e.target.checked ? "True" : "False")}
          />
          {label || keyHint ? (
            <span>
              {label}
              {keyHint}
            </span>
          ) : (
            <span className="sr-only">{name}</span>
          )}
        </span>
      </label>
    );
  }

  if (type === "enum" && meta?.choices?.length) {
    const choices = meta.choices;
    const known = choices.includes(value) ? value : choices[0] || value;
    return (
      <label className={fieldClass} title={title} style={style}>
        <span>
          {label}
          {keyHint}
        </span>
        <select
          value={known}
          disabled={uiDisabled}
          onChange={(e) => onChange(e.target.value)}
        >
          {!choices.includes(value) && value ? (
            <option value={value}>{value}</option>
          ) : null}
          {choices.map((c) => (
            <option key={c} value={c}>
              {c}
            </option>
          ))}
        </select>
      </label>
    );
  }

  if (type === "text") {
    return (
      <label className={fieldClass} title={title} style={style}>
        <span>
          {label}
          {keyHint}
        </span>
        <textarea
          rows={5}
          value={value}
          disabled={uiDisabled}
          onChange={(e) => onChange(e.target.value)}
        />
      </label>
    );
  }

  if (type === "int" || type === "number") {
    return (
      <label className={fieldClass} title={title} style={style}>
        <span>
          {label}
          {keyHint}
        </span>
        <input
          type="number"
          value={value}
          disabled={uiDisabled}
          onChange={(e) => onChange(e.target.value)}
        />
      </label>
    );
  }

  return (
    <label className={fieldClass} title={title} style={style}>
      <span>
        {label}
        {keyHint}
      </span>
      <input value={value} disabled={uiDisabled} onChange={(e) => onChange(e.target.value)} />
    </label>
  );
}
