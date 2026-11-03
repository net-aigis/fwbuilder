import type { CSSProperties } from "react";

type FieldMeta = {
  type?: string;
  choices?: string[];
  label?: string;
  tooltip?: string;
  widget?: string;
  widget_class?: string;
  grid?: { row?: number; column?: number; rowspan?: number; colspan?: number };
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

function gridStyle(meta?: FieldMeta): CSSProperties | undefined {
  const g = meta?.grid;
  if (!g || g.row == null || g.column == null) return undefined;
  const style: CSSProperties = {
    gridRow: g.rowspan && g.rowspan > 1 ? `${g.row + 1} / span ${g.rowspan}` : g.row + 1,
    gridColumn:
      g.colspan && g.colspan > 1 ? `${g.column + 1} / span ${g.colspan}` : g.column + 1,
  };
  return style;
}

export function OptionField({ name, value, meta, disabled, onChange }: Props) {
  const type = meta?.type || "string";
  const label = (meta?.label || "").trim() || name;
  const showKeyHint = Boolean(meta?.label && meta.label.trim() && meta.label.trim() !== name);
  const tip = (meta?.tooltip || "").trim();
  const title = tip || (showKeyHint ? name : undefined);
  const style = gridStyle(meta);

  const keyHint = showKeyHint ? <span className="muted option-key-hint"> {name}</span> : null;

  if (type === "bool") {
    return (
      <label className="field block check-field" title={title} style={style}>
        <span className="check">
          <input
            type="checkbox"
            checked={isTruthy(value)}
            disabled={disabled}
            onChange={(e) => onChange(e.target.checked ? "True" : "False")}
          />
          <span>
            {label}
            {keyHint}
          </span>
        </span>
      </label>
    );
  }

  if (type === "enum" && meta?.choices?.length) {
    const choices = meta.choices;
    const known = choices.includes(value) ? value : choices[0] || value;
    return (
      <label className="field block" title={title} style={style}>
        <span>
          {label}
          {keyHint}
        </span>
        <select
          value={known}
          disabled={disabled}
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
      <label className="field block" title={title} style={style}>
        <span>
          {label}
          {keyHint}
        </span>
        <textarea
          rows={5}
          value={value}
          disabled={disabled}
          onChange={(e) => onChange(e.target.value)}
        />
      </label>
    );
  }

  if (type === "int" || type === "number") {
    return (
      <label className="field block" title={title} style={style}>
        <span>
          {label}
          {keyHint}
        </span>
        <input
          type="number"
          value={value}
          disabled={disabled}
          onChange={(e) => onChange(e.target.value)}
        />
      </label>
    );
  }

  return (
    <label className="field block" title={title} style={style}>
      <span>
        {label}
        {keyHint}
      </span>
      <input value={value} disabled={disabled} onChange={(e) => onChange(e.target.value)} />
    </label>
  );
}
