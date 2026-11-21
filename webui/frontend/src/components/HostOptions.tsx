import { useEffect, useState } from "react";
import { fetchManagement, fetchOptions, updateManagement, updateOptions } from "../api/client";
import { OptionField } from "./OptionField";

type Props = {
  sessionId: string;
  hostId: string;
  busy?: boolean;
  onBusy?: (b: boolean) => void;
  onStatus?: (s: string) => void;
  onError?: (e: string | null) => void;
};

function metaFor(value: string) {
  const low = value.trim().toLowerCase();
  if (low === "true" || low === "false") return { type: "bool" as const };
  return { type: "string" as const };
}

export function HostOptions({ sessionId, hostId, busy, onBusy, onStatus, onError }: Props) {
  const [options, setOptions] = useState<Record<string, string>>({});
  const [mgmtAddr, setMgmtAddr] = useState("");
  const [filter, setFilter] = useState("");

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const [o, m] = await Promise.all([
        fetchOptions(sessionId, hostId),
        fetchManagement(sessionId, hostId).catch(() => null),
      ]);
      setOptions(o.options ?? {});
      setMgmtAddr(m?.management?.address ?? "");
      onStatus?.(`Host options: ${Object.keys(o.options ?? {}).length}`);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  useEffect(() => {
    void reload();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionId, hostId]);

  async function saveOptions() {
    onBusy?.(true);
    onError?.(null);
    try {
      const res = await updateOptions(sessionId, hostId, options);
      setOptions(res.options ?? options);
      onStatus?.("Host options saved");
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  async function saveManagement() {
    onBusy?.(true);
    onError?.(null);
    try {
      await updateManagement(sessionId, hostId, { address: mgmtAddr });
      onStatus?.(`Management address → ${mgmtAddr}`);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  const keys = Object.keys(options)
    .sort()
    .filter((k) => {
      const q = filter.trim().toLowerCase();
      if (!q) return true;
      return k.toLowerCase().includes(q) || (options[k] || "").toLowerCase().includes(q);
    });
  return (
    <div className="firewall-extras">
      <header className="panel-header">
        <h3>Host options</h3>
        <div className="btn-row">
          <button type="button" className="ghost" disabled={busy} onClick={() => void reload()}>
            Reload
          </button>
          <button
            type="button"
            className="ghost"
            disabled={busy || !Object.keys(options).length}
            title="Copy host options as TSV"
            onClick={() => {
              const lines = ["key\tvalue"];
              for (const k of Object.keys(options).sort()) {
                lines.push(
                  `${k}\t${String(options[k] ?? "").replace(/\t|\n/g, " ")}`,
                );
              }
              void navigator.clipboard.writeText(lines.join("\n")).then(
                () => onStatus?.("Copied host options TSV"),
                () => onError?.("Clipboard write failed"),
              );
            }}
          >
            Copy TSV
          </button>
          <button type="button" disabled={busy || !keys.length} onClick={() => void saveOptions()}>
            Save options
          </button>
        </div>
      </header>
      <div className="typed-grid pad">
        <label className="field block">
          Management address
          <input
            value={mgmtAddr}
            disabled={busy}
            onChange={(e) => setMgmtAddr(e.target.value)}
          />
        </label>
        <button type="button" disabled={busy} onClick={() => void saveManagement()}>
          Save management
        </button>
      </div>
      <div className="search-row pad">
        <input
          placeholder="Filter host options…"
          value={filter}
          disabled={busy}
          onChange={(e) => setFilter(e.target.value)}
        />
      </div>
      {keys.length ? (
        <div className="typed-grid options-grid">
          {keys.map((key) => (
            <OptionField
              key={key}
              name={key}
              value={options[key] ?? ""}
              meta={metaFor(options[key] ?? "")}
              disabled={busy}
              onChange={(v) => setOptions((prev) => ({ ...prev, [key]: v }))}
            />
          ))}
        </div>
      ) : (
        <p className="muted pad">
          {Object.keys(options).length ? "No host options match filter." : "No HostOptions stored yet."}
        </p>
      )}
    </div>
  );
}
