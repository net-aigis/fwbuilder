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

  const keys = Object.keys(options).sort();
  return (
    <div className="firewall-extras">
      <header className="panel-header">
        <h3>Host options</h3>
        <div className="btn-row">
          <button type="button" className="ghost" disabled={busy} onClick={() => void reload()}>
            Reload
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
        <p className="muted pad">No HostOptions stored yet.</p>
      )}
    </div>
  );
}
