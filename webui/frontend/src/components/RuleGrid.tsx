import {
  formatRuleObjects,
  type AnyRule,
  type NatRule,
  type PolicyRule,
  type RoutingRuleRow,
} from "../api/client";

type Props = {
  rules: AnyRule[];
  kind: "policy" | "nat" | "routing";
  busy?: boolean;
  onToggleDisabled?: (rule: AnyRule) => void;
  onChangeAction?: (rule: PolicyRule, action: string) => void;
  onSelectRule?: (rule: AnyRule) => void;
  selectedId?: string;
};

const POLICY_ACTIONS = [
  "Accept",
  "Deny",
  "Reject",
  "Accounting",
  "Modify",
  "Branch",
  "Pipe",
  "Custom",
];

export function RuleGrid({
  rules,
  kind,
  busy,
  onToggleDisabled,
  onChangeAction,
  onSelectRule,
  selectedId,
}: Props) {
  if (!rules.length) {
    return <p className="muted pad">No rules in this ruleset.</p>;
  }

  if (kind === "policy") {
    return (
      <div className="rule-table-wrap">
        <table className="rule-table">
          <thead>
            <tr>
              <th>#</th>
              <th>On</th>
              <th>Action</th>
              <th>Src</th>
              <th>Dst</th>
              <th>Srv</th>
              <th>Itf</th>
              <th>Dir</th>
              <th>Log</th>
              <th>Comment</th>
            </tr>
          </thead>
          <tbody>
            {(rules as PolicyRule[]).map((r) => (
              <tr
                key={r.id}
                className={selectedId === r.id ? "selected" : undefined}
                onClick={() => onSelectRule?.(r)}
              >
                <td>{r.position}</td>
                <td>
                  <input
                    type="checkbox"
                    checked={!r.disabled}
                    disabled={busy}
                    onChange={() => onToggleDisabled?.(r)}
                    onClick={(e) => e.stopPropagation()}
                  />
                </td>
                <td>
                  <select
                    value={r.action}
                    disabled={busy}
                    onChange={(e) => onChangeAction?.(r, e.target.value)}
                    onClick={(e) => e.stopPropagation()}
                  >
                    {POLICY_ACTIONS.map((a) => (
                      <option key={a} value={a}>
                        {a}
                      </option>
                    ))}
                    {!POLICY_ACTIONS.includes(r.action) ? (
                      <option value={r.action}>{r.action}</option>
                    ) : null}
                  </select>
                </td>
                <td>{formatRuleObjects(r.src)}</td>
                <td>{formatRuleObjects(r.dst)}</td>
                <td>{formatRuleObjects(r.srv)}</td>
                <td>{formatRuleObjects(r.itf)}</td>
                <td>{r.direction}</td>
                <td>{r.logging ? "✓" : ""}</td>
                <td className="comment-cell">{r.comment}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    );
  }

  if (kind === "nat") {
    return (
      <div className="rule-table-wrap">
        <table className="rule-table">
          <thead>
            <tr>
              <th>#</th>
              <th>On</th>
              <th>Action</th>
              <th>OSrc</th>
              <th>ODst</th>
              <th>OSrv</th>
              <th>TSrc</th>
              <th>TDst</th>
              <th>TSrv</th>
              <th>Comment</th>
            </tr>
          </thead>
          <tbody>
            {(rules as NatRule[]).map((r) => (
              <tr
                key={r.id}
                className={selectedId === r.id ? "selected" : undefined}
                onClick={() => onSelectRule?.(r)}
              >
                <td>{r.position}</td>
                <td>
                  <input
                    type="checkbox"
                    checked={!r.disabled}
                    disabled={busy}
                    onChange={() => onToggleDisabled?.(r)}
                    onClick={(e) => e.stopPropagation()}
                  />
                </td>
                <td>{r.action}</td>
                <td>{formatRuleObjects(r.osrc)}</td>
                <td>{formatRuleObjects(r.odst)}</td>
                <td>{formatRuleObjects(r.osrv)}</td>
                <td>{formatRuleObjects(r.tsrc)}</td>
                <td>{formatRuleObjects(r.tdst)}</td>
                <td>{formatRuleObjects(r.tsrv)}</td>
                <td className="comment-cell">{r.comment}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    );
  }

  return (
    <div className="rule-table-wrap">
      <table className="rule-table">
        <thead>
          <tr>
            <th>#</th>
            <th>On</th>
            <th>Metric</th>
            <th>Dst</th>
            <th>Gateway</th>
            <th>Itf</th>
            <th>Comment</th>
          </tr>
        </thead>
        <tbody>
          {(rules as RoutingRuleRow[]).map((r) => (
            <tr
              key={r.id}
              className={selectedId === r.id ? "selected" : undefined}
              onClick={() => onSelectRule?.(r)}
            >
              <td>{r.position}</td>
              <td>
                <input
                  type="checkbox"
                  checked={!r.disabled}
                  disabled={busy}
                  onChange={() => onToggleDisabled?.(r)}
                  onClick={(e) => e.stopPropagation()}
                />
              </td>
              <td>{r.metric}</td>
              <td>{formatRuleObjects(r.rdst)}</td>
              <td>{formatRuleObjects(r.rgtw)}</td>
              <td>{formatRuleObjects(r.ritf)}</td>
              <td className="comment-cell">{r.comment}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
