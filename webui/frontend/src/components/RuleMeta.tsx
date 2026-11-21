import { useEffect, useState } from "react";
import { searchObjects, updateRule, type AnyRule, type PolicyRule } from "../api/client";

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
  const [branchId, setBranchId] = useState(
    "branch_id" in rule ? String((rule as PolicyRule).branch_id ?? "") : "",
  );
  const [branchName, setBranchName] = useState(
    "branch_name" in rule ? String((rule as PolicyRule).branch_name ?? "") : "",
  );
  const [branchQ, setBranchQ] = useState("");
  const [branchHits, setBranchHits] = useState<
    { id: string; name: string; type: string }[]
  >([]);

  const showBranch =
    (rule.type === "PolicyRule" && rule.action === "Branch") ||
    (rule.type === "NATRule" && rule.action === "NATBranch");

  useEffect(() => {
    setComment(rule.comment ?? "");
    setGroup(rule.group ?? "");
    setDirection("direction" in rule ? String((rule as PolicyRule).direction ?? "") : "");
    setLogging("logging" in rule ? Boolean((rule as PolicyRule).logging) : false);
    setBranchId("branch_id" in rule ? String((rule as PolicyRule).branch_id ?? "") : "");
    setBranchName("branch_name" in rule ? String((rule as PolicyRule).branch_name ?? "") : "");
  }, [rule]);

  useEffect(() => {
    if (!showBranch || !branchQ.trim()) {
      setBranchHits([]);
      return;
    }
    let cancelled = false;
    void searchObjects(sessionId, branchQ)
      .then((res) => {
        if (cancelled) return;
        const want = rule.type === "NATRule" ? "NAT" : "Policy";
        setBranchHits(
          (res.results ?? []).filter((r) => r.type === want).map((r) => ({
            id: r.id,
            name: r.name,
            type: r.type,
          })),
        );
      })
      .catch(() => {
        if (!cancelled) setBranchHits([]);
      });
    return () => {
      cancelled = true;
    };
  }, [sessionId, branchQ, showBranch, rule.type]);

  async function save() {
    onBusy?.(true);
    onError?.(null);
    try {
      const body: {
        comment: string;
        group: string;
        direction?: string;
        logging?: boolean;
        branch_id?: string;
      } = { comment, group };
      if (rule.type === "PolicyRule") {
        body.direction = direction;
        body.logging = logging;
      }
      if (showBranch) body.branch_id = branchId;
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
        <h3>
          Rule meta
          <span className="muted">
            {" "}
            · #{rule.position} · {rule.id}
          </span>
        </h3>
        <div className="btn-row">
          <button
            type="button"
            className="ghost"
            disabled={busy}
            title="Copy rule id"
            onClick={() => {
              void navigator.clipboard?.writeText(rule.id).then(
                () => onStatus?.("Copied rule id"),
                () => onError?.("Clipboard write failed"),
              );
            }}
          >
            Copy id
          </button>
          <button type="button" disabled={busy} onClick={() => void save()}>
            Save meta
          </button>
        </div>
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
        {showBranch ? (
          <div className="field block">
            <span>Branch ruleset</span>
            <p className="muted">
              {branchId ? `${branchName || branchId} (${branchId})` : "None"}
            </p>
            <div className="btn-row">
              <button
                type="button"
                className="ghost"
                disabled={busy || !branchId}
                onClick={() => {
                  setBranchId("");
                  setBranchName("");
                }}
              >
                Clear
              </button>
            </div>
            <input
              placeholder="Search Policy/NAT ruleset…"
              value={branchQ}
              disabled={busy}
              onChange={(e) => setBranchQ(e.target.value)}
            />
            <ul className="picker-list">
              {branchHits.map((h) => (
                <li key={h.id}>
                  <button
                    type="button"
                    className="tree-item"
                    disabled={busy}
                    onClick={() => {
                      setBranchId(h.id);
                      setBranchName(h.name);
                      setBranchQ("");
                      setBranchHits([]);
                    }}
                  >
                    <span className="tree-type">{h.type}</span>
                    <span className="tree-name">{h.name}</span>
                  </button>
                </li>
              ))}
            </ul>
          </div>
        ) : null}
      </div>
    </div>
  );
}
