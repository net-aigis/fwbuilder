import { useEffect, useMemo, useState } from "react";
import {
  deployFirewall,
  fetchManagement,
  fetchOptionSchema,
  fetchOptions,
  updateManagement,
  updateOptions,
  type OptionFieldMeta,
} from "../api/client";
import { OptionField } from "./OptionField";

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

function groupStorageKey(platform: string, hostOs: string) {
  return `fwbweb.optionGroup.${platform || "unknown"}.${hostOs || ""}`;
}

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
  const [defaults, setDefaults] = useState<Record<string, string>>({});
  const [fields, setFields] = useState<Record<string, OptionFieldMeta>>({});
  const [filter, setFilter] = useState("");
  const [mgmtAddr, setMgmtAddr] = useState("");
  const [deployHost, setDeployHost] = useState("");
  const [deployUser, setDeployUser] = useState("");
  const [remoteDir, setRemoteDir] = useState("");
  const [identityFile, setIdentityFile] = useState("");
  const [activate, setActivate] = useState(true);
  const [dryRun, setDryRun] = useState(true);
  const [log, setLog] = useState<string | null>(null);
  const [showAll, setShowAll] = useState(false);
  const [groups, setGroups] = useState<Group[]>([]);
  const [featured, setFeatured] = useState<string[]>(FALLBACK_FEATURED);
  const [compiler, setCompiler] = useState<string>("");
  const [dialogName, setDialogName] = useState<string>("");
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
      setRemoteDir(o.options?.firewall_dir || "/etc");
      if (schema) {
        const nextGroups = schema.groups ?? [];
        setGroups(nextGroups);
        setFeatured(schema.featured_keys?.length ? schema.featured_keys : FALLBACK_FEATURED);
        setCompiler(schema.compiler || "");
        setDialogName(schema.dialog || "");
        setFields(schema.fields ?? {});
        setDefaults(schema.defaults ?? {});
        let preferred = nextGroups[0]?.id || "platform";
        try {
          const stored = sessionStorage.getItem(groupStorageKey(plat, hostOs || ""));
          if (stored && nextGroups.some((g) => g.id === stored)) preferred = stored;
        } catch {
          /* ignore */
        }
        setActiveGroup(preferred);
        onStatus?.(
          `Options: ${Object.keys(o.options ?? {}).length} · dialog fields ${
            schema.dialog_field_count ?? 0
          } · ${plat}${schema.compiler ? ` · ${schema.compiler}` : ""}`,
        );
      } else {
        onStatus?.(`Options: ${Object.keys(o.options ?? {}).length} keys`);
      }
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

  useEffect(() => {
    if (!activeGroup || !platform) return;
    try {
      sessionStorage.setItem(groupStorageKey(platform || "nftables", hostOs || ""), activeGroup);
    } catch {
      /* ignore */
    }
  }, [activeGroup, platform, hostOs]);

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

  const activeGroupMeta = groups.find((g) => g.id === activeGroup) || null;
  const activeGroupIndex = groups.findIndex((g) => g.id === activeGroup);

  function cycleGroup(delta: number) {
    if (!groups.length) return;
    const idx = activeGroupIndex < 0 ? 0 : activeGroupIndex;
    const next = groups[(idx + delta + groups.length) % groups.length];
    if (next) {
      setActiveGroup(next.id);
      setFilter("");
      setShowAll(false);
      onStatus?.(`Options page: ${next.title}`);
    }
  }

  function resetActivePageDefaults() {
    if (!activeGroupMeta) return;
    setOptions((prev) => {
      const next = { ...prev };
      for (const key of activeGroupMeta.keys) {
        if (key in defaults) next[key] = String(defaults[key] ?? "");
      }
      return next;
    });
    onStatus?.(`Reset defaults for page ${activeGroupMeta.title} (not saved yet)`);
  }

  async function saveOptions() {
    onBusy?.(true);
    onError?.(null);
    try {
      await updateOptions(sessionId, firewallId, options);
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
    if (!dryRun) {
      if (
        !window.confirm(
          "LIVE deploy will run scp/ssh against the management host. Continue?",
        )
      ) {
        return;
      }
      const typed = window.prompt('Type DEPLOY to confirm live install', "");
      if (typed !== "DEPLOY") {
        onStatus?.("Live deploy cancelled");
        return;
      }
    }
    onBusy?.(true);
    onError?.(null);
    setLog(null);
    try {
      const res = await deployFirewall(sessionId, {
        firewall_id: firewallId,
        host: deployHost || undefined,
        user: deployUser || undefined,
        remote_dir: remoteDir || undefined,
        identity_file: identityFile.trim() || undefined,
        compile_first: true,
        dry_run: dryRun,
        activate,
      });
      const deployAny = res.deploy as typeof res.deploy & {
        plan?: string[];
        activation_source?: string;
        activation_cmd?: string;
      };
      setLog(
        [
          res.deploy.note || "",
          `host=${res.deploy.host} user=${res.deploy.user || "(none)"}`,
          `remote=${res.deploy.remote_path}`,
          `dry_run=${res.deploy.dry_run}`,
          deployAny.activation_source
            ? `activation_source=${deployAny.activation_source}`
            : "",
          "",
          ...((deployAny.plan && deployAny.plan.length
            ? deployAny.plan
            : []) as string[]),
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

  function onCopyLog() {
    if (!log) return;
    void navigator.clipboard.writeText(log).then(
      () => onStatus?.("Copied deploy log"),
      () => onError?.("Clipboard write failed"),
    );
  }

  return (
    <div className="firewall-extras">
      <header className="panel-header">
        <h3>
          Platform / installer options
          {compiler ? <span className="muted"> · {compiler}</span> : null}
          {dialogName ? <span className="muted"> · {dialogName}</span> : null}
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
        <div className="dialog-pages pad-tight" role="tablist" aria-label="Option dialog pages">
          <button
            type="button"
            className="ghost"
            disabled={busy || groups.length < 2}
            title="Previous dialog page"
            onClick={() => cycleGroup(-1)}
          >
            ←
          </button>
          {groups.map((g) => (
            <button
              key={g.id}
              type="button"
              role="tab"
              aria-selected={activeGroup === g.id}
              className={activeGroup === g.id ? undefined : "ghost"}
              disabled={busy}
              onClick={() => setActiveGroup(g.id)}
            >
              {g.title}
            </button>
          ))}
          <button
            type="button"
            className="ghost"
            disabled={busy || groups.length < 2}
            title="Next dialog page"
            onClick={() => cycleGroup(1)}
          >
            →
          </button>
        </div>
      ) : null}

      {activeGroupMeta && !filter && !showAll ? (
        <div className="btn-row pad-tight">
          <span className="muted">
            Page {activeGroupIndex + 1}/{groups.length}: {activeGroupMeta.title}
          </span>
          <button
            type="button"
            className="ghost"
            disabled={busy || !activeGroupMeta.keys.length}
            title="Restore schema defaults for keys on this dialog page (Save to persist)"
            onClick={resetActivePageDefaults}
          >
            Reset page defaults
          </button>
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
          <OptionField
            key={key}
            name={key}
            value={options[key] ?? ""}
            meta={fields[key]}
            disabled={busy}
            onChange={(v) => setOptions((prev) => ({ ...prev, [key]: v }))}
          />
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
        <label className="field block">
          Remote directory
          <input
            value={remoteDir}
            disabled={busy}
            onChange={(e) => setRemoteDir(e.target.value)}
            placeholder="/etc"
          />
        </label>
        <label className="field block">
          SSH identity file
          <input
            value={identityFile}
            disabled={busy}
            onChange={(e) => setIdentityFile(e.target.value)}
            placeholder="~/.ssh/id_ed25519"
          />
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
        <label className="check">
          <input
            type="checkbox"
            checked={activate}
            disabled={busy}
            onChange={(e) => setActivate(e.target.checked)}
          />
          Activate after copy
        </label>
        <button type="button" disabled={busy} onClick={() => void onDeploy()}>
          Compile + deploy
        </button>
        {log ? (
          <button type="button" className="ghost" disabled={busy} onClick={onCopyLog}>
            Copy deploy log
          </button>
        ) : null}
      </div>
      <p className="muted pad">
        Dialog pages come from libgui AdvancedDialog <code>.ui</code> tabs. Pixel-perfect Qt layout
        is not claimed; scp/ssh deploy is simplified vs desktop FirewallInstaller.
      </p>
      {log ? <pre className="compile-log pad">{log}</pre> : null}
    </div>
  );
}
