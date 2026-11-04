import { useEffect, useMemo, useState } from "react";
import {
  fetchOptions,
  fetchRuleOptionSchema,
  updateOptions,
  type OptionFieldMeta,
} from "../api/client";
import { OptionField } from "./OptionField";
import {
  qtAlignmentStyle,
  qtGridStyle,
  qtSpacerStyle,
  type QtGridAnnotation,
  type QtGridSpacing,
  type QtGridSpacer,
} from "../qtGrid";

type Props = {
  sessionId: string;
  ruleId: string;
  ruleKind?: "policy" | "nat" | "routing";
  busy?: boolean;
  onBusy?: (busy: boolean) => void;
  onStatus?: (msg: string) => void;
  onError?: (msg: string | null) => void;
};

type Group = {
  id: string;
  title: string;
  keys: string[];
  tooltip?: string;
  spacers?: QtGridSpacer[];
  column_stretch?: number[];
  row_stretch?: number[];
  annotations?: QtGridAnnotation[];
  buddy_labels?: QtGridAnnotation[];
  spacing?: QtGridSpacing;
};

function metaFor(key: string, value: string, fields: Record<string, OptionFieldMeta>) {
  if (fields[key]) return fields[key];
  const low = value.trim().toLowerCase();
  if (low === "true" || low === "false") return { type: "bool" };
  if (key.includes("script") || key.includes("command")) return { type: "text" };
  return { type: "string" };
}

export function RuleOptions({
  sessionId,
  ruleId,
  ruleKind = "policy",
  busy,
  onBusy,
  onStatus,
  onError,
}: Props) {
  const [options, setOptions] = useState<Record<string, string>>({});
  const [fields, setFields] = useState<Record<string, OptionFieldMeta>>({});
  const [groups, setGroups] = useState<Group[]>([]);
  const [activeGroup, setActiveGroup] = useState("rule");
  const [showAll, setShowAll] = useState(false);
  const [layoutFidelity, setLayoutFidelity] = useState<string | null>(null);

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const [res, schema] = await Promise.all([
        fetchOptions(sessionId, ruleId),
        fetchRuleOptionSchema(ruleKind).catch(() => null),
      ]);
      const stored = res.options ?? {};
      setOptions(stored);
      setFields(schema?.fields ?? {});
      const nextGroups = schema?.groups?.length
        ? schema.groups
        : Object.keys(stored).length
          ? [{ id: "rule", title: "Rule options", keys: Object.keys(stored).sort() }]
          : [];
      setGroups(nextGroups);
      if (nextGroups[0]?.id) setActiveGroup(nextGroups[0].id);
      const lf = schema?.layout_fidelity;
      const score = lf?.score_percent;
      if (score != null) {
        const bits = [
          lf?.stacked_sections ? `stacked×${lf.stacked_sections}` : "",
          lf?.with_visible ? `visible×${lf.with_visible}` : "",
          lf?.layout_tree_max_depth ? `layout_tree≤${lf.layout_tree_max_depth}` : "",
          lf?.signal_key_count ? `keys×${lf.signal_key_count}` : "",
        ].filter(Boolean);
        setLayoutFidelity(
          `${score}% .ui signals` +
            (bits.length ? ` (${bits.join("; ")})` : "") +
            " (not pixel parity)",
        );
      } else {
        setLayoutFidelity(null);
      }
      onStatus?.(
        `Rule options: ${Object.keys(stored).length}` +
          (schema ? ` · dialog fields ${schema.dialog_field_count ?? 0}` : ""),
      );
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  useEffect(() => {
    void reload();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionId, ruleId, ruleKind]);

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

  const keys = useMemo(() => {
    if (showAll) return Object.keys(options).sort();
    const groupKeys = groups.find((g) => g.id === activeGroup)?.keys;
    if (groupKeys?.length) {
      const preferred = groupKeys.filter((k) => k in options);
      return preferred.length ? preferred : groupKeys;
    }
    return Object.keys(options).sort();
  }, [groups, activeGroup, options, showAll]);

  return (
    <div className="rule-options">
      <header className="panel-header">
        <h3>
          Rule options · {ruleKind}
          {layoutFidelity ? <span className="muted"> · fidelity {layoutFidelity}</span> : null}
        </h3>
        <div className="btn-row">
          <button type="button" className="ghost" disabled={busy} onClick={() => setShowAll((v) => !v)}>
            {showAll ? "Grouped" : "All stored"}
          </button>
          <button type="button" className="ghost" disabled={busy} onClick={() => void reload()}>
            Reload
          </button>
          <button type="button" disabled={busy || !Object.keys(options).length} onClick={() => void save()}>
            Save
          </button>
        </div>
      </header>
      {!showAll && groups.length > 1 ? (
        <div className="dialog-pages pad" role="tablist" aria-label="Rule option pages">
          <button
            type="button"
            className="ghost"
            disabled={busy}
            title="Previous rule options page"
            onClick={() => {
              const idx = Math.max(0, groups.findIndex((g) => g.id === activeGroup));
              const next = groups[(idx - 1 + groups.length) % groups.length];
              if (next) setActiveGroup(next.id);
            }}
          >
            ←
          </button>
          {groups.map((g) => (
            <button
              key={g.id}
              type="button"
              role="tab"
              aria-selected={g.id === activeGroup}
              className={g.id === activeGroup ? undefined : "ghost"}
              disabled={busy}
              title={g.tooltip || undefined}
              onClick={() => setActiveGroup(g.id)}
            >
              {g.title}
            </button>
          ))}
          <button
            type="button"
            className="ghost"
            disabled={busy}
            title="Next rule options page"
            onClick={() => {
              const idx = Math.max(0, groups.findIndex((g) => g.id === activeGroup));
              const next = groups[(idx + 1) % groups.length];
              if (next) setActiveGroup(next.id);
            }}
          >
            →
          </button>
        </div>
      ) : null}
      {keys.length || Object.keys(options).length ? (
        (() => {
          const shown = keys.length ? keys : Object.keys(options).sort();
          const page = groups.find((g) => g.id === activeGroup);
          const spacers = (!showAll && page?.spacers) || [];
          const stretch = (!showAll && page?.column_stretch) || [];
          const rowStretch = (!showAll && page?.row_stretch) || [];
          const notes = (!showAll && page?.annotations) || [];
          const buddyLabels = (!showAll && page?.buddy_labels) || [];
          const spacing = (!showAll && page?.spacing) || {};
          const grid = qtGridStyle(
            shown,
            fields,
            spacers,
            stretch,
            [...notes, ...buddyLabels],
            spacing,
            rowStretch,
          );
          return (
            <div className={grid.className} style={grid.style}>
              {spacers.map((sp, i) => (
                <div
                  key={sp.name || `spacer-${i}`}
                  className="qt-spacer"
                  aria-hidden="true"
                  data-orientation={sp.orientation || undefined}
                  style={qtSpacerStyle(sp)}
                />
              ))}
              {notes.map((note, i) => (
                <p
                  key={note.name || `note-${i}`}
                  className="qt-annotation muted"
                  style={{ ...qtSpacerStyle(note), ...qtAlignmentStyle(note.alignment) }}
                >
                  {note.text}
                </p>
              ))}
              {buddyLabels.map((bl, i) => (
                <p
                  key={bl.name || `buddy-${i}`}
                  className="qt-annotation qt-buddy-label muted"
                  data-buddy={bl.buddy}
                  style={{ ...qtSpacerStyle(bl), ...qtAlignmentStyle(bl.alignment) }}
                >
                  {bl.text}
                </p>
              ))}
              {shown.map((key) => (
                <OptionField
                  key={key}
                  name={key}
                  value={options[key] ?? ""}
                  meta={metaFor(key, options[key] ?? "", fields)}
                  disabled={busy}
                  onChange={(v) => setOptions((prev) => ({ ...prev, [key]: v }))}
                />
              ))}
            </div>
          );
        })()
      ) : (
        <p className="muted pad">No rule options on this rule (or unsupported rule type).</p>
      )}
    </div>
  );
}
