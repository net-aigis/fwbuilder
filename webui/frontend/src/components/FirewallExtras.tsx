import { useEffect, useMemo, useState } from "react";
import {
  deployFirewall,
  fetchInstallerCapabilities,
  fetchInstallerConfiglet,
  fetchExpectInstallPlan,
  fetchInstallerConfigletFile,
  fetchInstallerConfiglets,
  fetchManagement,
  fetchResStatus,
  fetchOptionSchema,
  fetchOptions,
  fetchSshAuth,
  updateManagement,
  updateOptions,
  type OptionFieldMeta,
} from "../api/client";
import { OptionField } from "./OptionField";
import {
  qtGridStyle,
  qtSpacerStyle,
  type QtGridAnnotation,
  type QtGridSpacer,
} from "../qtGrid";

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

type GroupSection = { id: string; title: string; keys: string[] };
type Group = {
  id: string;
  title: string;
  keys: string[];
  sections?: GroupSection[];
  spacers?: QtGridSpacer[];
  column_stretch?: number[];
  layouts?: Record<string, number>;
  annotations?: QtGridAnnotation[];
};

function groupStorageKey(platform: string, hostOs: string) {
  return `fwbweb.optionGroup.${platform || "unknown"}.${hostOs || ""}`;
}

function deployPrefsKey(firewallId: string) {
  return `fwbweb.deployPrefs.${firewallId}`;
}

function deployPlanKey(firewallId: string) {
  return `fwbweb.deployPlan.${firewallId}`;
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
  const [installEnabled, setInstallEnabled] = useState(false);
  const [installCmd, setInstallCmd] = useState("");
  const [installArgs, setInstallArgs] = useState("");
  const [deployHost, setDeployHost] = useState("");
  const [deployUser, setDeployUser] = useState("");
  const [remoteDir, setRemoteDir] = useState("");
  const [identityFile, setIdentityFile] = useState("");
  const [activate, setActivate] = useState(true);
  const [dryRun, setDryRun] = useState(true);
  const [compress, setCompress] = useState(false);
  const [useScp, setUseScp] = useState(true);
  const [copyFwb, setCopyFwb] = useState(false);
  const [compileFirst, setCompileFirst] = useState(true);
  const [log, setLog] = useState<string | null>(null);
  const [lastPlan, setLastPlan] = useState<string[]>([]);
  const [showAll, setShowAll] = useState(false);
  const [useQtGridLayout, setUseQtGridLayout] = useState(() => {
    try {
      return sessionStorage.getItem("fwbweb.qtGridLayout") !== "0";
    } catch {
      return true;
    }
  });
  const [groups, setGroups] = useState<Group[]>([]);
  const [featured, setFeatured] = useState<string[]>(FALLBACK_FEATURED);
  const [compiler, setCompiler] = useState<string>("");
  const [dialogName, setDialogName] = useState<string>("");
  const [activeGroup, setActiveGroup] = useState<string>("platform");
  const [installerNote, setInstallerNote] = useState<string | null>(null);
  const [installerMode, setInstallerMode] = useState<string | null>(null);
  const [expectSteps, setExpectSteps] = useState<string[]>([]);
  const [expectConfiglets, setExpectConfiglets] = useState<string[]>([]);
  const [configletPreview, setConfigletPreview] = useState<{
    name: string;
    text: string;
    expanded?: boolean;
  } | null>(null);
  const [expectPlanText, setExpectPlanText] = useState<string | null>(null);
  const [sshAuthNote, setSshAuthNote] = useState<string | null>(null);
  const [hardGaps, setHardGaps] = useState<string[]>([]);
  const [resHint, setResHint] = useState<string | null>(null);

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const plat = platform || "nftables";
      const [o, m, schema, cfgList, resSt, sshAuth] = await Promise.all([
        fetchOptions(sessionId, firewallId),
        fetchManagement(sessionId, firewallId),
        fetchOptionSchema(plat, hostOs || "").catch(() => null),
        hostOs
          ? fetchInstallerCapabilities(hostOs).catch(() =>
              fetchInstallerConfiglets(hostOs).catch(() => null),
            )
          : Promise.resolve(null),
        fetchResStatus().catch(() => null),
        fetchSshAuth().catch(() => null),
      ]);
      if (sshAuth?.note) setSshAuthNote(sshAuth.note);
      else setSshAuthNote(null);
      if (resSt?.hard_gap_open?.length) setHardGaps(resSt.hard_gap_open);
      else setHardGaps([]);
      if (resSt?.configlets_ok) {
        const phase = resSt.soft_complete_phase
          ? ` · soft-complete phase${resSt.soft_complete_phase}`
          : "";
        setResHint(`${resSt.configlet_os_count} installer OS configlet dirs${phase}`);
      } else if (resSt) {
        setResHint("configlets missing — check FWBUILDER_RES_DIR");
      } else {
        setResHint(null);
      }
      setOptions(o.options ?? {});
      setMgmtAddr(m.management?.address ?? "");
      const script = m.management?.install_script;
      setInstallEnabled(Boolean(script?.enabled));
      setInstallCmd(script?.command || "");
      setInstallArgs(script?.arguments || "");
      setDeployHost(m.management?.address || o.options?.altAddress || "");
      setDeployUser(o.options?.admUser || "");
      setRemoteDir(o.options?.firewall_dir || "/etc");
      try {
        const raw = sessionStorage.getItem(deployPrefsKey(firewallId));
        if (raw) {
          const prefs = JSON.parse(raw) as {
            dryRun?: boolean;
            activate?: boolean;
            compress?: boolean;
            useScp?: boolean;
            copyFwb?: boolean;
            compileFirst?: boolean;
            identityFile?: string;
            deployHost?: string;
            deployUser?: string;
            remoteDir?: string;
          };
          if (typeof prefs.dryRun === "boolean") setDryRun(prefs.dryRun);
          if (typeof prefs.activate === "boolean") setActivate(prefs.activate);
          if (typeof prefs.compress === "boolean") setCompress(prefs.compress);
          if (typeof prefs.useScp === "boolean") setUseScp(prefs.useScp);
          if (typeof prefs.copyFwb === "boolean") setCopyFwb(prefs.copyFwb);
          if (typeof prefs.compileFirst === "boolean") setCompileFirst(prefs.compileFirst);
          if (typeof prefs.identityFile === "string") setIdentityFile(prefs.identityFile);
          if (typeof prefs.deployHost === "string" && prefs.deployHost) setDeployHost(prefs.deployHost);
          if (typeof prefs.deployUser === "string") setDeployUser(prefs.deployUser);
          if (typeof prefs.remoteDir === "string" && prefs.remoteDir) setRemoteDir(prefs.remoteDir);
        }
        const planRaw = sessionStorage.getItem(deployPlanKey(firewallId));
        if (planRaw) {
          const storedPlan = JSON.parse(planRaw) as string[];
          if (Array.isArray(storedPlan) && storedPlan.length) setLastPlan(storedPlan);
        }
      } catch {
        /* ignore */
      }
      if (cfgList) {
        const caps = cfgList as typeof cfgList & {
          recommended_webui_mode?: string;
          names?: string[];
          expect_install_plan?: { note?: string; available?: boolean; executable?: boolean };
          expect_installer?: {
            note?: string;
            desktop_steps?: string[];
            names?: string[];
            has_pre_config?: boolean;
            has_post_config?: boolean;
          };
        };
        setInstallerMode(caps.recommended_webui_mode || null);
        const planNote = caps.expect_install_plan?.note;
        if (cfgList.interactive_installer) {
          const steps = caps.expect_installer?.desktop_steps || [];
          setExpectSteps(steps);
          setExpectConfiglets(
            caps.expect_installer?.names || caps.names || cfgList.names || [],
          );
          setInstallerNote(
            [
              cfgList.note ||
                "This OS uses interactive FirewallInstaller pre/post configlets; WebUI scp/ssh deploy is limited.",
              planNote,
            ]
              .filter(Boolean)
              .join(" "),
          );
        } else {
          setExpectSteps([]);
          setExpectConfiglets([]);
          setInstallerNote(planNote || null);
        }
      } else {
        setInstallerMode(null);
        setInstallerNote(null);
        setExpectSteps([]);
        setExpectConfiglets([]);
      }
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

  useEffect(() => {
    try {
      sessionStorage.setItem("fwbweb.qtGridLayout", useQtGridLayout ? "1" : "0");
    } catch {
      /* ignore */
    }
  }, [useQtGridLayout]);

  useEffect(() => {
    if (!firewallId) return;
    try {
      sessionStorage.setItem(
        deployPrefsKey(firewallId),
        JSON.stringify({
          dryRun,
          activate,
          compress,
          useScp,
          copyFwb,
          compileFirst,
          identityFile,
          deployHost,
          deployUser,
          remoteDir,
        }),
      );
    } catch {
      /* ignore */
    }
  }, [
    firewallId,
    dryRun,
    activate,
    compress,
    useScp,
    copyFwb,
    compileFirst,
    identityFile,
    deployHost,
    deployUser,
    remoteDir,
  ]);

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

  const optionSections = useMemo(() => {
    if (filter.trim() || showAll || !activeGroupMeta?.sections?.length) {
      return [{ id: "all", title: "", keys }];
    }
    const keySet = new Set(keys);
    const out: GroupSection[] = [];
    for (const sec of activeGroupMeta.sections) {
      const secKeys = sec.keys.filter((k) => keySet.has(k));
      if (secKeys.length) out.push({ ...sec, keys: secKeys });
    }
    return out.length ? out : [{ id: "all", title: "", keys }];
  }, [filter, showAll, activeGroupMeta, keys]);

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
      await updateManagement(sessionId, firewallId, {
        address: mgmtAddr,
        install_script: {
          enabled: installEnabled,
          command: installCmd,
          arguments: installArgs,
        },
      });
      onStatus?.(
        installEnabled && installCmd.trim()
          ? `Management + install script → ${installCmd}`
          : `Management address → ${mgmtAddr}`,
      );
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  async function onDeploy() {
    if (!dryRun) {
      const external = installEnabled && installCmd.trim().length > 0;
      let warn = external
        ? "LIVE deploy will run the external install script on this machine. Continue?"
        : "LIVE deploy will run scp/ssh against the management host. Continue?";
      if (installerNote && !external) {
        warn =
          "This OS normally needs the desktop expect/SSHSession installer. " +
          "WebUI will only run simplified scp/ssh. Continue anyway?";
      }
      if (!window.confirm(warn)) {
        return;
      }
      const typed = window.prompt('Type DEPLOY to confirm live install', "");
      if (typed !== "DEPLOY") {
        onStatus?.("Live deploy cancelled");
        return;
      }
    }
    const forceLimited = Boolean(installerNote) && !dryRun;
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
        compile_first: compileFirst,
        dry_run: dryRun,
        activate,
        compress,
        use_scp: useScp,
        copy_fwb: copyFwb,
        force_limited_installer: forceLimited || undefined,
      });
      const deployAny = res.deploy as typeof res.deploy & {
        plan?: string[];
        activation_source?: string;
        activation_cmd?: string;
        identity_file?: string | null;
      };
      const plan = (deployAny.plan && deployAny.plan.length ? deployAny.plan : []) as string[];
      setLastPlan(plan);
      try {
        sessionStorage.setItem(deployPlanKey(firewallId), JSON.stringify(plan));
      } catch {
        /* ignore */
      }
      setLog(
        [
          res.deploy.note || "",
          `host=${res.deploy.host} user=${res.deploy.user || "(none)"}`,
          `remote=${res.deploy.remote_path}`,
          `dry_run=${res.deploy.dry_run}`,
          res.deploy.mode ? `mode=${res.deploy.mode}` : "",
          `use_scp=${useScp}`,
          copyFwb ? "copy_fwb=true" : "",
          deployAny.identity_file ? `identity_file=${deployAny.identity_file}` : "",
          deployAny.activation_source
            ? `activation_source=${deployAny.activation_source}`
            : "",
          "",
          ...plan,
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

  function onCopyPlan() {
    if (!lastPlan.length) return;
    void navigator.clipboard.writeText(lastPlan.join("\n")).then(
      () => onStatus?.("Copied install plan"),
      () => onError?.("Clipboard write failed"),
    );
  }

  function onDownloadPlan() {
    if (!lastPlan.length) return;
    const blob = new Blob([lastPlan.join("\n") + "\n"], { type: "text/plain;charset=utf-8" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `fwbweb-install-plan-${firewallId}.txt`;
    a.click();
    URL.revokeObjectURL(url);
    onStatus?.("Downloaded install plan");
  }

  async function onPreviewConfiglet() {
    const os = (hostOs || "").trim();
    if (!os) {
      onError?.("host_OS missing; cannot preview installer configlet");
      return;
    }
    onBusy?.(true);
    onError?.(null);
    try {
      const fwdir = (remoteDir || options.firewall_dir || "/etc").trim() || "/etc";
      const fwscript = (options.output_file || "firewall.fw").trim() || "firewall.fw";
      const user = (deployUser || options.admUser || "fwadmin").trim() || "fwadmin";
      const res = await fetchInstallerConfiglet({
        host_os: os,
        user,
        fwdir,
        fwscript,
        generate_rc_conf: ["true", "1", "yes", "on"].includes(
          (options.generate_rc_conf_file || "").trim().toLowerCase(),
        ),
        use_scp: useScp,
      });
      const prev = res.preview || { ok: false, command: "" };
      setLog(
        [
          `host_os=${res.host_os} family=${res.family || ""}`,
          `configlet_dir=${res.configlet_dir || "(none)"}`,
          `user=${res.user}`,
          res.interactive_installer ? "interactive_installer=true" : "interactive_installer=false",
          res.note || "",
          prev.source ? `source=${prev.source}` : "",
          "",
          prev.ok ? prev.command || "(empty command)" : "(no activation configlet)",
        ]
          .filter(Boolean)
          .join("\n"),
      );
      onStatus?.(`Installer configlet preview for ${os}`);
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
            {activeGroupMeta.layouts
              ? ` · layouts ${Object.entries(activeGroupMeta.layouts)
                  .map(([k, n]) => `${k}:${n}`)
                  .join(", ")}`
              : ""}
            {activeGroupMeta.column_stretch?.length
              ? ` · stretch ${activeGroupMeta.column_stretch.join(":")}`
              : ""}
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

      <div className="btn-row pad-tight">
        <label className="check" title="Place fields using QGridLayout row/column from .ui when available">
          <input
            type="checkbox"
            checked={useQtGridLayout}
            disabled={busy}
            onChange={(e) => setUseQtGridLayout(e.target.checked)}
          />
          Qt grid placement
        </label>
      </div>
      {optionSections.map((sec, secIdx) => {
        const pageSpacers =
          useQtGridLayout && secIdx === 0 ? activeGroupMeta?.spacers || [] : [];
        const pageStretch =
          useQtGridLayout && secIdx === 0 ? activeGroupMeta?.column_stretch || [] : [];
        const pageNotes =
          useQtGridLayout && secIdx === 0 ? activeGroupMeta?.annotations || [] : [];
        const grid = useQtGridLayout
          ? qtGridStyle(sec.keys, fields, pageSpacers, pageStretch, pageNotes)
          : { className: "typed-grid options-grid" };
        return (
          <div key={sec.id || "all"} className="option-section">
            {sec.title ? <h4 className="option-section-title">{sec.title}</h4> : null}
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
                  style={qtSpacerStyle(note)}
                >
                  {note.text}
                </p>
              ))}
              {sec.keys.map((key) => (
                <OptionField
                  key={key}
                  name={key}
                  value={options[key] ?? ""}
                  meta={fields[key]}
                  disabled={busy}
                  onChange={(v) => setOptions((prev) => ({ ...prev, [key]: v }))}
                />
              ))}
              {!sec.keys.length ? <p className="muted">No keys in this group.</p> : null}
            </div>
          </div>
        );
      })}
      {!keys.length ? <p className="muted">No keys in this group.</p> : null}

      <header className="panel-header">
        <h3>Management / deploy</h3>
      </header>
      {installerMode ? (
        <p className="muted pad-tight" role="status">
          Recommended WebUI installer mode: <code>{installerMode}</code>
        </p>
      ) : null}
      {installerNote ? (
        <div className="pad-tight" role="status">
          <p className="warn">{installerNote}</p>
          {expectSteps.length ? (
            <details className="expect-steps">
              <summary className="muted">Desktop expect installer steps ({expectSteps.length})</summary>
              <ol>
                {expectSteps.map((s) => (
                  <li key={s}>{s}</li>
                ))}
              </ol>
              <div className="btn-row pad-tight">
                <button
                  type="button"
                  className="ghost"
                  disabled={busy || !hostOs}
                  title="Read-only ordered expect plan with configlet previews (not executed)"
                  onClick={() => {
                    if (!hostOs) return;
                    void (async () => {
                      onBusy?.(true);
                      onError?.(null);
                      try {
                        const plan = await fetchExpectInstallPlan(hostOs, {
                          fwdir: remoteDir || "/etc",
                        });
                        const lines = [
                          `# expect plan for ${plan.host_os} (executable=${plan.executable})`,
                          plan.note || "",
                          "",
                          ...plan.steps.map((s, i) => {
                            const head = `${i + 1}. [${s.id}] ${s.title}`;
                            const body = s.preview
                              ? `\n${s.preview}\n`
                              : s.detail
                                ? `\n   ${s.detail}`
                                : "";
                            return head + body;
                          }),
                        ];
                        setExpectPlanText(lines.join("\n"));
                        onStatus?.(`Expect plan: ${plan.step_count} steps (not executable)`);
                      } catch (e) {
                        onError?.(e instanceof Error ? e.message : String(e));
                      } finally {
                        onBusy?.(false);
                      }
                    })();
                  }}
                >
                  Show expect plan
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy || !expectPlanText}
                  title="Download the last shown expect plan as text"
                  onClick={() => {
                    if (!expectPlanText) return;
                    const blob = new Blob([expectPlanText + "\n"], {
                      type: "text/plain;charset=utf-8",
                    });
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = `fwbweb-expect-plan-${firewallId || "fw"}.txt`;
                    a.click();
                    URL.revokeObjectURL(url);
                    onStatus?.("Downloaded expect plan");
                  }}
                >
                  Download expect plan
                </button>
              </div>
              {expectPlanText ? (
                <pre className="deploy-log configlet-preview" tabIndex={0}>
                  {expectPlanText}
                </pre>
              ) : null}
              {expectConfiglets.length ? (
                <div className="pad-tight">
                  <p className="muted">
                    Installer configlets:{" "}
                    <code>{expectConfiglets.join(", ")}</code>
                  </p>
                  <div className="btn-row">
                    {expectConfiglets
                      .filter((n) =>
                        n.includes("pre_config") || n.includes("post_config"),
                      )
                      .flatMap((n) => [
                        <button
                          key={`${n}-raw`}
                          type="button"
                          className="ghost"
                          disabled={busy || !hostOs}
                          title="Read-only raw configlet preview (not executed)"
                          onClick={() => {
                            if (!hostOs) return;
                            void (async () => {
                              onBusy?.(true);
                              onError?.(null);
                              try {
                                const r = await fetchInstallerConfigletFile(hostOs, n);
                                setConfigletPreview({
                                  name: r.name,
                                  text: r.text || "",
                                  expanded: false,
                                });
                                onStatus?.(`Configlet preview: ${r.name}`);
                              } catch (e) {
                                onError?.(e instanceof Error ? e.message : String(e));
                              } finally {
                                onBusy?.(false);
                              }
                            })();
                          }}
                        >
                          Preview {n.replace("installer_commands_", "")}
                        </button>,
                        <button
                          key={`${n}-exp`}
                          type="button"
                          className="ghost"
                          disabled={busy || !hostOs}
                          title="Expanded with dummy variables (not executed)"
                          onClick={() => {
                            if (!hostOs) return;
                            void (async () => {
                              onBusy?.(true);
                              onError?.(null);
                              try {
                                const r = await fetchInstallerConfigletFile(hostOs, n, {
                                  expand: true,
                                  fwdir: remoteDir || "/etc",
                                });
                                setConfigletPreview({
                                  name: `${r.name} (expanded)`,
                                  text: r.expanded_text || r.text || "",
                                  expanded: true,
                                });
                                onStatus?.(`Expanded configlet: ${r.name}`);
                              } catch (e) {
                                onError?.(e instanceof Error ? e.message : String(e));
                              } finally {
                                onBusy?.(false);
                              }
                            })();
                          }}
                        >
                          Expand {n.replace("installer_commands_", "")}
                        </button>,
                      ])}
                  </div>
                  {configletPreview ? (
                    <pre className="deploy-log configlet-preview" tabIndex={0}>
                      {`# ${configletPreview.name}\n${configletPreview.text}`}
                    </pre>
                  ) : null}
                </div>
              ) : null}
            </details>
          ) : null}
        </div>
      ) : null}
      <div className="typed-grid">
        <label className="field block">
          Management address
          <input value={mgmtAddr} disabled={busy} onChange={(e) => setMgmtAddr(e.target.value)} />
        </label>
        <label className="check" title="When enabled with a command, deploy runs this local script instead of scp/ssh">
          <input
            type="checkbox"
            checked={installEnabled}
            disabled={busy}
            onChange={(e) => setInstallEnabled(e.target.checked)}
          />
          External install script
        </label>
        <label className="field block">
          Install script command
          <input
            value={installCmd}
            disabled={busy}
            onChange={(e) => setInstallCmd(e.target.value)}
            placeholder="/usr/local/bin/fw-install.sh"
          />
        </label>
        <label className="field block">
          Install script arguments
          <input
            value={installArgs}
            disabled={busy}
            onChange={(e) => setInstallArgs(e.target.value)}
            placeholder="optional args"
          />
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
      <p className="muted pad-tight" title="ssh_auth.batch_mode">
        {sshAuthNote ||
          "SSH uses BatchMode (key/agent only). Password and keyboard-interactive auth are not implemented in WebUI."}
      </p>
      <div className="btn-row">
        <button type="button" className="ghost" disabled={busy} onClick={() => void saveManagement()}>
          Save management
        </button>
        <button
          type="button"
          className="ghost"
          disabled={busy}
          title="Clear sessionStorage deploy preferences for this firewall"
          onClick={() => {
            try {
              sessionStorage.removeItem(deployPrefsKey(firewallId));
              sessionStorage.removeItem(deployPlanKey(firewallId));
            } catch {
              /* ignore */
            }
            setDryRun(true);
            setActivate(true);
            setCompress(false);
            setUseScp(true);
            setCopyFwb(false);
            setCompileFirst(true);
            setIdentityFile("");
            setLastPlan([]);
            onStatus?.("Deploy preferences reset");
          }}
        >
          Reset deploy prefs
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
        <label
          className="check"
          title="Gzip files for scp transfer then gunzip on the host; also sets configlet with_compression (desktop compressScript)"
        >
          <input
            type="checkbox"
            checked={compress}
            disabled={busy}
            onChange={(e) => setCompress(e.target.checked)}
          />
          Compress transfer
        </label>
        <label className="check" title="Cisco/Juniper using_scp configlet flag">
          <input
            type="checkbox"
            checked={useScp}
            disabled={busy}
            onChange={(e) => setUseScp(e.target.checked)}
          />
          Use SCP
        </label>
        <label className="check" title="Also copy the .fwb project file (desktop Installer copyFWB)">
          <input
            type="checkbox"
            checked={copyFwb}
            disabled={busy}
            onChange={(e) => setCopyFwb(e.target.checked)}
          />
          Copy .fwb
        </label>
        <label
          className="check"
          title="Uncheck to reuse last compile (or skip compile for external install script)"
        >
          <input
            type="checkbox"
            checked={compileFirst}
            disabled={busy}
            onChange={(e) => setCompileFirst(e.target.checked)}
          />
          Compile first
        </label>
        <button type="button" disabled={busy} onClick={() => void onDeploy()}>
          {compileFirst ? "Compile + deploy" : "Deploy"}
        </button>
        <button
          type="button"
          className="ghost"
          disabled={busy || !hostOs}
          title="Preview expanded OS installer activation configlet"
          onClick={() => void onPreviewConfiglet()}
        >
          Preview configlet
        </button>
        {lastPlan.length ? (
          <>
            <button type="button" className="ghost" disabled={busy} onClick={onCopyPlan}>
              Copy plan
            </button>
            <button type="button" className="ghost" disabled={busy} onClick={onDownloadPlan}>
              Download plan
            </button>
          </>
        ) : null}
        {log ? (
          <button type="button" className="ghost" disabled={busy} onClick={onCopyLog}>
            Copy deploy log
          </button>
        ) : null}
      </div>
      {hardGaps.length ? (
        <p className="muted pad-tight" title="hard_gap_open from /res-status">
          Hard gaps still open: <code>{hardGaps.join(", ")}</code>
        </p>
      ) : null}
      <p className="muted pad">
        Dialog pages come from libgui AdvancedDialog <code>.ui</code> tabs. Pixel-perfect Qt layout
        is not claimed; scp/ssh deploy is simplified vs desktop FirewallInstaller.
        {resHint ? (
          <>
            {" "}
            · <span>{resHint}</span>
          </>
        ) : null}
      </p>
      {log ? <pre className="compile-log pad">{log}</pre> : null}
    </div>
  );
}
