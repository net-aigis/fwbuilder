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
  onJumpObject?: (objectId: string) => void;
  onToggleLogging?: (rule: AnyRule) => void;
  onCycleDirection?: (rule: AnyRule) => void;
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

function withGroupHeaders(rules: AnyRule[]): Array<{ kind: "group"; name: string } | { kind: "rule"; rule: AnyRule }> {
  const out: Array<{ kind: "group"; name: string } | { kind: "rule"; rule: AnyRule }> = [];
  let prev = "\0";
  for (const r of rules) {
    const g = (r.group ?? "").trim();
    if (g && g !== prev) {
      out.push({ kind: "group", name: g });
      prev = g;
    } else if (!g) {
      prev = "";
    }
    out.push({ kind: "rule", rule: r });
  }
  return out;
}

function Cell({
  rule,
  element,
  el,
  busy,
  onEditCell,
  onDropObject,
  onJumpObject,
}: {
  rule: AnyRule;
  element: string;
  el?: RuleElement;
  busy?: boolean;
  onEditCell?: (rule: AnyRule, element: string) => void;
  onDropObject?: (rule: AnyRule, element: string, objectId: string) => void;
  onJumpObject?: (objectId: string) => void;
}) {
  return (
    <td
      className="rule-cell"
      title="Click to pick · Ctrl+click to open object · drop from tree"
      onClick={(e) => {
        e.stopPropagation();
        if ((e.ctrlKey || e.metaKey) && onJumpObject && el?.objects?.length) {
          onJumpObject(el.objects[0].id);
          return;
        }
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
  onJumpObject,
  onToggleLogging,
  onCycleDirection,
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
            {withGroupHeaders(rules).map((row) =>
              row.kind === "group" ? (
                <tr key={`g-${row.name}`} className="rule-group-row">
                  <td colSpan={11}>{row.name}</td>
                </tr>
              ) : (
                <tr
                  key={row.rule.id}
                  className={selectedId === row.rule.id ? "selected" : undefined}
                  onClick={() => onSelectRule?.(row.rule)}
                >
                  <td>{row.rule.position}</td>
                  <td>
                    <input
                      type="checkbox"
                      checked={!row.rule.disabled}
                      disabled={busy}
                      onChange={() => onToggleDisabled?.(row.rule)}
                      onClick={(e) => e.stopPropagation()}
                    />
                  </td>
                  <td>
                    <select
                      value={(row.rule as PolicyRule).action}
                      disabled={busy}
                      onChange={(e) => onChangeAction?.(row.rule as PolicyRule, e.target.value)}
                      onClick={(e) => e.stopPropagation()}
                    >
                      {POLICY_ACTIONS.map((a) => (
                        <option key={a} value={a}>
                          {a}
                        </option>
                      ))}
                      {!POLICY_ACTIONS.includes((row.rule as PolicyRule).action) ? (
                        <option value={(row.rule as PolicyRule).action}>
                          {(row.rule as PolicyRule).action}
                        </option>
                      ) : null}
                    </select>
                  </td>
                  <Cell rule={row.rule} element="src" el={(row.rule as PolicyRule).src} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                  <Cell rule={row.rule} element="dst" el={(row.rule as PolicyRule).dst} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                  <Cell rule={row.rule} element="srv" el={(row.rule as PolicyRule).srv} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                  <Cell rule={row.rule} element="itf" el={(row.rule as PolicyRule).itf} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                  <Cell rule={row.rule} element="when" el={(row.rule as PolicyRule).when} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                  <td>
                    <button
                      type="button"
                      className="cell-btn"
                      disabled={busy}
                      title="Click to cycle direction (or press G)"
                      onClick={(e) => {
                        e.stopPropagation();
                        onCycleDirection?.(row.rule);
                      }}
                    >
                      {(row.rule as PolicyRule).direction}
                    </button>
                  </td>
                  <td>
                    <button
                      type="button"
                      className="cell-btn"
                      disabled={busy}
                      title="Click to toggle logging (or press L)"
                      onClick={(e) => {
                        e.stopPropagation();
                        onToggleLogging?.(row.rule);
                      }}
                    >
                      {(row.rule as PolicyRule).logging ? "✓" : "·"}
                    </button>
                  </td>
                  <td className="comment-cell">{row.rule.comment}</td>
                </tr>
              ),
            )}
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
                <Cell rule={r} element="osrc" el={r.osrc} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                <Cell rule={r} element="odst" el={r.odst} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                <Cell rule={r} element="osrv" el={r.osrv} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                <Cell rule={r} element="tsrc" el={r.tsrc} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                <Cell rule={r} element="tdst" el={r.tdst} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
                <Cell rule={r} element="tsrv" el={r.tsrv} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
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
              <Cell rule={r} element="rdst" el={r.rdst} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
              <Cell rule={r} element="rgtw" el={r.rgtw} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
              <Cell rule={r} element="ritf" el={r.ritf} busy={busy} onEditCell={onEditCell} onDropObject={onDropObject} onJumpObject={onJumpObject} />
              <td className="comment-cell">{r.comment}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
