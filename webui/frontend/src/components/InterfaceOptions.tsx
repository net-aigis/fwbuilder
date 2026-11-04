import { useEffect, useMemo, useState } from "react";
import {
  fetchInterfaceOptionSchema,
  fetchOptions,
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
  interfaceId: string;
  hostOs?: string;
  busy?: boolean;
  onBusy?: (b: boolean) => void;
  onStatus?: (s: string) => void;
  onError?: (e: string | null) => void;
};

type GroupSection = {
  id: string;
  title: string;
  keys: string[];
  flat?: boolean;
  checkable?: boolean;
  checked?: boolean;
  enabled?: boolean;
  stacked?: boolean;
  stack?: string;
  stack_index?: number;
  empty?: boolean;
};

type Group = {
  id: string;
  title: string;
  keys: string[];
  tooltip?: string;
  sections?: GroupSection[];
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
  if (low === "true" || low === "false") return { type: "bool" as const };
  return { type: "string" as const };
}

export function InterfaceOptions({
  sessionId,
  interfaceId,
  hostOs,
  busy,
  onBusy,
  onStatus,
  onError,
}: Props) {
  const [options, setOptions] = useState<Record<string, string>>({});
  const [fields, setFields] = useState<Record<string, OptionFieldMeta>>({});
  const [groups, setGroups] = useState<Group[]>([]);
  const [activeGroup, setActiveGroup] = useState("interface");
  const [activeStackIndex, setActiveStackIndex] = useState(0);
  const [showAllStacks, setShowAllStacks] = useState(false);
  const [previewDeviceType, setPreviewDeviceType] = useState("ethernet");
  const [stackSwitch, setStackSwitch] = useState<{
    stack: string;
    by_type: Record<string, number>;
    default?: number;
    preview_only?: boolean;
    note?: string;
  } | null>(null);
  const [resolvedOs, setResolvedOs] = useState(hostOs || "");
  const [layoutFidelity, setLayoutFidelity] = useState<string | null>(null);

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await fetchOptions(sessionId, interfaceId);
      const os = (hostOs || res.host_OS || resolvedOs || "").trim();
      setResolvedOs(os);
      let schema: Awaited<ReturnType<typeof fetchInterfaceOptionSchema>> | null = null;
      if (os) {
        schema = await fetchInterfaceOptionSchema(os).catch(() => null);
      }
      const defaults = schema?.defaults ?? {};
      const merged = { ...defaults, ...(res.options ?? {}) };
      setOptions(merged);
      setFields(schema?.fields ?? {});
      setStackSwitch(schema?.stack_switch ?? null);
      if (schema?.stack_switch?.by_type) {
        const types = Object.keys(schema.stack_switch.by_type);
        const def =
          types.find((t) => schema.stack_switch!.by_type[t] === (schema.stack_switch!.default ?? 0)) ||
          types[0] ||
          "ethernet";
        setPreviewDeviceType(def);
      } else {
        setPreviewDeviceType("ethernet");
      }
      const nextGroups = schema?.groups?.length
        ? schema.groups
        : Object.keys(merged).length
          ? [{ id: "interface", title: "Interface", keys: Object.keys(merged).sort() }]
          : [];
      setGroups(nextGroups);
      const score = schema?.layout_fidelity?.score_percent;
      setLayoutFidelity(
        score != null ? `${score}% .ui signals (not pixel parity)` : null,
      );
      let preferred = nextGroups[0]?.id || "interface";
      try {
        const stored = sessionStorage.getItem(`fwbweb.ifaceOptionGroup.${os || "unknown"}`);
        if (stored && nextGroups.some((g) => g.id === stored)) preferred = stored;
      } catch {
        /* ignore */
      }
      setActiveGroup(preferred);
      onStatus?.(
        `Interface options: ${Object.keys(merged).length}` +
          (schema ? ` · dialog fields ${schema.dialog_field_count ?? 0}` : "") +
          (os ? ` · ${os}` : ""),
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
  }, [sessionId, interfaceId, hostOs]);

  useEffect(() => {
    try {
      sessionStorage.setItem(
        `fwbweb.ifaceOptionGroup.${resolvedOs || "unknown"}`,
        activeGroup,
      );
    } catch {
      /* ignore */
    }
  }, [activeGroup, resolvedOs]);

  useEffect(() => {
    try {
      sessionStorage.setItem(
        `fwbweb.ifaceStackIndex.${resolvedOs || "unknown"}.${activeGroup}`,
        String(activeStackIndex),
      );
    } catch {
      /* ignore */
    }
  }, [activeStackIndex, activeGroup, resolvedOs]);

  async function save() {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await updateOptions(sessionId, interfaceId, options);
      setOptions((prev) => ({ ...prev, ...(res.options ?? {}) }));
      onStatus?.("Interface options saved");
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  const keys = useMemo(() => {
    const groupKeys = groups.find((g) => g.id === activeGroup)?.keys;
    if (groupKeys?.length) return groupKeys;
    return Object.keys(options).sort();
  }, [groups, activeGroup, options]);

  const activeGroupMeta = groups.find((g) => g.id === activeGroup) || null;

  const stackedPages = useMemo(() => {
    const secs = activeGroupMeta?.sections || [];
    return secs
      .filter((s) => s.stacked)
      .slice()
      .sort((a, b) => (a.stack_index ?? 0) - (b.stack_index ?? 0));
  }, [activeGroupMeta]);

  useEffect(() => {
    if (!stackedPages.length) return;
    let preferred = stackedPages[0]?.stack_index ?? 0;
    try {
      const stored = sessionStorage.getItem(
        `fwbweb.ifaceStackIndex.${resolvedOs || "unknown"}.${activeGroup}`,
      );
      if (stored != null) {
        const n = Number(stored);
        if (stackedPages.some((s) => s.stack_index === n)) preferred = n;
      }
    } catch {
      /* ignore */
    }
    setActiveStackIndex(preferred);
  }, [activeGroup, resolvedOs, stackedPages]);

  const optionSections = useMemo(() => {
    if (!activeGroupMeta?.sections?.length) {
      return [{ id: "all", title: "", keys }];
    }
    const keySet = new Set(keys);
    const out: GroupSection[] = [];
    for (const sec of activeGroupMeta.sections) {
      if (sec.stacked && !showAllStacks && sec.stack_index !== activeStackIndex) {
        continue;
      }
      const secKeys = sec.keys.filter((k) => keySet.has(k));
      if (secKeys.length || sec.empty) out.push({ ...sec, keys: secKeys });
    }
    return out.length ? out : [{ id: "all", title: "", keys }];
  }, [activeGroupMeta, keys, activeStackIndex, showAllStacks]);

  return (
    <div className="firewall-extras">
      <header className="panel-header">
        <h3>
          Interface options{resolvedOs ? ` · ${resolvedOs}` : ""}
          {layoutFidelity ? <span className="muted"> · fidelity {layoutFidelity}</span> : null}
        </h3>
        <div className="btn-row">
          <button type="button" className="ghost" disabled={busy} onClick={() => void reload()}>
            Reload
          </button>
          <button type="button" disabled={busy || !keys.length} onClick={() => void save()}>
            Save
          </button>
        </div>
      </header>
      {groups.length > 1 ? (
        <div className="dialog-pages pad" role="tablist" aria-label="Interface option pages">
          <button
            type="button"
            className="ghost"
            disabled={busy}
            title="Previous interface options page"
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
            title="Next interface options page"
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
      {stackSwitch?.by_type && Object.keys(stackSwitch.by_type).length ? (
        <div className="pad option-stack-device-type">
          <label className="muted" title={stackSwitch.note || "Desktop iface_type → stack (preview)"}>
            Device type (stack preview)
            <select
              value={previewDeviceType}
              disabled={busy}
              onChange={(e) => {
                const t = e.target.value;
                setPreviewDeviceType(t);
                setShowAllStacks(false);
                const idx = stackSwitch.by_type[t];
                if (idx != null) setActiveStackIndex(idx);
              }}
            >
              {Object.keys(stackSwitch.by_type).map((t) => (
                <option key={t} value={t}>
                  {t} → stack[{stackSwitch.by_type[t]}]
                </option>
              ))}
            </select>
          </label>
          {stackSwitch.preview_only ? (
            <span className="muted"> · preview only (does not write Interface type)</span>
          ) : null}
        </div>
      ) : null}
      {stackedPages.length > 1 ? (
        <div className="option-stack-pages pad" role="tablist" aria-label="QStackedWidget pages">
          {stackedPages.map((p) => (
            <button
              key={p.id}
              type="button"
              role="tab"
              aria-selected={!showAllStacks && p.stack_index === activeStackIndex}
              className={
                !showAllStacks && p.stack_index === activeStackIndex ? undefined : "ghost"
              }
              disabled={busy}
              title={
                p.empty
                  ? "Empty QStackedWidget page (desktop index 0)"
                  : `QStackedWidget page stack[${p.stack_index}]`
              }
              onClick={() => {
                setShowAllStacks(false);
                setActiveStackIndex(p.stack_index ?? 0);
              }}
            >
              {p.title}
              {p.empty ? " · empty" : ""}
            </button>
          ))}
          <button
            type="button"
            className={showAllStacks ? undefined : "ghost"}
            disabled={busy}
            title="Show all stacked pages (preview)"
            onClick={() => setShowAllStacks(true)}
          >
            All stacks
          </button>
        </div>
      ) : null}
      {keys.length || stackedPages.some((p) => p.empty) ? (
        optionSections.map((sec, secIdx) => {
          const pageSpacers = secIdx === 0 ? activeGroupMeta?.spacers || [] : [];
          const pageStretch = secIdx === 0 ? activeGroupMeta?.column_stretch || [] : [];
          const pageRowStretch = secIdx === 0 ? activeGroupMeta?.row_stretch || [] : [];
          const pageNotes = secIdx === 0 ? activeGroupMeta?.annotations || [] : [];
          const pageBuddyLabels = secIdx === 0 ? activeGroupMeta?.buddy_labels || [] : [];
          const pageSpacing = secIdx === 0 ? activeGroupMeta?.spacing || {} : {};
          const grid = qtGridStyle(
            sec.keys,
            fields,
            pageSpacers,
            pageStretch,
            [...pageNotes, ...pageBuddyLabels],
            pageSpacing,
            pageRowStretch,
          );
          return (
            <div
              key={sec.id || "all"}
              className={[
                "option-section",
                sec.flat ? "option-section-flat" : "",
                sec.checkable ? "option-section-checkable" : "",
                sec.enabled === false ? "option-section-disabled" : "",
                sec.stacked ? "option-section-stacked" : "",
                sec.empty ? "option-section-empty" : "",
              ]
                .filter(Boolean)
                .join(" ")}
              data-flat={sec.flat ? "1" : undefined}
              data-checkable={sec.checkable ? "1" : undefined}
              data-enabled={sec.enabled === false ? "0" : undefined}
              data-stacked={sec.stacked ? "1" : undefined}
              data-empty={sec.empty ? "1" : undefined}
              data-stack={sec.stack}
            >
              {sec.title ? (
                <h4 className="option-section-title">
                  {sec.checkable ? (
                    <span className="muted" title="QGroupBox checkable in .ui (display only)">
                      ☐{" "}
                    </span>
                  ) : null}
                  {sec.stacked ? (
                    <span className="muted" title="QStackedWidget page in .ui">
                      ▤{" "}
                    </span>
                  ) : null}
                  {sec.title}
                  {sec.flat ? <span className="muted"> · flat</span> : null}
                  {sec.empty ? <span className="muted"> · empty</span> : null}
                  {sec.stacked && sec.stack_index != null ? (
                    <span className="muted"> · stack[{sec.stack_index}]</span>
                  ) : null}
                </h4>
              ) : null}
              <div className={grid.className} style={grid.style}>
                {pageSpacers.map((sp, i) => (
                  <div
                    key={sp.name || `spacer-${i}`}
                    className="qt-spacer"
                    aria-hidden="true"
                    data-orientation={sp.orientation || undefined}
                    style={qtSpacerStyle(sp)}
                  />
                ))}
                {pageNotes.map((note, i) => (
                  <p
                    key={note.name || `note-${i}`}
                    className="qt-annotation muted"
                    style={{ ...qtSpacerStyle(note), ...qtAlignmentStyle(note.alignment) }}
                  >
                    {note.text}
                  </p>
                ))}
                {pageBuddyLabels.map((bl, i) => (
                  <p
                    key={bl.name || `buddy-${i}`}
                    className="qt-annotation qt-buddy-label muted"
                    data-buddy={bl.buddy}
                    style={{ ...qtSpacerStyle(bl), ...qtAlignmentStyle(bl.alignment) }}
                  >
                    {bl.text}
                  </p>
                ))}
                {sec.keys.map((key) => (
                  <OptionField
                    key={key}
                    name={key}
                    value={options[key] ?? ""}
                    meta={metaFor(key, options[key] ?? "", fields)}
                    disabled={busy}
                    onChange={(v) => setOptions((prev) => ({ ...prev, [key]: v }))}
                  />
                ))}
                {sec.empty && !sec.keys.length ? (
                  <p className="muted">
                    Empty QStackedWidget page (desktop uses this for plain ethernet).
                  </p>
                ) : null}
                {!sec.keys.length && !sec.empty ? (
                  <p className="muted">No keys in this group.</p>
                ) : null}
              </div>
            </div>
          );
        })
      ) : (
        <p className="muted pad">
          No InterfaceOptions schema for this OS
          {resolvedOs ? ` (${resolvedOs})` : ""}.
        </p>
      )}
    </div>
  );
}
