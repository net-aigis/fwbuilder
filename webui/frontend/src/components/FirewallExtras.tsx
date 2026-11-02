import { useEffect, useMemo, useState } from "react";
import {
  deployFirewall,
  fetchManagement,
  fetchOptionSchema,
  fetchOptions,
  updateManagement,
  updateOptions,
} from "../api/client";

type Props = {
  sessionId: string;
  firewallId: string;
  platform?: string;
  hostOs?: string;
  busy?: boolean;
  onBusy?: (busy: boolean) => void;
  onStatus?: (msg: string) => void;
  onError?: (msg: string | null) => void;
};

const FALLBACK_FEATURED = [
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

type Group = { id: string; title: string; keys: string[] };

export function FirewallExtras({
  sessionId,
  firewallId,
  platform,
  hostOs,
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
  const [groups, setGroups] = useState<Group[]>([]);
  const [featured, setFeatured] = useState<string[]>(FALLBACK_FEATURED);
  const [compiler, setCompiler] = useState<string>("");
  const [activeGroup, setActiveGroup] = useState<string>("platform");

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const plat = platform || "nftables";
      const [o, m, schema] = await Promise.all([
        fetchOptions(sessionId, firewallId),
        fetchManagement(sessionId, firewallId),
        fetchOptionSchema(plat, hostOs || "").catch(() => null),
      ]);
      setOptions(o.options ?? {});
      setMgmtAddr(m.management?.address ?? "");
      setDeployHost(m.management?.address || o.options?.altAddress || "");
      setDeployUser(o.options?.admUser || "");
      if (schema) {
        setGroups(schema.groups ?? []);
        setFeatured(schema.featured_keys?.length ? schema.featured_keys : FALLBACK_FEATURED);
        setCompiler(schema.compiler || "");
        if (schema.groups?.[0]?.id) setActiveGroup(schema.groups[0].id);
      }
      onStatus?.(
        `Options: ${Object.keys(o.options ?? {}).length} keys · ${plat}${
          schema?.compiler ? ` · ${schema.compiler}` : ""
        }`,
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
  }, [sessionId, firewallId, platform, hostOs]);

  const keys = useMemo(() => {
    const all = Object.keys(options).sort();
    const q = filter.trim().toLowerCase();
    if (q) {
      return all.filter(
        (k) => k.toLowerCase().includes(q) || (options[k] || "").toLowerCase().includes(q),
      );
    }
    if (showAll) return all;
    const groupKeys = groups.find((g) => g.id === activeGroup)?.keys ?? featured;
    const preferred = groupKeys.filter((k) => k in options);
    return preferred.length ? preferred : featured.filter((k) => k in options);
  }, [options, filter, showAll, groups, activeGroup, featured]);

  async function saveOptions() {
    onBusy?.(true);
    onError?.(null);
    try {
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
        <h3>
          Platform / installer options
          {compiler ? <span className="muted"> · {compiler}</span> : null}
        </h3>
        <div className="btn-row">
          <button type="button" className="ghost" disabled={busy} onClick={() => void reload()}>
            Reload
          </button>
          <button type="button" disabled={busy} onClick={() => void saveOptions()}>
            Save options
          </button>
        </div>
      </header>

      {groups.length && !filter && !showAll ? (
        <div className="btn-row pad-tight">
          {groups.map((g) => (
            <button
              key={g.id}
              type="button"
              className={activeGroup === g.id ? undefined : "ghost"}
              disabled={busy}
              onClick={() => setActiveGroup(g.id)}
            >
              {g.title}
            </button>
          ))}
        </div>
      ) : null}

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
        {!keys.length ? <p className="muted">No keys in this group.</p> : null}
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
        Option groups come from <code>src/res/platform</code> / <code>os</code> defaults (not the full
        Qt dialogs). Deploy uses system <code>scp</code>/<code>ssh</code> (BatchMode).
      </p>
      {log ? <pre className="compile-log pad">{log}</pre> : null}
    </div>
  );
}
