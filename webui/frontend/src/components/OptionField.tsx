type FieldMeta = {
  type?: string;
  choices?: string[];
  label?: string;
  widget?: string;
  widget_class?: string;
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

export function OptionField({ name, value, meta, disabled, onChange }: Props) {
  const type = meta?.type || "string";
  const label = (meta?.label || "").trim() || name;
  const showKeyHint = Boolean(meta?.label && meta.label.trim() && meta.label.trim() !== name);

  if (type === "bool") {
    return (
      <label className="field block check-field" title={showKeyHint ? name : undefined}>
        <span className="check">
          <input
            type="checkbox"
            checked={isTruthy(value)}
            disabled={disabled}
            onChange={(e) => onChange(e.target.checked ? "True" : "False")}
          />
          {label}
        </span>
      </label>
    );
  }

  if (type === "enum" && meta?.choices?.length) {
    const choices = meta.choices;
    const known = choices.includes(value) ? value : choices[0] || value;
    return (
      <label className="field block" title={showKeyHint ? name : undefined}>
        {label}
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
      <label className="field block" title={showKeyHint ? name : undefined}>
        {label}
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
      <label className="field block" title={showKeyHint ? name : undefined}>
        {label}
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
    <label className="field block" title={showKeyHint ? name : undefined}>
      {label}
      <input value={value} disabled={disabled} onChange={(e) => onChange(e.target.value)} />
    </label>
  );
}
