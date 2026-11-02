import { useEffect, useMemo, useState } from "react";
import {
  deployFirewall,
  fetchManagement,
  fetchOptions,
  updateManagement,
  updateOptions,
} from "../api/client";

type Props = {
  sessionId: string;
  firewallId: string;
  busy?: boolean;
  onBusy?: (busy: boolean) => void;
  onStatus?: (msg: string) => void;
  onError?: (msg: string | null) => void;
};

const FEATURED = [
  "admUser",
  "altAddress",
  "activationCmd",
  "firewall_dir",
  "output_file",
  "sshArgs",
  "scpArgs",
  "configure_interfaces",
  "manage_virtual_addr",
  "log_level",
  "log_prefix",
  "prolog_script",
  "epilog_script",
];

export function FirewallExtras({
  sessionId,
  firewallId,
  busy,
  onBusy,
  onStatus,
  onError,
}: Props) {
  const [options, setOptions] = useState<Record<string, string>>({});
  const [filter, setFilter] = useState("");
  const [mgmtAddr, setMgmtAddr] = useState("");
  const [deployHost, setDeployHost] = useState("");
  const [deployUser, setDeployUser] = useState("");
  const [dryRun, setDryRun] = useState(true);
  const [log, setLog] = useState<string | null>(null);
  const [showAll, setShowAll] = useState(false);

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const [o, m] = await Promise.all([
        fetchOptions(sessionId, firewallId),
        fetchManagement(sessionId, firewallId),
      ]);
      setOptions(o.options ?? {});
      setMgmtAddr(m.management?.address ?? "");
      setDeployHost(m.management?.address || o.options?.altAddress || "");
      setDeployUser(o.options?.admUser || "");
      onStatus?.(`Options: ${Object.keys(o.options ?? {}).length} keys`);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  useEffect(() => {
    void reload();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionId, firewallId]);

  const keys = useMemo(() => {
    const all = Object.keys(options).sort();
    const q = filter.trim().toLowerCase();
    const base = showAll ? all : all.filter((k) => FEATURED.includes(k) || q);
    if (!q) return base.length ? base : all.slice(0, 20);
    return all.filter((k) => k.toLowerCase().includes(q) || (options[k] || "").toLowerCase().includes(q));
  }, [options, filter, showAll]);

  async function saveOptions() {
    onBusy?.(true);
    onError?.(null);
    try {
      const patch: Record<string, string> = {};
      for (const k of keys) patch[k] = options[k] ?? "";
      // Always send featured + currently filtered edits; safer: send all options state
      const res = await updateOptions(sessionId, firewallId, options);
      setOptions(res.options ?? options);
      onStatus?.("Firewall options saved");
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
      await updateManagement(sessionId, firewallId, { address: mgmtAddr });
      onStatus?.(`Management address → ${mgmtAddr}`);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  async function onDeploy() {
    onBusy?.(true);
    onError?.(null);
    setLog(null);
    try {
      const res = await deployFirewall(sessionId, {
        firewall_id: firewallId,
        host: deployHost || undefined,
        user: deployUser || undefined,
        compile_first: true,
        dry_run: dryRun,
        activate: true,
      });
      setLog(
        [
          res.deploy.note || "",
          `host=${res.deploy.host} user=${res.deploy.user || "(none)"}`,
          `remote=${res.deploy.remote_path}`,
          "",
          ...(res.deploy.commands || []),
          "",
          res.deploy.log || "",
        ]
          .filter(Boolean)
          .join("\n"),
      );
      onStatus?.(
        dryRun
          ? `Deploy dry-run for ${res.firewall}`
          : `Deployed ${res.firewall} → ${res.deploy.host}`,
      );
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  return (
    <div className="firewall-extras">
      <header className="panel-header">
        <h3>Platform / installer options</h3>
        <div className="btn-row">
          <button type="button" className="ghost" disabled={busy} onClick={() => void reload()}>
            Reload
          </button>
          <button type="button" disabled={busy} onClick={() => void saveOptions()}>
            Save options
          </button>
        </div>
      </header>

      <div className="search-row">
        <input
          placeholder="Filter options…"
          value={filter}
          disabled={busy}
          onChange={(e) => setFilter(e.target.value)}
        />
        <label className="check">
          <input
            type="checkbox"
            checked={showAll}
            disabled={busy}
            onChange={(e) => setShowAll(e.target.checked)}
          />
          All keys
        </label>
      </div>

      <div className="typed-grid options-grid">
        {keys.map((key) => (
          <label key={key} className="field block">
            {key}
            <input
              value={options[key] ?? ""}
              disabled={busy}
              onChange={(e) => setOptions((prev) => ({ ...prev, [key]: e.target.value }))}
            />
          </label>
        ))}
      </div>

      <header className="panel-header">
        <h3>Management / deploy</h3>
      </header>
      <div className="typed-grid">
        <label className="field block">
          Management address
          <input value={mgmtAddr} disabled={busy} onChange={(e) => setMgmtAddr(e.target.value)} />
        </label>
        <label className="field block">
          Deploy host override
          <input value={deployHost} disabled={busy} onChange={(e) => setDeployHost(e.target.value)} />
        </label>
        <label className="field block">
          SSH user
          <input value={deployUser} disabled={busy} onChange={(e) => setDeployUser(e.target.value)} />
        </label>
      </div>
      <div className="btn-row">
        <button type="button" className="ghost" disabled={busy} onClick={() => void saveManagement()}>
          Save management
        </button>
        <label className="check">
          <input
            type="checkbox"
            checked={dryRun}
            disabled={busy}
            onChange={(e) => setDryRun(e.target.checked)}
          />
          Dry-run
        </label>
        <button type="button" disabled={busy} onClick={() => void onDeploy()}>
          Compile + deploy
        </button>
      </div>
      <p className="muted pad">
        Uses system <code>scp</code>/<code>ssh</code> (BatchMode). Not the full desktop installer
        session. Keep dry-run on until keys and host are verified.
      </p>
      {log ? <pre className="compile-log pad">{log}</pre> : null}
    </div>
  );
}
