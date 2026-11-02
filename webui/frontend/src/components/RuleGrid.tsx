import {
  formatRuleObjects,
  type AnyRule,
  type NatRule,
  type PolicyRule,
  type RoutingRuleRow,
  type RuleElement,
} from "../api/client";

type Props = {
  rules: AnyRule[];
  kind: "policy" | "nat" | "routing";
  busy?: boolean;
  onToggleDisabled?: (rule: AnyRule) => void;
  onChangeAction?: (rule: PolicyRule | NatRule, action: string) => void;
  onChangeMetric?: (rule: RoutingRuleRow, metric: number) => void;
  onSelectRule?: (rule: AnyRule) => void;
  onEditCell?: (rule: AnyRule, element: string) => void;
  onDropObject?: (rule: AnyRule, element: string, objectId: string) => void;
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

const NAT_ACTIONS = ["Translate", "NATBranch"];

function Cell({
  rule,
  element,
  el,
  busy,
  onEditCell,
  onDropObject,
}: {
  rule: AnyRule;
  element: string;
  el?: RuleElement;
  busy?: boolean;
  onEditCell?: (rule: AnyRule, element: string) => void;
  onDropObject?: (rule: AnyRule, element: string, objectId: string) => void;
}) {
  return (
    <td
      className="rule-cell"
      title="Click to pick · drop object from tree"
      onClick={(e) => {
        e.stopPropagation();
        onEditCell?.(rule, element);
      }}
      onDragOver={(e) => {
        e.preventDefault();
        e.dataTransfer.dropEffect = "copy";
      }}
      onDrop={(e) => {
        e.preventDefault();
        e.stopPropagation();
        const objectId = e.dataTransfer.getData("application/x-fwb-object-id");
        if (objectId) onDropObject?.(rule, element, objectId);
      }}
    >
      <button type="button" className="cell-btn" disabled={busy}>
        {formatRuleObjects(el)}
      </button>
    </td>
  );
}

export function RuleGrid({
  rules,
  kind,
  busy,
  onToggleDisabled,
  onChangeAction,
  onChangeMetric,
  onSelectRule,
  onEditCell,
  onDropObject,
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
              <th>When</th>
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
                <Cell rule={r} element="src" el={r.src} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
                <Cell rule={r} element="dst" el={r.dst} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
                <Cell rule={r} element="srv" el={r.srv} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
                <Cell rule={r} element="itf" el={r.itf} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
                <Cell rule={r} element="when" el={r.when} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
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
                <td>
                  <select
                    value={r.action}
                    disabled={busy}
                    onChange={(e) => onChangeAction?.(r, e.target.value)}
                    onClick={(e) => e.stopPropagation()}
                  >
                    {NAT_ACTIONS.map((a) => (
                      <option key={a} value={a}>
                        {a}
                      </option>
                    ))}
                    {!NAT_ACTIONS.includes(r.action) ? (
                      <option value={r.action}>{r.action}</option>
                    ) : null}
                  </select>
                </td>
                <Cell rule={r} element="osrc" el={r.osrc} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
                <Cell rule={r} element="odst" el={r.odst} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
                <Cell rule={r} element="osrv" el={r.osrv} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
                <Cell rule={r} element="tsrc" el={r.tsrc} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
                <Cell rule={r} element="tdst" el={r.tdst} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
                <Cell rule={r} element="tsrv" el={r.tsrv} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
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
              <td>
                <input
                  type="number"
                  className="metric-input"
                  defaultValue={r.metric}
                  key={`${r.id}-${r.metric}`}
                  disabled={busy}
                  onClick={(e) => e.stopPropagation()}
                  onBlur={(e) =>
                    onChangeMetric?.(r, Number(e.target.value || 0))
                  }
                />
              </td>
              <Cell rule={r} element="rdst" el={r.rdst} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
              <Cell rule={r} element="rgtw" el={r.rgtw} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
              <Cell rule={r} element="ritf" el={r.ritf} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} />
              <td className="comment-cell">{r.comment}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
