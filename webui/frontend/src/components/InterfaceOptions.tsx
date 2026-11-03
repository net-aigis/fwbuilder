import { useEffect, useMemo, useState } from "react";
import {
  fetchInterfaceOptionSchema,
  fetchOptions,
  updateOptions,
  type OptionFieldMeta,
} from "../api/client";
import { OptionField } from "./OptionField";
import {
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

type Group = {
  id: string;
  title: string;
  keys: string[];
  spacers?: QtGridSpacer[];
  column_stretch?: number[];
  annotations?: QtGridAnnotation[];
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
  const [resolvedOs, setResolvedOs] = useState(hostOs || "");

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
      const nextGroups = schema?.groups?.length
        ? schema.groups
        : Object.keys(merged).length
          ? [{ id: "interface", title: "Interface", keys: Object.keys(merged).sort() }]
          : [];
      setGroups(nextGroups);
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

  return (
    <div className="firewall-extras">
      <header className="panel-header">
        <h3>Interface options{resolvedOs ? ` · ${resolvedOs}` : ""}</h3>
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
      {keys.length ? (
        (() => {
          const page = groups.find((g) => g.id === activeGroup);
          const spacers = page?.spacers || [];
          const stretch = page?.column_stretch || [];
          const notes = page?.annotations || [];
          const spacing = page?.spacing || {};
          const grid = qtGridStyle(keys, fields, spacers, stretch, notes, spacing);
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
                  style={qtSpacerStyle(note)}
                >
                  {note.text}
                </p>
              ))}
              {keys.map((key) => (
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
        <p className="muted pad">
          No InterfaceOptions schema for this OS
          {resolvedOs ? ` (${resolvedOs})` : ""}.
        </p>
      )}
    </div>
  );
}
