import { useEffect, useState } from "react";
import { fetchOptions, updateOptions } from "../api/client";
import { OptionField } from "./OptionField";

type Props = {
  sessionId: string;
  ruleId: string;
  busy?: boolean;
  onBusy?: (busy: boolean) => void;
  onStatus?: (msg: string) => void;
  onError?: (msg: string | null) => void;
};

function metaFor(key: string, value: string) {
  const low = value.trim().toLowerCase();
  if (low === "true" || low === "false") return { type: "bool" };
  if (key.includes("script") || key.includes("command")) return { type: "text" };
  return { type: "string" };
}

export function RuleOptions({ sessionId, ruleId, busy, onBusy, onStatus, onError }: Props) {
  const [options, setOptions] = useState<Record<string, string>>({});

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await fetchOptions(sessionId, ruleId);
      setOptions(res.options ?? {});
      onStatus?.(`Rule options: ${Object.keys(res.options ?? {}).length}`);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  useEffect(() => {
    void reload();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionId, ruleId]);

  async function save() {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await updateOptions(sessionId, ruleId, options);
      setOptions(res.options ?? options);
      onStatus?.("Rule options saved");
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  const keys = Object.keys(options).sort();

  return (
    <div className="rule-options">
      <header className="panel-header">
        <h3>Rule options</h3>
        <div className="btn-row">
          <button type="button" className="ghost" disabled={busy} onClick={() => void reload()}>
            Reload
          </button>
          <button type="button" disabled={busy || !keys.length} onClick={() => void save()}>
            Save
          </button>
        </div>
      </header>
      {keys.length ? (
        <div className="typed-grid options-grid">
          {keys.map((key) => (
            <OptionField
              key={key}
              name={key}
              value={options[key] ?? ""}
              meta={metaFor(key, options[key] ?? "")}
              disabled={busy}
              onChange={(v) => setOptions((prev) => ({ ...prev, [key]: v }))}
            />
          ))}
        </div>
      ) : (
        <p className="muted pad">No PolicyRuleOptions on this rule (or unsupported rule type).</p>
      )}
    </div>
  );
}
