import { useEffect, useState } from "react";
import { updateRule, type AnyRule, type PolicyRule } from "../api/client";

type Props = {
  sessionId: string;
  rule: AnyRule;
  busy?: boolean;
  onBusy?: (b: boolean) => void;
  onStatus?: (s: string) => void;
  onError?: (e: string | null) => void;
  onSaved?: () => void;
};

export function RuleMeta({
  sessionId,
  rule,
  busy,
  onBusy,
  onStatus,
  onError,
  onSaved,
}: Props) {
  const [comment, setComment] = useState(rule.comment ?? "");
  const [group, setGroup] = useState(rule.group ?? "");
  const [direction, setDirection] = useState(
    "direction" in rule ? String((rule as PolicyRule).direction ?? "") : "",
  );
  const [logging, setLogging] = useState(
    "logging" in rule ? Boolean((rule as PolicyRule).logging) : false,
  );

  useEffect(() => {
    setComment(rule.comment ?? "");
    setGroup(rule.group ?? "");
    setDirection("direction" in rule ? String((rule as PolicyRule).direction ?? "") : "");
    setLogging("logging" in rule ? Boolean((rule as PolicyRule).logging) : false);
  }, [rule]);

  async function save() {
    onBusy?.(true);
    onError?.(null);
    try {
      const body: {
        comment: string;
        group: string;
        direction?: string;
        logging?: boolean;
      } = { comment, group };
      if (rule.type === "PolicyRule") {
        body.direction = direction;
        body.logging = logging;
      }
      await updateRule(sessionId, rule.id, body);
      onStatus?.("Rule meta saved");
      onSaved?.();
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  return (
    <div className="rule-options">
      <header className="panel-header">
        <h3>Rule meta</h3>
        <button type="button" disabled={busy} onClick={() => void save()}>
          Save meta
        </button>
      </header>
      <div className="typed-grid pad">
        <label className="field block">
          Group
          <input value={group} disabled={busy} onChange={(e) => setGroup(e.target.value)} />
        </label>
        <label className="field block">
          Comment
          <textarea value={comment} disabled={busy} onChange={(e) => setComment(e.target.value)} rows={2} />
        </label>
        {rule.type === "PolicyRule" ? (
          <>
            <label className="field block">
              Direction
              <select
                value={direction}
                disabled={busy}
                onChange={(e) => setDirection(e.target.value)}
              >
                <option value="Both">Both</option>
                <option value="Inbound">Inbound</option>
                <option value="Outbound">Outbound</option>
              </select>
            </label>
            <label className="field block">
              <input
                type="checkbox"
                checked={logging}
                disabled={busy}
                onChange={(e) => setLogging(e.target.checked)}
              />{" "}
              Logging
            </label>
          </>
        ) : null}
      </div>
    </div>
  );
}
