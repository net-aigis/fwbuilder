import { useEffect, useMemo, useState, type CSSProperties } from "react";
import {
  deployFirewall,
  fetchInstallerCapabilities,
  fetchInstallerConfiglet,
  fetchExpectInstallPlan,
  fetchExpectInstallWalkthrough,
  fetchExpectPlanSteps,
  fetchExpectPlanStepRefusals,
  fetchHardGapClosure,
  fetchHardGaps,
  fetchHardGapsSummary,
  fetchLayoutFidelity,
  fetchStackSwitch,
  refuseExpectInstallStep,
  refusePasswordSsh,
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
  qtAlignmentStyle,
  qtGridStyle,
  qtSpacerStyle,
  type QtGridAnnotation,
  type QtGridSpacing,
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

/** UI-facing sample fidelity line; full API payload stays on /hard-gaps. */
const SAMPLE_FIDELITY_UI_MAX = 220;

function formatSampleFidelityLine(full: string): { display: string; title: string } {
  if (full.length <= SAMPLE_FIDELITY_UI_MAX) {
    return { display: full, title: full };
  }
  return {
    display: `${full.slice(0, SAMPLE_FIDELITY_UI_MAX - 1)}…`,
    title: full,
  };
}

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
  layouts?: Record<string, number>;
  layout_tree?: unknown[];
  annotations?: QtGridAnnotation[];
  buddy_labels?: QtGridAnnotation[];
  spacing?: QtGridSpacing;
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

function expectPlanKey(firewallId: string) {
  return `fwbweb.expectPlan.${firewallId}`;
}

function expectWalkthroughKey(firewallId: string) {
  return `fwbweb.expectWalkthrough.${firewallId}`;
}

function hardGapClosureKey(firewallId: string) {
  return `fwbweb.hardGapClosure.${firewallId}`;
}

function expectRefusalsKey(firewallId: string) {
  return `fwbweb.expectRefusals.${firewallId}`;
}

function hardGapsSnapshotKey(firewallId: string) {
  return `fwbweb.hardGaps.${firewallId}`;
}

function hardGapsSummaryKey(firewallId: string) {
  return `fwbweb.hardGapsSummary.${firewallId}`;
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
  const [dialogTitle, setDialogTitle] = useState<string>("");
  const [dialogGeometry, setDialogGeometry] = useState<{ width?: number; height?: number } | null>(
    null,
  );
  const [tabPosition, setTabPosition] = useState<string>("");
  const [sizeGripEnabled, setSizeGripEnabled] = useState<boolean | null>(null);
  const [activeGroup, setActiveGroup] = useState<string>("platform");
  const [activeStackIndex, setActiveStackIndex] = useState(0);
  const [showAllStacks, setShowAllStacks] = useState(false);
  const [stackSwitchHints, setStackSwitchHints] = useState<
    Array<{
      stack: string;
      option: string;
      when_true: number;
      when_false: number;
      preview_only?: boolean;
      note?: string;
    }>
  >([]);
  const [optionEnable, setOptionEnable] = useState<
    Array<{ target: string; when_option: string; when_in: string[]; note?: string }>
  >([]);
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
  const [expectWalkthroughText, setExpectWalkthroughText] = useState<string | null>(null);
  const [sshAuthNote, setSshAuthNote] = useState<string | null>(null);
  const [hardGaps, setHardGaps] = useState<string[]>([]);
  const [hardGapsNote, setHardGapsNote] = useState<string | null>(null);
  const [hardGapNotes, setHardGapNotes] = useState<Record<string, string>>({});
  const [hardGapClosure, setHardGapClosure] = useState<Record<string, string>>({});
  const [hardGapsClosurePath, setHardGapsClosurePath] = useState<string | null>(null);
  const [hardGapCount, setHardGapCount] = useState<number | null>(null);
  const [hardGapsClosureText, setHardGapsClosureText] = useState<string | null>(null);
  const [layoutFidelityPath, setLayoutFidelityPath] = useState<string | null>(null);
  const [hardGapsPayload, setHardGapsPayload] = useState<Record<string, unknown> | null>(null);
  const [signalCatalogSummary, setSignalCatalogSummary] = useState<string | null>(null);
  const [signalCatalogDetail, setSignalCatalogDetail] = useState<string | null>(null);
  const [stackSwitchPath, setStackSwitchPath] = useState<string | null>(null);
  const [optionEnablePath, setOptionEnablePath] = useState<string | null>(null);
  const [expectRunPath, setExpectRunPath] = useState<string | null>(null);
  const [expectStepsPath, setExpectStepsPath] = useState<string | null>(null);
  const [expectStepsRefusalsPath, setExpectStepsRefusalsPath] = useState<string | null>(null);
  const [expectPlanStepIds, setExpectPlanStepIds] = useState<string[]>([]);
  const [expectPlanStepNotes, setExpectPlanStepNotes] = useState<Record<string, string>>({});
  const [expectProbeStep, setExpectProbeStep] = useState<string>("ssh_open");
  const [expectRefusalsText, setExpectRefusalsText] = useState<string | null>(null);
  const [passwordSshPath, setPasswordSshPath] = useState<string | null>(null);
  const [sshAuthPath, setSshAuthPath] = useState<string | null>(null);
  const [sshRefusalSummary, setSshRefusalSummary] = useState<string | null>(null);
  const [sshAlternativeNotes, setSshAlternativeNotes] = useState<Record<string, string>>({});
  const [sshRefusalPathNotes, setSshRefusalPathNotes] = useState<Record<string, string>>({});
  const [softCompletePhase, setSoftCompletePhase] = useState<string | null>(null);
  const [honestyMilestone, setHonestyMilestone] = useState<number | null>(null);
  const [hardGapsOpenLabels, setHardGapsOpenLabels] = useState<Record<string, string> | null>(null);
  const [hardGapsClosureTitles, setHardGapsClosureTitles] = useState<Record<string, string> | null>(null);
  const [hardGapRelatedRefusalTitles, setHardGapRelatedRefusalTitles] = useState<Record<string, string> | null>(null);
  const [relatedRefusalsDetail, setRelatedRefusalsDetail] = useState<string | null>(null);
  const [expectPlanStepTitles, setExpectPlanStepTitles] = useState<Record<string, string> | null>(null);
  const [sshAlternativeTitles, setSshAlternativeTitles] = useState<Record<string, string> | null>(null);
  const [honestyPathTitles, setHonestyPathTitles] = useState<Record<string, string> | null>(null);
  const [honestyPathNotes, setHonestyPathNotes] = useState<Record<string, string> | null>(null);
  const [honestyPathNotesCount, setHonestyPathNotesCount] = useState<number | null>(null);
  const [softFertigSurfaceKeyCount, setSoftFertigSurfaceKeyCount] = useState<number | null>(null);
  const [softFertigSurfaceKeyTitles, setSoftFertigSurfaceKeyTitles] = useState<Record<string, string> | null>(null);
  const [softFertigSurfaceKeys, setSoftFertigSurfaceKeys] = useState<string[] | null>(null);
  const [softFertigSurfaceDetail, setSoftFertigSurfaceDetail] = useState<string | null>(null);
  const [softFertigSurfaceNotesCount, setSoftFertigSurfaceNotesCount] = useState<number | null>(null);
  const [honestyMilestoneNote, setHonestyMilestoneNote] = useState<string | null>(null);
  const [softFertigHonestyTrack, setSoftFertigHonestyTrack] = useState<boolean | null>(null);
  const [honestyPathsSummary, setHonestyPathsSummary] = useState<string | null>(null);
  const [honestyPathsDetail, setHonestyPathsDetail] = useState<string | null>(null);
  const [hardGapsSummaryPath, setHardGapsSummaryPath] = useState<string | null>(null);
  const [hardGapsSummaryText, setHardGapsSummaryText] = useState<string | null>(null);
  const [hardGapsSummaryFidelity, setHardGapsSummaryFidelity] = useState<string | null>(null);
  const [hardGapsSummaryFidelityTitle, setHardGapsSummaryFidelityTitle] = useState<
    string | null
  >(null);
  const [stackSwitchSummary, setStackSwitchSummary] = useState<string | null>(null);
  const [layoutFidelity, setLayoutFidelity] = useState<string | null>(null);
  const [resHint, setResHint] = useState<string | null>(null);

  async function reload() {
    onBusy?.(true);
    onError?.(null);
    try {
      const plat = platform || "nftables";
      const [o, m, schema, cfgList, resSt, sshAuth, gaps] = await Promise.all([
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
        fetchHardGaps().catch(() => null),
      ]);
      if (sshAuth?.note) {
        const alt = sshAuth.alternatives?.length
          ? ` Alternatives: ${sshAuth.alternatives.join(", ")}.`
          : "";
        const only = sshAuth.batch_mode_only ? " BatchMode only." : "";
        setSshAuthNote(`${sshAuth.note}${only}${alt}`.trim());
      }
      else setSshAuthNote(null);
      if (gaps?.hard_gap_open?.length) setHardGaps(gaps.hard_gap_open);
      else if (resSt?.hard_gap_open?.length) setHardGaps(resSt.hard_gap_open);
      else setHardGaps([]);
      setHardGapsNote(gaps?.note || null);
      setHardGapNotes(gaps?.hard_gap_notes || {});
      setHardGapClosure(gaps?.hard_gap_closure || {});
      setHardGapsClosurePath(gaps?.closure_path || "/api/v1/hard-gaps/closure");
      setHardGapsSummaryPath(gaps?.summary_path || "/api/v1/hard-gaps/summary");
      setHardGapCount(
        typeof gaps?.hard_gap_count === "number"
          ? gaps.hard_gap_count
          : gaps?.hard_gap_open?.length ?? null,
      );
      setLayoutFidelityPath(gaps?.layout_fidelity_path || "/api/v1/layout-fidelity");
      if (gaps) {
        setHardGapsPayload(gaps as unknown as Record<string, unknown>);
        try {
          sessionStorage.setItem(
            hardGapsSnapshotKey(firewallId),
            JSON.stringify(gaps, null, 2),
          );
        } catch {
          /* ignore */
        }
      }
      const cat = gaps?.layout_fidelity_signal_catalog;
      if (cat) {
        const n =
          (cat.fields?.length || 0) + (cat.pages?.length || 0) + (cat.chrome?.length || 0);
        setSignalCatalogSummary(n ? `Fidelity signal catalog: ${n} keys` : null);
        const lines = [
          cat.fields?.length ? `fields: ${cat.fields.join(", ")}` : "",
          cat.pages?.length ? `pages: ${cat.pages.join(", ")}` : "",
          cat.chrome?.length ? `chrome: ${cat.chrome.join(", ")}` : "",
        ].filter(Boolean);
        setSignalCatalogDetail(lines.length ? lines.join("\n") : null);
      } else {
        setSignalCatalogSummary(null);
        setSignalCatalogDetail(null);
      }
      setStackSwitchPath(gaps?.stack_switch_path || "/api/v1/stack-switch");
      setOptionEnablePath(gaps?.option_enable_path || "/api/v1/option-enable");
      setExpectRunPath(gaps?.expect_run_path || "/api/v1/expect-install-plan/run");
      setExpectStepsPath(gaps?.expect_steps_path || "/api/v1/expect-install-plan/steps");
      setExpectStepsRefusalsPath(
        gaps?.expect_steps_refusals_path || "/api/v1/expect-install-plan/steps/refusals",
      );
      let stepIds = gaps?.expect_plan_step_ids || [];
      if (!stepIds.length) {
        try {
          const cat = await fetchExpectPlanSteps();
          stepIds = cat.canonical_step_ids || [];
        } catch {
          /* catalog optional */
        }
      }
      setExpectPlanStepIds(stepIds);
      setExpectPlanStepNotes(gaps?.expect_plan_step_notes || {});
      if (stepIds.length) {
        setExpectProbeStep((cur) => (stepIds.includes(cur) ? cur : stepIds[0] || "ssh_open"));
      }
      setPasswordSshPath(gaps?.password_ssh_path || "/api/v1/ssh-auth/password");
      setSshAuthPath(gaps?.ssh_auth_path || "/api/v1/ssh-auth");
      if (gaps?.ssh_refusal_paths && Object.keys(gaps.ssh_refusal_paths).length) {
        const parts = Object.entries(gaps.ssh_refusal_paths).map(([k, v]) => `${k}→${v}`);
        const alts = gaps.ssh_alternatives?.length
          ? `; alternatives: ${gaps.ssh_alternatives.join(", ")}`
          : "";
        setSshRefusalSummary(
          `SSH refusals${gaps.ssh_batch_mode_only ? " (BatchMode only)" : ""}: ${parts.join(", ")}${alts}`,
        );
      } else {
        setSshRefusalSummary(null);
      }
      setSshAlternativeNotes(gaps?.ssh_alternative_notes || {});
      setSshRefusalPathNotes(gaps?.ssh_refusal_path_notes || {});
      setSoftCompletePhase(gaps?.soft_complete_phase || resSt?.soft_complete_phase || null);
      setHonestyMilestone(
        typeof gaps?.honesty_milestone === "number" ? gaps.honesty_milestone : null,
      );
      setHardGapsOpenLabels(
        gaps?.hard_gap_open_labels && typeof gaps.hard_gap_open_labels === "object"
          ? (gaps.hard_gap_open_labels as Record<string, string>)
          : null,
      );
      setHardGapsClosureTitles(
        gaps?.hard_gap_closure_titles && typeof gaps.hard_gap_closure_titles === "object"
          ? (gaps.hard_gap_closure_titles as Record<string, string>)
          : null,
      );
      setHardGapRelatedRefusalTitles(
        gaps?.hard_gap_related_refusal_titles &&
          typeof gaps.hard_gap_related_refusal_titles === "object"
          ? (gaps.hard_gap_related_refusal_titles as Record<string, string>)
          : null,
      );
      {
        const refs =
          gaps?.hard_gap_related_refusals &&
          typeof gaps.hard_gap_related_refusals === "object"
            ? (gaps.hard_gap_related_refusals as Record<string, Record<string, unknown>>)
            : null;
        const titles =
          gaps?.hard_gap_related_refusal_titles &&
          typeof gaps.hard_gap_related_refusal_titles === "object"
            ? (gaps.hard_gap_related_refusal_titles as Record<string, string>)
            : {};
        if (refs && Object.keys(refs).length) {
          setRelatedRefusalsDetail(
            Object.entries(refs)
              .map(([k, v]) => {
                const title = titles[k];
                const note = typeof v?.note === "string" ? v.note : "";
                const bits = Object.entries(v)
                  .filter(([ik]) => ik !== "note")
                  .map(([ik, iv]) => `${ik}=${String(iv)}`)
                  .join(", ");
                let line = title ? `${k} (${title})` : k;
                if (bits) line += `: ${bits}`;
                if (note) line += ` — ${note}`;
                return line;
              })
              .join("\n"),
          );
        } else {
          setRelatedRefusalsDetail(null);
        }
      }
      setExpectPlanStepTitles(
        gaps?.expect_plan_step_titles && typeof gaps.expect_plan_step_titles === "object"
          ? (gaps.expect_plan_step_titles as Record<string, string>)
          : null,
      );
      setSshAlternativeTitles(
        gaps?.ssh_alternative_titles && typeof gaps.ssh_alternative_titles === "object"
          ? (gaps.ssh_alternative_titles as Record<string, string>)
          : null,
      );
      setHonestyPathTitles(
        gaps?.honesty_path_titles && typeof gaps.honesty_path_titles === "object"
          ? (gaps.honesty_path_titles as Record<string, string>)
          : null,
      );
      setHonestyPathNotes(
        gaps?.honesty_path_notes && typeof gaps.honesty_path_notes === "object"
          ? (gaps.honesty_path_notes as Record<string, string>)
          : null,
      );
      setHonestyPathNotesCount(
        typeof gaps?.honesty_path_notes_count === "number"
          ? gaps.honesty_path_notes_count
          : null,
      );
      setSoftFertigSurfaceKeyCount(
        typeof gaps?.soft_fertig_surface_key_count === "number"
          ? gaps.soft_fertig_surface_key_count
          : null,
      );
      setSoftFertigSurfaceKeyTitles(
        gaps?.soft_fertig_surface_key_titles &&
          typeof gaps.soft_fertig_surface_key_titles === "object"
          ? (gaps.soft_fertig_surface_key_titles as Record<string, string>)
          : null,
      );
      {
        const keys = Array.isArray(gaps?.soft_fertig_surface_keys)
          ? (gaps.soft_fertig_surface_keys as string[])
          : null;
        const titles =
          gaps?.soft_fertig_surface_key_titles &&
          typeof gaps.soft_fertig_surface_key_titles === "object"
            ? (gaps.soft_fertig_surface_key_titles as Record<string, string>)
            : {};
        const notes =
          gaps?.soft_fertig_surface_notes &&
          typeof gaps.soft_fertig_surface_notes === "object"
            ? (gaps.soft_fertig_surface_notes as Record<string, string>)
            : {};
        setSoftFertigSurfaceKeys(keys);
        setSoftFertigSurfaceNotesCount(
          typeof gaps?.soft_fertig_surface_notes_count === "number"
            ? gaps.soft_fertig_surface_notes_count
            : keys
              ? keys.filter((k) => notes[k]).length
              : null,
        );
        setSoftFertigSurfaceDetail(
          keys && keys.length
            ? keys
                .map((k) => {
                  const title = titles[k];
                  const note = notes[k];
                  let line = title ? `${k}: ${title}` : k;
                  if (note) line += ` — ${note}`;
                  return line;
                })
                .join("\n")
            : null,
        );
      }
      setHonestyMilestoneNote(gaps?.honesty_milestone_note || null);
      setSoftFertigHonestyTrack(
        typeof gaps?.soft_fertig_honesty_track === "boolean"
          ? gaps.soft_fertig_honesty_track
          : null,
      );
      if (gaps?.honesty_paths && Object.keys(gaps.honesty_paths).length) {
        const entries = Object.entries(gaps.honesty_paths);
        const n =
          typeof gaps.honesty_paths_count === "number"
            ? gaps.honesty_paths_count
            : entries.length;
        const titles =
          gaps?.honesty_path_titles && typeof gaps.honesty_path_titles === "object"
            ? (gaps.honesty_path_titles as Record<string, string>)
            : {};
        const notes =
          gaps?.honesty_path_notes && typeof gaps.honesty_path_notes === "object"
            ? (gaps.honesty_path_notes as Record<string, string>)
            : {};
        setHonestyPathsSummary(`Honesty paths: ${n}`);
        setHonestyPathsDetail(
          entries
            .map(([k, v]) => {
              const title = titles[k];
              const note = notes[k];
              let line = title ? `${k} (${title}): ${v}` : `${k}: ${v}`;
              if (note) line += ` — ${note}`;
              return line;
            })
            .join("\n"),
        );
      } else {
        setHonestyPathsSummary(null);
        setHonestyPathsDetail(null);
      }
      if (
        typeof gaps?.layout_fidelity_sample_score_percent === "number" &&
        gaps.layout_fidelity_pixel_parity === false
      ) {
        const parts =
          typeof gaps.layout_fidelity_sample_score_parts_count === "number"
            ? `, parts=${gaps.layout_fidelity_sample_score_parts_count}`
            : "";
        const plat = gaps.layout_fidelity_sample_platform || "iptables";
        const hos = gaps.layout_fidelity_sample_host_os || "linux24";
        const spacerBits = [
          typeof gaps.layout_fidelity_sample_spacers === "number"
            ? `spacers=${gaps.layout_fidelity_sample_spacers}`
            : "",
          typeof gaps.layout_fidelity_sample_spacers_with_orientation === "number"
            ? `orient=${gaps.layout_fidelity_sample_spacers_with_orientation}`
            : "",
          typeof gaps.layout_fidelity_sample_spacers_with_size_type === "number"
            ? `sizeType=${gaps.layout_fidelity_sample_spacers_with_size_type}`
            : "",
          typeof gaps.layout_fidelity_sample_spacers_with_size_hint === "number"
            ? `sizeHint=${gaps.layout_fidelity_sample_spacers_with_size_hint}`
            : "",
          typeof gaps.layout_fidelity_sample_with_size_policy === "number"
            ? `sizePolicy=${gaps.layout_fidelity_sample_with_size_policy}`
            : "",
          typeof gaps.layout_fidelity_sample_with_size_policy_expanding === "number"
            ? `expanding=${gaps.layout_fidelity_sample_with_size_policy_expanding}`
            : "",
          typeof gaps.layout_fidelity_sample_with_size_policy_fixed === "number"
            ? `fixed=${gaps.layout_fidelity_sample_with_size_policy_fixed}`
            : "",
          typeof gaps.layout_fidelity_sample_with_size_policy_minimum === "number"
            ? `minimum=${gaps.layout_fidelity_sample_with_size_policy_minimum}`
            : "",
          typeof gaps.layout_fidelity_sample_with_size_policy_preferred === "number"
            ? `preferred=${gaps.layout_fidelity_sample_with_size_policy_preferred}`
            : "",
          typeof gaps.layout_fidelity_sample_with_minimum_size === "number"
            ? `minSize=${gaps.layout_fidelity_sample_with_minimum_size}`
            : "",
          typeof gaps.layout_fidelity_sample_with_maximum_size === "number"
            ? `maxSize=${gaps.layout_fidelity_sample_with_maximum_size}`
            : "",
          typeof gaps.layout_fidelity_sample_layout_tree_max_depth === "number"
            ? `treeDepth=${gaps.layout_fidelity_sample_layout_tree_max_depth}`
            : "",
          typeof gaps.layout_fidelity_sample_buddy_labels === "number"
            ? `buddies=${gaps.layout_fidelity_sample_buddy_labels}`
            : "",
          typeof gaps.layout_fidelity_sample_stacked_sections === "number"
            ? `stacked=${gaps.layout_fidelity_sample_stacked_sections}`
            : "",
          typeof gaps.layout_fidelity_sample_empty_stacked_sections === "number"
            ? `emptyStacked=${gaps.layout_fidelity_sample_empty_stacked_sections}`
            : "",
          typeof gaps.layout_fidelity_sample_sections_with_flat === "number"
            ? `flat=${gaps.layout_fidelity_sample_sections_with_flat}`
            : "",
          typeof gaps.layout_fidelity_sample_sections_with_checkable === "number"
            ? `checkable=${gaps.layout_fidelity_sample_sections_with_checkable}`
            : "",
          typeof gaps.layout_fidelity_sample_annotations === "number"
            ? `annotations=${gaps.layout_fidelity_sample_annotations}`
            : "",
          typeof gaps.layout_fidelity_sample_pages_with_column_stretch === "number"
            ? `colStretch=${gaps.layout_fidelity_sample_pages_with_column_stretch}`
            : "",
          typeof gaps.layout_fidelity_sample_pages_with_spacing === "number"
            ? `spacing=${gaps.layout_fidelity_sample_pages_with_spacing}`
            : "",
          typeof gaps.layout_fidelity_sample_pages_with_layout_tree === "number"
            ? `layoutTree=${gaps.layout_fidelity_sample_pages_with_layout_tree}`
            : "",
          gaps.layout_fidelity_sample_chrome_geometry === true
            ? "geometry=1"
            : gaps.layout_fidelity_sample_chrome_geometry === false
              ? "geometry=0"
              : "",
          gaps.layout_fidelity_sample_chrome_size_grip_enabled === true
            ? "sizeGrip=1"
            : gaps.layout_fidelity_sample_chrome_size_grip_enabled === false
              ? "sizeGrip=0"
              : "",
          typeof gaps.layout_fidelity_sample_fields === "number"
            ? `fields=${gaps.layout_fidelity_sample_fields}`
            : "",
          typeof gaps.layout_fidelity_sample_with_grid === "number"
            ? `grid=${gaps.layout_fidelity_sample_with_grid}`
            : "",
          typeof gaps.layout_fidelity_sample_with_label === "number"
            ? `labels=${gaps.layout_fidelity_sample_with_label}`
            : "",
          typeof gaps.layout_fidelity_sample_with_tooltip === "number"
            ? `tooltips=${gaps.layout_fidelity_sample_with_tooltip}`
            : "",
          typeof gaps.layout_fidelity_sample_with_visible === "number"
            ? `visible=${gaps.layout_fidelity_sample_with_visible}`
            : "",
          typeof gaps.layout_fidelity_sample_with_whats_this === "number"
            ? `whatsThis=${gaps.layout_fidelity_sample_with_whats_this}`
            : "",
          typeof gaps.layout_fidelity_sample_with_enabled === "number"
            ? `enabled=${gaps.layout_fidelity_sample_with_enabled}`
            : "",
          typeof gaps.layout_fidelity_sample_with_alignment === "number"
            ? `align=${gaps.layout_fidelity_sample_with_alignment}`
            : "",
          typeof gaps.layout_fidelity_sample_with_read_only === "number"
            ? `readOnly=${gaps.layout_fidelity_sample_with_read_only}`
            : "",
          typeof gaps.layout_fidelity_sample_pages_with_row_stretch === "number"
            ? `rowStretch=${gaps.layout_fidelity_sample_pages_with_row_stretch}`
            : "",
          typeof gaps.layout_fidelity_sample_pages_with_tooltip === "number"
            ? `pageTip=${gaps.layout_fidelity_sample_pages_with_tooltip}`
            : "",
          typeof gaps.layout_fidelity_sample_with_external_label === "number"
            ? `extLabel=${gaps.layout_fidelity_sample_with_external_label}`
            : "",
          typeof gaps.layout_fidelity_sample_pages_with_buddy_labels === "number"
            ? `pageBuddies=${gaps.layout_fidelity_sample_pages_with_buddy_labels}`
            : "",
          typeof gaps.layout_fidelity_sample_pages === "number"
            ? `pages=${gaps.layout_fidelity_sample_pages}`
            : "",
          typeof gaps.layout_fidelity_sample_sections === "number"
            ? `sections=${gaps.layout_fidelity_sample_sections}`
            : "",
          typeof gaps.layout_fidelity_sample_stack_names_count === "number"
            ? `stacks=${gaps.layout_fidelity_sample_stack_names_count}`
            : "",
          gaps.layout_fidelity_sample_chrome_window_title === true
            ? "windowTitle=1"
            : gaps.layout_fidelity_sample_chrome_window_title === false
              ? "windowTitle=0"
              : "",
          gaps.layout_fidelity_sample_chrome_tab_position === true
            ? "tabPos=1"
            : gaps.layout_fidelity_sample_chrome_tab_position === false
              ? "tabPos=0"
              : "",
          typeof gaps.layout_fidelity_sample_signal_key_count === "number"
            ? `signalKeys=${gaps.layout_fidelity_sample_signal_key_count}`
            : "",
          typeof gaps.layout_fidelity_sample_key_count === "number"
            ? `sampleKeys=${gaps.layout_fidelity_sample_key_count}`
            : "",
          gaps.layout_fidelity_sample_catalog_complete === true
            ? "catalog=1"
            : gaps.layout_fidelity_sample_catalog_complete === false
              ? "catalog=0"
              : "",
          typeof gaps.layout_fidelity_alt_sample_score_percent === "number"
            ? `alt=${gaps.layout_fidelity_alt_sample_platform || "?"}/${gaps.layout_fidelity_alt_sample_host_os || "?"}:${gaps.layout_fidelity_alt_sample_score_percent}%`
            : "",
          typeof gaps.layout_fidelity_alt_sample_buddy_labels === "number"
            ? `altBuddies=${gaps.layout_fidelity_alt_sample_buddy_labels}`
            : "",
          typeof gaps.layout_fidelity_alt_sample_pages_with_buddy_labels === "number"
            ? `altPageBuddies=${gaps.layout_fidelity_alt_sample_pages_with_buddy_labels}`
            : "",
          typeof gaps.layout_fidelity_alt_sample_with_external_label === "number"
            ? `altExtLabel=${gaps.layout_fidelity_alt_sample_with_external_label}`
            : "",
          typeof gaps.layout_fidelity_alt2_sample_score_percent === "number"
            ? `alt2=${gaps.layout_fidelity_alt2_sample_platform || "?"}/${gaps.layout_fidelity_alt2_sample_host_os || "?"}:${gaps.layout_fidelity_alt2_sample_score_percent}%`
            : "",
          typeof gaps.layout_fidelity_alt2_sample_with_enabled === "number"
            ? `alt2Enabled=${gaps.layout_fidelity_alt2_sample_with_enabled}`
            : "",
        ]
          .filter(Boolean)
          .join(", ");
        {
          const full =
            `Sample fidelity ${plat}/${hos}: ${gaps.layout_fidelity_sample_score_percent}%${parts}` +
            (spacerBits ? `; ${spacerBits}` : "") +
            " (not pixel)";
          const fmt = formatSampleFidelityLine(full);
          setHardGapsSummaryFidelity(fmt.display);
          setHardGapsSummaryFidelityTitle(fmt.title);
        }
      }
      try {
        const fid = await fetchLayoutFidelity(plat, hostOs || "");
        if (fid.ok && fid.score_percent != null) {
          const pages = fid.pages as
            | {
                stacked_sections?: number;
                with_visible?: number;
                sections_with_flat?: number;
                buddy_labels?: number;
                layout_tree_max_depth?: number;
              }
            | undefined;
          const fields = fid.fields as { with_visible?: number } | undefined;
          const stacked = Number(pages?.stacked_sections || 0);
          const vis = Number(fields?.with_visible || 0);
          const treeDepth = Number(pages?.layout_tree_max_depth || 0);
          const sigN =
            (fid.signal_keys?.fields?.length || 0) +
            (fid.signal_keys?.pages?.length || 0) +
            (fid.signal_keys?.chrome?.length || 0);
          const partsN = fid.score_parts_count || 0;
          setLayoutFidelity(
            `${fid.score_percent}% .ui signals (${fid.dialog || plat}` +
              (stacked ? `; stacked×${stacked}` : "") +
              (vis ? `; visible×${vis}` : "") +
              (treeDepth ? `; layout_tree≤${treeDepth}` : "") +
              (sigN ? `; keys×${sigN}` : "") +
              (partsN ? `; weights×${partsN}` : "") +
              "; not pixel parity)",
          );
        } else {
          setLayoutFidelity(null);
        }
      } catch {
        setLayoutFidelity(null);
      }
      try {
        const sw = await fetchStackSwitch(plat, hostOs || "");
        const optN = sw.option_stack_switch?.length || 0;
        const ifaceTypes = sw.iface_stack_switch?.by_type
          ? Object.keys(sw.iface_stack_switch.by_type).length
          : 0;
        const enN = (sw.option_enable?.length || 0) + (sw.iface_option_enable?.length || 0);
        if (optN || ifaceTypes || enN) {
          setStackSwitchSummary(
            `stack-switch: option maps ${optN}` +
              (ifaceTypes ? ` · iface types ${ifaceTypes}` : "") +
              (enN ? ` · enable rules ${enN}` : "") +
              " (preview/follow)",
          );
        } else {
          setStackSwitchSummary(null);
        }
      } catch {
        setStackSwitchSummary(null);
      }
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
        const expectRaw = sessionStorage.getItem(expectPlanKey(firewallId));
        if (expectRaw) setExpectPlanText(expectRaw);
        const walkRaw = sessionStorage.getItem(expectWalkthroughKey(firewallId));
        if (walkRaw) setExpectWalkthroughText(walkRaw);
        const closureRaw = sessionStorage.getItem(hardGapClosureKey(firewallId));
        if (closureRaw) setHardGapsClosureText(closureRaw);
        const refusalsRaw = sessionStorage.getItem(expectRefusalsKey(firewallId));
        if (refusalsRaw) setExpectRefusalsText(refusalsRaw);
        const gapsSnap = sessionStorage.getItem(hardGapsSnapshotKey(firewallId));
        if (gapsSnap && !gaps) {
          try {
            setHardGapsPayload(JSON.parse(gapsSnap) as Record<string, unknown>);
          } catch {
            /* ignore */
          }
        }
        const summaryRaw = sessionStorage.getItem(hardGapsSummaryKey(firewallId));
        if (summaryRaw) setHardGapsSummaryText(summaryRaw);
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
        setDialogTitle(schema.window_title || "");
        setDialogGeometry(schema.geometry || null);
        setTabPosition(schema.tab_position || "");
        setSizeGripEnabled(
          typeof schema.size_grip_enabled === "boolean" ? schema.size_grip_enabled : null,
        );
        setFields(schema.fields ?? {});
        setDefaults(schema.defaults ?? {});
        setStackSwitchHints(schema.stack_switch ?? []);
        setOptionEnable(schema.option_enable ?? []);
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
        setStackSwitchHints([]);
        setOptionEnable([]);
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

  const stackedPages = useMemo(() => {
    const secs = activeGroupMeta?.sections || [];
    return secs
      .filter((s) => s.stacked)
      .slice()
      .sort((a, b) => (a.stack_index ?? 0) - (b.stack_index ?? 0));
  }, [activeGroupMeta]);

  useEffect(() => {
    if (!stackedPages.length) {
      setShowAllStacks(false);
      return;
    }
    let preferred = stackedPages[0]?.stack_index ?? 0;
    try {
      const stored = sessionStorage.getItem(
        `fwbweb.optionStackIndex.${platform || "unknown"}.${hostOs || ""}.${activeGroup}`,
      );
      if (stored != null) {
        const n = Number(stored);
        if (stackedPages.some((s) => s.stack_index === n)) preferred = n;
      }
    } catch {
      /* ignore */
    }
    setActiveStackIndex(preferred);
    setShowAllStacks(false);
  }, [activeGroup, platform, hostOs, stackedPages]);

  useEffect(() => {
    if (!stackedPages.length) return;
    try {
      sessionStorage.setItem(
        `fwbweb.optionStackIndex.${platform || "unknown"}.${hostOs || ""}.${activeGroup}`,
        String(activeStackIndex),
      );
    } catch {
      /* ignore */
    }
  }, [activeStackIndex, activeGroup, platform, hostOs, stackedPages.length]);

  // Follow desktop stack switches driven by a bool option (e.g. use_ULOG → logTargetStack).
  useEffect(() => {
    if (!stackedPages.length || !stackSwitchHints.length || showAllStacks) return;
    const stackName = stackedPages[0]?.stack;
    const hint = stackSwitchHints.find((h) => h.stack === stackName);
    if (!hint?.option) return;
    const raw = (options[hint.option] ?? "").trim().toLowerCase();
    const truthy = raw === "true" || raw === "1" || raw === "yes";
    const next = truthy ? hint.when_true : hint.when_false;
    if (stackedPages.some((s) => s.stack_index === next)) {
      setActiveStackIndex(next);
    }
  }, [options, stackedPages, stackSwitchHints, showAllStacks]);

  const effectiveFields = useMemo(() => {
    if (!optionEnable.length) return fields;
    const next: Record<string, OptionFieldMeta> = { ...fields };
    for (const rule of optionEnable) {
      const raw = (options[rule.when_option] ?? "").trim();
      const ok = rule.when_in.includes(raw);
      const prev = next[rule.target] || { type: "string" as const };
      next[rule.target] = { ...prev, enabled: ok };
    }
    return next;
  }, [fields, optionEnable, options]);

  const optionSections = useMemo(() => {
    if (filter.trim() || showAll || !activeGroupMeta?.sections?.length) {
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
  }, [filter, showAll, activeGroupMeta, keys, activeStackIndex, showAllStacks]);

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

  const dialogMaxHeight =
    dialogGeometry?.height && dialogGeometry.height > 0
      ? `${Math.min(dialogGeometry.height, 720)}px`
      : undefined;

  return (
    <div
      className="firewall-extras"
      style={
        dialogMaxHeight
          ? ({ ["--fwb-dialog-max-height"]: dialogMaxHeight } as CSSProperties)
          : undefined
      }
    >
      <header className="panel-header">
        <h3>
          Platform / installer options
          {compiler ? <span className="muted"> · {compiler}</span> : null}
          {dialogName ? <span className="muted"> · {dialogName}</span> : null}
          {dialogTitle ? <span className="muted"> · {dialogTitle}</span> : null}
          {dialogGeometry?.width && dialogGeometry?.height ? (
            <span className="muted">
              {" "}
              · {dialogGeometry.width}×{dialogGeometry.height}
            </span>
          ) : null}
          {tabPosition ? <span className="muted"> · tabs {tabPosition}</span> : null}
          {sizeGripEnabled === true ? <span className="muted"> · sizeGrip</span> : null}
          {layoutFidelity ? <span className="muted"> · fidelity {layoutFidelity}</span> : null}
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
              title={g.tooltip || undefined}
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
            {activeGroupMeta.row_stretch?.length
              ? ` · rows ${activeGroupMeta.row_stretch.join(":")}`
              : ""}
            {activeGroupMeta.layout_tree?.length
              ? ` · tree×${activeGroupMeta.layout_tree.length}`
              : ""}
            {activeGroupMeta.spacing &&
            (activeGroupMeta.spacing.vertical != null ||
              activeGroupMeta.spacing.horizontal != null ||
              activeGroupMeta.spacing.spacing != null)
              ? ` · gap ${activeGroupMeta.spacing.vertical ?? activeGroupMeta.spacing.spacing ?? "·"}/${activeGroupMeta.spacing.horizontal ?? activeGroupMeta.spacing.spacing ?? "·"}`
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
      {!filter.trim() && !showAll && stackedPages.length > 1 ? (
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
                  ? "Empty QStackedWidget page"
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
      {optionSections.map((sec, secIdx) => {
        const pageSpacers =
          useQtGridLayout && secIdx === 0 ? activeGroupMeta?.spacers || [] : [];
        const pageStretch =
          useQtGridLayout && secIdx === 0 ? activeGroupMeta?.column_stretch || [] : [];
        const pageRowStretch =
          useQtGridLayout && secIdx === 0 ? activeGroupMeta?.row_stretch || [] : [];
        const pageNotes =
          useQtGridLayout && secIdx === 0 ? activeGroupMeta?.annotations || [] : [];
        const pageBuddyLabels =
          useQtGridLayout && secIdx === 0 ? activeGroupMeta?.buddy_labels || [] : [];
        const pageSpacing =
          useQtGridLayout && secIdx === 0 ? activeGroupMeta?.spacing || {} : {};
        const grid = useQtGridLayout
          ? qtGridStyle(
              sec.keys,
              effectiveFields,
              pageSpacers,
              pageStretch,
              [...pageNotes, ...pageBuddyLabels],
              pageSpacing,
              pageRowStretch,
            )
          : { className: "typed-grid options-grid" };
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
                  data-size-type={sp.size_type || undefined}
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
                  meta={effectiveFields[key]}
                  disabled={busy}
                  onChange={(v) => setOptions((prev) => ({ ...prev, [key]: v }))}
                />
              ))}
              {sec.empty && !sec.keys.length ? (
                <p className="muted">Empty QStackedWidget page (desktop chrome).</p>
              ) : null}
              {!sec.keys.length && !sec.empty ? (
                <p className="muted">No keys in this group.</p>
              ) : null}
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
                        const canon = plan.canonical_step_ids?.length
                          ? `canonical_step_ids=${plan.canonical_step_ids.join(",")}`
                          : "";
                        const lines = [
                          `# expect plan for ${plan.host_os} (executable=${plan.executable})`,
                          plan.note || "",
                          ...(canon ? [canon] : []),
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
                        const text = lines.join("\n");
                        setExpectPlanText(text);
                        try {
                          sessionStorage.setItem(expectPlanKey(firewallId), text);
                        } catch {
                          /* ignore */
                        }
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
                <button
                  type="button"
                  className="ghost"
                  disabled={busy || !hostOs}
                  title="Dry walkthrough: every step preview_only (nothing executed)"
                  onClick={() => {
                    if (!hostOs) return;
                    void (async () => {
                      onBusy?.(true);
                      onError?.(null);
                      try {
                        const wt = await fetchExpectInstallWalkthrough(hostOs, {
                          fwdir: remoteDir || "/etc",
                        });
                        const canon = wt.canonical_step_ids?.length
                          ? `canonical_step_ids=${wt.canonical_step_ids.join(",")}`
                          : "";
                        const lines = [
                          `# expect walkthrough for ${wt.host_os} (all_preview_only=${wt.all_preview_only})`,
                          wt.note || "",
                          ...(canon ? [canon] : []),
                          "",
                          ...wt.steps.map((s, i) => {
                            const mark = s.runnable ? "RUN" : "preview_only";
                            const when = s.simulated_at ? ` @ ${s.simulated_at}` : "";
                            return `${s.ordinal ?? i + 1}. [${s.id}] ${s.title} — ${mark}${when}${
                              s.detail ? `\n   ${s.detail}` : ""
                            }`;
                          }),
                        ];
                        if (wt.timeline_start) {
                          lines.splice(1, 0, `timeline_start=${wt.timeline_start}`);
                        }
                        const text = lines.join("\n");
                        setExpectWalkthroughText(text);
                        try {
                          sessionStorage.setItem(expectWalkthroughKey(firewallId), text);
                        } catch {
                          /* ignore */
                        }
                        onStatus?.(
                          `Expect walkthrough: ${wt.step_count} steps (preview_only)`,
                        );
                      } catch (e) {
                        onError?.(e instanceof Error ? e.message : String(e));
                      } finally {
                        onBusy?.(false);
                      }
                    })();
                  }}
                >
                  Walkthrough (dry)
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy || !expectWalkthroughText}
                  title="Download the last dry walkthrough as text"
                  onClick={() => {
                    if (!expectWalkthroughText) return;
                    const blob = new Blob([expectWalkthroughText + "\n"], {
                      type: "text/plain;charset=utf-8",
                    });
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = `fwbweb-expect-walkthrough-${firewallId || "fw"}.txt`;
                    a.click();
                    URL.revokeObjectURL(url);
                    onStatus?.("Downloaded expect walkthrough");
                  }}
                >
                  Download walkthrough
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy}
                  title="Confirm password/keyboard-interactive SSH is refused (501)"
                  onClick={() => {
                    void (async () => {
                      onBusy?.(true);
                      onError?.(null);
                      try {
                        const r = await refusePasswordSsh();
                        if (r.refused) {
                          const alts = r.alternatives?.length
                            ? `; use ${r.alternatives.join("/")}`
                            : "";
                          onStatus?.(
                            `Password SSH refused (501${r.batch_mode_only ? ", BatchMode only" : ""})${alts}`,
                          );
                        } else {
                          onError?.(`Unexpected SSH auth response: ${r.status}`);
                        }
                      } catch (e) {
                        onError?.(e instanceof Error ? e.message : String(e));
                      } finally {
                        onBusy?.(false);
                      }
                    })();
                  }}
                >
                  Probe password SSH
                </button>
                <label className="muted pad-tight" title="Canonical step id to POST /run (always 501)">
                  Probe step{" "}
                  <select
                    value={expectProbeStep}
                    disabled={busy || !expectPlanStepIds.length}
                    onChange={(e) => setExpectProbeStep(e.target.value)}
                  >
                    {(expectPlanStepIds.length ? expectPlanStepIds : ["ssh_open"]).map((id) => (
                      <option key={id} value={id}>
                        {id}
                      </option>
                    ))}
                    <option value="__unknown_probe__">__unknown_probe__</option>
                  </select>
                </label>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy || !hostOs}
                  title="POST expect run for selected step — always 501"
                  onClick={() => {
                    if (!hostOs) return;
                    const step = expectProbeStep || "ssh_open";
                    void (async () => {
                      onBusy?.(true);
                      onError?.(null);
                      try {
                        const r = await refuseExpectInstallStep(hostOs, step);
                        if (r.refused) {
                          const kind = r.unknown_step
                            ? "unknown_step"
                            : r.error || "expect_installer_not_implemented";
                          onStatus?.(
                            `Expect step ${r.step || step} refused (501, ${kind})`,
                          );
                        } else {
                          onError?.(`Unexpected expect run response: ${r.status}`);
                        }
                      } catch (e) {
                        onError?.(e instanceof Error ? e.message : String(e));
                      } finally {
                        onBusy?.(false);
                      }
                    })();
                  }}
                >
                  Probe expect step
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy || !hostOs}
                  title="GET per-step refusal preview for all canonical ids (nothing executed)"
                  onClick={() => {
                    if (!hostOs) return;
                    void (async () => {
                      onBusy?.(true);
                      onError?.(null);
                      try {
                        const r = await fetchExpectPlanStepRefusals(hostOs);
                        const probe = r.unknown_step_probe;
                        const lines = [
                          `# expect step refusals for ${r.host_os} (all_refused=${r.all_refused})`,
                          r.run_path ? `run_path=${r.run_path}` : "",
                          r.steps_path ? `steps_path=${r.steps_path}` : "",
                          r.note || "",
                          "",
                          ...r.steps.map((s, i) => {
                            const id = s.step || expectPlanStepIds[i] || `step${i + 1}`;
                            return `${i + 1}. [${id}] ${s.error || "refused"}${
                              s.unknown_step ? " (unknown)" : ""
                            }${s.note ? `\n   ${s.note}` : ""}`;
                          }),
                          ...(probe
                            ? [
                                "",
                                `# unknown_step_probe [${probe.step || "?"}] ${
                                  probe.error || "refused"
                                }${probe.unknown_step ? " (unknown)" : ""}`,
                                probe.note ? `   ${probe.note}` : "",
                              ]
                            : []),
                        ].filter((line) => line !== undefined);
                        const text = lines.filter(Boolean).join("\n");
                        setExpectRefusalsText(text);
                        try {
                          sessionStorage.setItem(expectRefusalsKey(firewallId), text);
                        } catch {
                          /* ignore */
                        }
                        onStatus?.(
                          `Expect refusals: ${r.step_count} steps (all 501 preview)` +
                            (probe?.unknown_step ? " + unknown probe" : ""),
                        );
                      } catch (e) {
                        onError?.(e instanceof Error ? e.message : String(e));
                      } finally {
                        onBusy?.(false);
                      }
                    })();
                  }}
                >
                  Preview all step refusals
                </button>
                <button
                  type="button"
                  className="ghost"
                  disabled={busy || !expectRefusalsText}
                  title="Download the last expect step refusals preview"
                  onClick={() => {
                    if (!expectRefusalsText) return;
                    const blob = new Blob([expectRefusalsText + "\n"], {
                      type: "text/plain;charset=utf-8",
                    });
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = `fwbweb-expect-refusals-${firewallId || "fw"}.txt`;
                    a.click();
                    URL.revokeObjectURL(url);
                    onStatus?.("Downloaded expect step refusals");
                  }}
                >
                  Download refusals
                </button>
              </div>
              {expectRefusalsText ? (
                <pre className="deploy-log configlet-preview" tabIndex={0}>
                  {expectRefusalsText}
                </pre>
              ) : null}
              {expectPlanText ? (
                <pre className="deploy-log configlet-preview" tabIndex={0}>
                  {expectPlanText}
                </pre>
              ) : null}
              {expectWalkthroughText ? (
                <pre className="deploy-log configlet-preview" tabIndex={0}>
                  {expectWalkthroughText}
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
        <div className="pad-tight">
          <p className="muted" title="hard_gap_open from /hard-gaps">
            Hard gaps still open
            {hardGapCount != null ? ` (${hardGapCount})` : ""}:{" "}
            <code>{hardGaps.join(", ")}</code>
            {softCompletePhase ? (
              <>
                {" "}
                · soft-complete phase <code>{softCompletePhase}</code>
              </>
            ) : null}
            {hardGapsOpenLabels && Object.keys(hardGapsOpenLabels).length > 0 ? (
              <span className="muted" title={Object.entries(hardGapsOpenLabels).map(([k,v]) => `${k}: ${v}`).join(" · ")}>
                · open labels{" "}
                <code>{Object.keys(hardGapsOpenLabels).length}</code>
              </span>
            ) : null}
            {hardGapsClosureTitles && Object.keys(hardGapsClosureTitles).length > 0 ? (
              <span className="muted" title={Object.entries(hardGapsClosureTitles).map(([k,v]) => `${k}: ${v}`).join(" · ")}>
                · closure titles{" "}
                <code>{Object.keys(hardGapsClosureTitles).length}</code>
              </span>
            ) : null}
            {hardGapRelatedRefusalTitles && Object.keys(hardGapRelatedRefusalTitles).length > 0 ? (
              <span className="muted" title={Object.entries(hardGapRelatedRefusalTitles).map(([k,v]) => `${k}: ${v}`).join(" · ")}>
                · related refusal titles{" "}
                <code>{Object.keys(hardGapRelatedRefusalTitles).length}</code>
              </span>
            ) : null}
            {expectPlanStepTitles && Object.keys(expectPlanStepTitles).length > 0 ? (
              <span className="muted" title={Object.entries(expectPlanStepTitles).map(([k,v]) => `${k}: ${v}`).join(" · ")}>
                · expect step titles{" "}
                <code>{Object.keys(expectPlanStepTitles).length}</code>
              </span>
            ) : null}
            {sshAlternativeTitles && Object.keys(sshAlternativeTitles).length > 0 ? (
              <span className="muted" title={Object.entries(sshAlternativeTitles).map(([k,v]) => `${k}: ${v}`).join(" · ")}>
                · ssh alt titles{" "}
                <code>{Object.keys(sshAlternativeTitles).length}</code>
              </span>
            ) : null}
            {honestyPathTitles && Object.keys(honestyPathTitles).length > 0 ? (
              <span className="muted" title={Object.entries(honestyPathTitles).map(([k,v]) => `${k}: ${v}`).join(" · ")}>
                · honesty path titles{" "}
                <code>{Object.keys(honestyPathTitles).length}</code>
              </span>
            ) : null}
            {honestyPathNotesCount != null && honestyPathNotesCount > 0 ? (
              <span
                className="muted"
                title={
                  honestyPathNotes
                    ? Object.entries(honestyPathNotes).map(([k, v]) => `${k}: ${v}`).join(" · ")
                    : undefined
                }
              >
                · honesty path notes{" "}
                <code>{honestyPathNotesCount}</code>
              </span>
            ) : null}
            {softFertigSurfaceKeyCount != null && softFertigSurfaceKeyCount > 0 ? (
              <span
                className="muted"
                title={
                  softFertigSurfaceKeyTitles
                    ? Object.entries(softFertigSurfaceKeyTitles)
                        .map(([k, v]) => `${k}: ${v}`)
                        .join(" · ")
                    : undefined
                }
              >
                · soft-fertig surface keys{" "}
                <code>{softFertigSurfaceKeyCount}</code>
              </span>
            ) : null}
            {softFertigSurfaceNotesCount != null && softFertigSurfaceNotesCount > 0 ? (
              <span className="muted">
                · surface notes <code>{softFertigSurfaceNotesCount}</code>
              </span>
            ) : null}
            {honestyMilestone != null ? (
              <>
                {" "}
                · honesty milestone <code>{honestyMilestone}</code>
              </>
            ) : null}
            {honestyMilestoneNote ? (
              <span className="muted" title={honestyMilestoneNote}>
                {" "}
                · <em>{honestyMilestoneNote.slice(0, 72)}{honestyMilestoneNote.length > 72 ? "…" : ""}</em>
              </span>
            ) : null}
            {softFertigHonestyTrack != null ? (
              <>
                {" "}
                · soft-fertig track <code>{softFertigHonestyTrack ? "yes" : "no"}</code>
              </>
            ) : null}
            {hardGapsClosurePath ? (
              <>
                {" "}
                · closure <code>{hardGapsClosurePath}</code>
              </>
            ) : null}
            {hardGapsSummaryPath ? (
              <>
                {" "}
                · summary <code>{hardGapsSummaryPath}</code>
              </>
            ) : null}
          </p>
          {hardGapsNote ? <p className="muted">{hardGapsNote}</p> : null}
          {Object.keys(hardGapNotes).length ? (
            <ul className="muted hard-gap-notes">
              {hardGaps.map((g) =>
                hardGapNotes[g] ? (
                  <li key={g}>
                    <code>{g}</code>: {hardGapNotes[g]}
                    {hardGapClosure[g] ? (
                      <span className="muted"> — close when: {hardGapClosure[g]}</span>
                    ) : null}
                  </li>
                ) : null,
              )}
            </ul>
          ) : null}
          {layoutFidelityPath ||
          stackSwitchPath ||
          optionEnablePath ||
          expectRunPath ||
          passwordSshPath ? (
            <p className="muted">
              {layoutFidelityPath ? (
                <>
                  Layout fidelity: <code>{layoutFidelityPath}</code>
                </>
              ) : null}
              {layoutFidelityPath && stackSwitchPath ? " · " : null}
              {stackSwitchPath ? (
                <>
                  Stack switch: <code>{stackSwitchPath}</code>
                </>
              ) : null}
              {(layoutFidelityPath || stackSwitchPath) && optionEnablePath ? " · " : null}
              {optionEnablePath ? (
                <>
                  Option enable: <code>{optionEnablePath}</code>
                </>
              ) : null}
              {(layoutFidelityPath || stackSwitchPath || optionEnablePath) && expectRunPath
                ? " · "
                : null}
              {expectRunPath ? (
                <>
                  Expect run (501): <code>{expectRunPath}</code>
                </>
              ) : null}
              {expectRunPath && passwordSshPath ? " · " : null}
              {passwordSshPath ? (
                <>
                  Password SSH (501): <code>{passwordSshPath}</code>
                </>
              ) : null}
            </p>
          ) : null}
          {stackSwitchSummary ? <p className="muted">{stackSwitchSummary}</p> : null}
          {expectStepsPath || expectStepsRefusalsPath ? (
            <p className="muted" title="GET catalog / per-step refusal previews">
              {expectStepsPath ? (
                <>
                  Expect steps catalog: <code>{expectStepsPath}</code>
                </>
              ) : null}
              {expectStepsPath && expectStepsRefusalsPath ? " · " : null}
              {expectStepsRefusalsPath ? (
                <>
                  Refusals preview: <code>{expectStepsRefusalsPath}</code>
                </>
              ) : null}
            </p>
          ) : null}
          {expectPlanStepIds.length ? (
            <details className="muted" title="Canonical expect plan step ids (all refused by POST /run)">
              <summary>
                Expect steps (all 501
                {Object.keys(expectPlanStepNotes).length
                  ? `, notes=${Object.keys(expectPlanStepNotes).length}`
                  : ""}
                ): <code>{expectPlanStepIds.join(", ")}</code>
              </summary>
              {Object.keys(expectPlanStepNotes).length ? (
                <ul className="muted hard-gap-notes">
                  {expectPlanStepIds.map((id) =>
                    expectPlanStepNotes[id] ? (
                      <li key={id}>
                        <code>{id}</code>: {expectPlanStepNotes[id]}
                      </li>
                    ) : null,
                  )}
                </ul>
              ) : null}
            </details>
          ) : null}
          {sshAuthPath || sshRefusalSummary ? (
            <details className="muted" title="SSH BatchMode-only refusal map from /hard-gaps">
              <summary>
                {sshAuthPath ? (
                  <>
                    SSH auth: <code>{sshAuthPath}</code>
                  </>
                ) : null}
                {sshAuthPath && sshRefusalSummary ? " · " : null}
                {sshRefusalSummary}
              </summary>
              {Object.keys(sshAlternativeNotes).length ? (
                <ul className="muted hard-gap-notes">
                  {Object.entries(sshAlternativeNotes).map(([k, v]) => (
                    <li key={`alt-${k}`}>
                      <code>{k}</code>: {v}
                    </li>
                  ))}
                </ul>
              ) : null}
              {Object.keys(sshRefusalPathNotes).length ? (
                <ul className="muted hard-gap-notes">
                  {Object.entries(sshRefusalPathNotes).map(([k, v]) => (
                    <li key={`ref-${k}`}>
                      <code>{k}</code>: {v}
                    </li>
                  ))}
                </ul>
              ) : null}
            </details>
          ) : null}
          {signalCatalogSummary ? (
            <details className="muted">
              <summary>{signalCatalogSummary}</summary>
              {signalCatalogDetail ? (
                <pre className="deploy-log configlet-preview" tabIndex={0}>
                  {signalCatalogDetail}
                </pre>
              ) : null}
            </details>
          ) : null}
          {honestyPathsSummary ? (
            <details className="muted">
              <summary>{honestyPathsSummary}</summary>
              {honestyPathsDetail ? (
                <pre className="deploy-log configlet-preview" tabIndex={0}>
                  {honestyPathsDetail}
                </pre>
              ) : null}
            </details>
          ) : null}
          {softFertigSurfaceDetail ? (
            <details className="muted">
              <summary>
                Soft-fertig surface keys
                {softFertigSurfaceKeyCount != null
                  ? ` (${softFertigSurfaceKeyCount})`
                  : softFertigSurfaceKeys
                    ? ` (${softFertigSurfaceKeys.length})`
                    : ""}
              </summary>
              <pre className="deploy-log configlet-preview" tabIndex={0}>
                {softFertigSurfaceDetail}
              </pre>
            </details>
          ) : null}
          {relatedRefusalsDetail ? (
            <details className="muted">
              <summary>
                Related hard-gap refusals
                {hardGapRelatedRefusalTitles
                  ? ` (${Object.keys(hardGapRelatedRefusalTitles).length})`
                  : ""}
              </summary>
              <pre className="deploy-log configlet-preview" tabIndex={0}>
                {relatedRefusalsDetail}
              </pre>
            </details>
          ) : null}
          <div className="btn-row pad-tight">
            {hardGapsPayload ? (
              <button
                type="button"
                className="ghost"
                disabled={busy}
                title="Download /hard-gaps JSON (honesty track snapshot)"
                onClick={() => {
                  const text = JSON.stringify(hardGapsPayload, null, 2);
                  try {
                    sessionStorage.setItem(hardGapsSnapshotKey(firewallId), text);
                  } catch {
                    /* ignore */
                  }
                  const blob = new Blob([text + "\n"], { type: "application/json;charset=utf-8" });
                  const url = URL.createObjectURL(blob);
                  const a = document.createElement("a");
                  a.href = url;
                  a.download = `fwbweb-hard-gaps-${firewallId || "fw"}.json`;
                  a.click();
                  URL.revokeObjectURL(url);
                  onStatus?.("Downloaded hard-gaps JSON");
                }}
              >
                Download hard-gaps JSON
              </button>
            ) : null}
            {hardGapsPayload ? (
              <button
                type="button"
                className="ghost"
                disabled={busy}
                title="Copy /hard-gaps JSON to clipboard"
                onClick={() => {
                  void (async () => {
                    const text = JSON.stringify(hardGapsPayload, null, 2) + "\n";
                    try {
                      await navigator.clipboard.writeText(text);
                      onStatus?.("Copied hard-gaps JSON");
                    } catch (e) {
                      onError?.(e instanceof Error ? e.message : String(e));
                    }
                  })();
                }}
              >
                Copy hard-gaps JSON
              </button>
            ) : null}
            {hardGapsPayload ? (
              <button
                type="button"
                className="ghost"
                disabled={busy}
                title="Download soft_fertig_surface_* catalog subset from /hard-gaps"
                onClick={() => {
                  const keys = Array.isArray(hardGapsPayload.soft_fertig_surface_keys)
                    ? (hardGapsPayload.soft_fertig_surface_keys as string[])
                    : [];
                  const catalog: Record<string, unknown> = {
                    soft_fertig_surface_keys: keys,
                    soft_fertig_surface_key_count:
                      hardGapsPayload.soft_fertig_surface_key_count,
                    soft_fertig_surface_key_titles:
                      hardGapsPayload.soft_fertig_surface_key_titles,
                    soft_fertig_surface_notes:
                      hardGapsPayload.soft_fertig_surface_notes,
                    soft_fertig_surface_notes_count:
                      hardGapsPayload.soft_fertig_surface_notes_count,
                    soft_complete_phase: hardGapsPayload.soft_complete_phase,
                    honesty_milestone: hardGapsPayload.honesty_milestone,
                  };
                  const text = JSON.stringify(catalog, null, 2);
                  const blob = new Blob([text + "\n"], {
                    type: "application/json;charset=utf-8",
                  });
                  const url = URL.createObjectURL(blob);
                  const a = document.createElement("a");
                  a.href = url;
                  a.download = `fwbweb-soft-fertig-surface-${firewallId || "fw"}.json`;
                  a.click();
                  URL.revokeObjectURL(url);
                  onStatus?.("Downloaded soft-fertig surface catalog");
                }}
              >
                Download soft-fertig surface
              </button>
            ) : null}
            {hardGapsPayload ? (
              <button
                type="button"
                className="ghost"
                disabled={busy}
                title="Copy soft_fertig_surface_* catalog subset to clipboard"
                onClick={() => {
                  void (async () => {
                    const keys = Array.isArray(hardGapsPayload.soft_fertig_surface_keys)
                      ? (hardGapsPayload.soft_fertig_surface_keys as string[])
                      : [];
                    const catalog: Record<string, unknown> = {
                      soft_fertig_surface_keys: keys,
                      soft_fertig_surface_key_count:
                        hardGapsPayload.soft_fertig_surface_key_count,
                      soft_fertig_surface_key_titles:
                        hardGapsPayload.soft_fertig_surface_key_titles,
                      soft_fertig_surface_notes:
                        hardGapsPayload.soft_fertig_surface_notes,
                      soft_fertig_surface_notes_count:
                        hardGapsPayload.soft_fertig_surface_notes_count,
                      soft_complete_phase: hardGapsPayload.soft_complete_phase,
                      honesty_milestone: hardGapsPayload.honesty_milestone,
                    };
                    const text = JSON.stringify(catalog, null, 2) + "\n";
                    try {
                      await navigator.clipboard.writeText(text);
                      onStatus?.("Copied soft-fertig surface catalog");
                    } catch (e) {
                      onError?.(e instanceof Error ? e.message : String(e));
                    }
                  })();
                }}
              >
                Copy soft-fertig surface
              </button>
            ) : null}
            <button
              type="button"
              className="ghost"
              disabled={busy}
              title="GET /hard-gaps/summary — compact honesty snapshot"
              onClick={() => {
                void (async () => {
                  onBusy?.(true);
                  onError?.(null);
                  try {
                    const s = await fetchHardGapsSummary();
                    const text = JSON.stringify(s, null, 2);
                    setHardGapsSummaryText(text);
                    if (
                      typeof s.layout_fidelity_sample_score_percent === "number" &&
                      !s.layout_fidelity_pixel_parity
                    ) {
                      const parts =
                        typeof s.layout_fidelity_sample_score_parts_count === "number"
                          ? `, parts=${s.layout_fidelity_sample_score_parts_count}`
                          : "";
                      const plat = s.layout_fidelity_sample_platform || "iptables";
                      const hos = s.layout_fidelity_sample_host_os || "linux24";
                      const spacerBits = [
                        typeof s.layout_fidelity_sample_spacers === "number"
                          ? `spacers=${s.layout_fidelity_sample_spacers}`
                          : "",
                        typeof s.layout_fidelity_sample_spacers_with_orientation ===
                        "number"
                          ? `orient=${s.layout_fidelity_sample_spacers_with_orientation}`
                          : "",
                        typeof s.layout_fidelity_sample_spacers_with_size_type ===
                        "number"
                          ? `sizeType=${s.layout_fidelity_sample_spacers_with_size_type}`
                          : "",
                        typeof s.layout_fidelity_sample_spacers_with_size_hint ===
                        "number"
                          ? `sizeHint=${s.layout_fidelity_sample_spacers_with_size_hint}`
                          : "",
                        typeof s.layout_fidelity_sample_with_size_policy === "number"
                          ? `sizePolicy=${s.layout_fidelity_sample_with_size_policy}`
                          : "",
                        typeof s.layout_fidelity_sample_with_size_policy_expanding ===
                        "number"
                          ? `expanding=${s.layout_fidelity_sample_with_size_policy_expanding}`
                          : "",
                        typeof s.layout_fidelity_sample_with_size_policy_fixed ===
                        "number"
                          ? `fixed=${s.layout_fidelity_sample_with_size_policy_fixed}`
                          : "",
                        typeof s.layout_fidelity_sample_with_size_policy_minimum ===
                        "number"
                          ? `minimum=${s.layout_fidelity_sample_with_size_policy_minimum}`
                          : "",
                        typeof s.layout_fidelity_sample_with_size_policy_preferred ===
                        "number"
                          ? `preferred=${s.layout_fidelity_sample_with_size_policy_preferred}`
                          : "",
                        typeof s.layout_fidelity_sample_with_minimum_size === "number"
                          ? `minSize=${s.layout_fidelity_sample_with_minimum_size}`
                          : "",
                        typeof s.layout_fidelity_sample_with_maximum_size === "number"
                          ? `maxSize=${s.layout_fidelity_sample_with_maximum_size}`
                          : "",
                        typeof s.layout_fidelity_sample_layout_tree_max_depth ===
                        "number"
                          ? `treeDepth=${s.layout_fidelity_sample_layout_tree_max_depth}`
                          : "",
                        typeof s.layout_fidelity_sample_buddy_labels === "number"
                          ? `buddies=${s.layout_fidelity_sample_buddy_labels}`
                          : "",
                        typeof s.layout_fidelity_sample_stacked_sections === "number"
                          ? `stacked=${s.layout_fidelity_sample_stacked_sections}`
                          : "",
                        typeof s.layout_fidelity_sample_empty_stacked_sections ===
                        "number"
                          ? `emptyStacked=${s.layout_fidelity_sample_empty_stacked_sections}`
                          : "",
                        typeof s.layout_fidelity_sample_sections_with_flat === "number"
                          ? `flat=${s.layout_fidelity_sample_sections_with_flat}`
                          : "",
                        typeof s.layout_fidelity_sample_sections_with_checkable ===
                        "number"
                          ? `checkable=${s.layout_fidelity_sample_sections_with_checkable}`
                          : "",
                        typeof s.layout_fidelity_sample_annotations === "number"
                          ? `annotations=${s.layout_fidelity_sample_annotations}`
                          : "",
                        typeof s.layout_fidelity_sample_pages_with_column_stretch ===
                        "number"
                          ? `colStretch=${s.layout_fidelity_sample_pages_with_column_stretch}`
                          : "",
                        typeof s.layout_fidelity_sample_pages_with_spacing === "number"
                          ? `spacing=${s.layout_fidelity_sample_pages_with_spacing}`
                          : "",
                        typeof s.layout_fidelity_sample_pages_with_layout_tree ===
                        "number"
                          ? `layoutTree=${s.layout_fidelity_sample_pages_with_layout_tree}`
                          : "",
                        s.layout_fidelity_sample_chrome_geometry === true
                          ? "geometry=1"
                          : s.layout_fidelity_sample_chrome_geometry === false
                            ? "geometry=0"
                            : "",
                        s.layout_fidelity_sample_chrome_size_grip_enabled === true
                          ? "sizeGrip=1"
                          : s.layout_fidelity_sample_chrome_size_grip_enabled === false
                            ? "sizeGrip=0"
                            : "",
                        typeof s.layout_fidelity_sample_fields === "number"
                          ? `fields=${s.layout_fidelity_sample_fields}`
                          : "",
                        typeof s.layout_fidelity_sample_with_grid === "number"
                          ? `grid=${s.layout_fidelity_sample_with_grid}`
                          : "",
                        typeof s.layout_fidelity_sample_with_label === "number"
                          ? `labels=${s.layout_fidelity_sample_with_label}`
                          : "",
                        typeof s.layout_fidelity_sample_with_tooltip === "number"
                          ? `tooltips=${s.layout_fidelity_sample_with_tooltip}`
                          : "",
                        typeof s.layout_fidelity_sample_with_visible === "number"
                          ? `visible=${s.layout_fidelity_sample_with_visible}`
                          : "",
                        typeof s.layout_fidelity_sample_with_whats_this === "number"
                          ? `whatsThis=${s.layout_fidelity_sample_with_whats_this}`
                          : "",
                        typeof s.layout_fidelity_sample_with_enabled === "number"
                          ? `enabled=${s.layout_fidelity_sample_with_enabled}`
                          : "",
                        typeof s.layout_fidelity_sample_with_alignment === "number"
                          ? `align=${s.layout_fidelity_sample_with_alignment}`
                          : "",
                        typeof s.layout_fidelity_sample_with_read_only === "number"
                          ? `readOnly=${s.layout_fidelity_sample_with_read_only}`
                          : "",
                        typeof s.layout_fidelity_sample_pages_with_row_stretch === "number"
                          ? `rowStretch=${s.layout_fidelity_sample_pages_with_row_stretch}`
                          : "",
                        typeof s.layout_fidelity_sample_pages_with_tooltip === "number"
                          ? `pageTip=${s.layout_fidelity_sample_pages_with_tooltip}`
                          : "",
                        typeof s.layout_fidelity_sample_with_external_label === "number"
                          ? `extLabel=${s.layout_fidelity_sample_with_external_label}`
                          : "",
                        typeof s.layout_fidelity_sample_pages_with_buddy_labels === "number"
                          ? `pageBuddies=${s.layout_fidelity_sample_pages_with_buddy_labels}`
                          : "",
                        typeof s.layout_fidelity_sample_pages === "number"
                          ? `pages=${s.layout_fidelity_sample_pages}`
                          : "",
                        typeof s.layout_fidelity_sample_sections === "number"
                          ? `sections=${s.layout_fidelity_sample_sections}`
                          : "",
                        typeof s.layout_fidelity_sample_stack_names_count === "number"
                          ? `stacks=${s.layout_fidelity_sample_stack_names_count}`
                          : "",
                        s.layout_fidelity_sample_chrome_window_title === true
                          ? "windowTitle=1"
                          : s.layout_fidelity_sample_chrome_window_title === false
                            ? "windowTitle=0"
                            : "",
                        s.layout_fidelity_sample_chrome_tab_position === true
                          ? "tabPos=1"
                          : s.layout_fidelity_sample_chrome_tab_position === false
                            ? "tabPos=0"
                            : "",
                        typeof s.layout_fidelity_sample_signal_key_count === "number"
                          ? `signalKeys=${s.layout_fidelity_sample_signal_key_count}`
                          : "",
                        typeof s.layout_fidelity_sample_key_count === "number"
                          ? `sampleKeys=${s.layout_fidelity_sample_key_count}`
                          : "",
                        s.layout_fidelity_sample_catalog_complete === true
                          ? "catalog=1"
                          : s.layout_fidelity_sample_catalog_complete === false
                            ? "catalog=0"
                            : "",
                        typeof s.layout_fidelity_alt_sample_score_percent === "number"
                          ? `alt=${s.layout_fidelity_alt_sample_platform || "?"}/${s.layout_fidelity_alt_sample_host_os || "?"}:${s.layout_fidelity_alt_sample_score_percent}%`
                          : "",
                        typeof s.layout_fidelity_alt_sample_buddy_labels === "number"
                          ? `altBuddies=${s.layout_fidelity_alt_sample_buddy_labels}`
                          : "",
                        typeof s.layout_fidelity_alt_sample_pages_with_buddy_labels === "number"
                          ? `altPageBuddies=${s.layout_fidelity_alt_sample_pages_with_buddy_labels}`
                          : "",
                        typeof s.layout_fidelity_alt_sample_with_external_label === "number"
                          ? `altExtLabel=${s.layout_fidelity_alt_sample_with_external_label}`
                          : "",
                        typeof s.layout_fidelity_alt2_sample_score_percent === "number"
                          ? `alt2=${s.layout_fidelity_alt2_sample_platform || "?"}/${s.layout_fidelity_alt2_sample_host_os || "?"}:${s.layout_fidelity_alt2_sample_score_percent}%`
                          : "",
                        typeof s.layout_fidelity_alt2_sample_with_enabled === "number"
                          ? `alt2Enabled=${s.layout_fidelity_alt2_sample_with_enabled}`
                          : "",
                      ]
                        .filter(Boolean)
                        .join(", ");
                      {
                        const full =
                          `Sample fidelity ${plat}/${hos}: ${s.layout_fidelity_sample_score_percent}%${parts}` +
                          (spacerBits ? `; ${spacerBits}` : "") +
                          " (not pixel)";
                        const fmt = formatSampleFidelityLine(full);
                        setHardGapsSummaryFidelity(fmt.display);
                        setHardGapsSummaryFidelityTitle(fmt.title);
                      }
                    } else {
                      setHardGapsSummaryFidelity(null);
                      setHardGapsSummaryFidelityTitle(null);
                    }
                    try {
                      sessionStorage.setItem(hardGapsSummaryKey(firewallId), text);
                    } catch {
                      /* ignore */
                    }
                    onStatus?.(
                      `Hard-gaps summary: ${s.hard_gap_count ?? (s.hard_gap_open || []).length} open` +
                        (typeof s.layout_fidelity_sample_score_percent === "number"
                          ? `; sample fidelity ${s.layout_fidelity_sample_score_percent}% (not pixel)`
                          : ""),
                    );
                  } catch (e) {
                    onError?.(e instanceof Error ? e.message : String(e));
                  } finally {
                    onBusy?.(false);
                  }
                })();
              }}
            >
              Show hard-gaps summary
            </button>
            <button
              type="button"
              className="ghost"
              disabled={busy || !hardGapsSummaryText}
              title="Download compact /hard-gaps/summary JSON"
              onClick={() => {
                if (!hardGapsSummaryText) return;
                const blob = new Blob([hardGapsSummaryText + "\n"], {
                  type: "application/json;charset=utf-8",
                });
                const url = URL.createObjectURL(blob);
                const a = document.createElement("a");
                a.href = url;
                a.download = `fwbweb-hard-gaps-summary-${firewallId || "fw"}.json`;
                a.click();
                URL.revokeObjectURL(url);
                onStatus?.("Downloaded hard-gaps summary");
              }}
            >
              Download summary
            </button>
            <button
              type="button"
              className="ghost"
              disabled={busy || (!hardGapsPayload && !hardGapsSummaryText)}
              title="Clear sessionStorage hard-gaps snapshot and summary"
              onClick={() => {
                try {
                  sessionStorage.removeItem(hardGapsSnapshotKey(firewallId));
                  sessionStorage.removeItem(hardGapsSummaryKey(firewallId));
                } catch {
                  /* ignore */
                }
                setHardGapsSummaryText(null);
                setHardGapsSummaryFidelity(null);
                setHardGapsSummaryFidelityTitle(null);
                onStatus?.("Cleared hard-gaps snapshot");
              }}
            >
              Clear hard-gaps snapshot
            </button>
            <button
              type="button"
              className="ghost"
              disabled={busy}
              title="GET /hard-gaps/closure — show closure criteria"
              onClick={() => {
                void (async () => {
                  onBusy?.(true);
                  onError?.(null);
                  try {
                    const c = await fetchHardGapClosure();
                    const lines = [
                      `# hard-gap closure (phase ${c.soft_complete_phase}` +
                        (c.hard_gap_count != null ? `, count=${c.hard_gap_count}` : "") +
                        (c.honesty_milestone != null
                          ? `, honesty_milestone=${c.honesty_milestone}`
                          : "") +
                        (c.soft_fertig_honesty_track != null
                          ? `, soft_fertig=${c.soft_fertig_honesty_track ? "yes" : "no"}`
                          : "") +
                        ")",
                      c.parent_path ? `parent=${c.parent_path}` : "",
                      c.note || "",
                      "",
                      ...((c.hard_gap_open || []).map((g) => {
                        const crit = c.hard_gap_closure?.[g] || "";
                        const note = c.hard_gap_notes?.[g] || "";
                        return (
                          `- ${g}\n  close when: ${crit}` +
                          (note ? `\n  note: ${note}` : "")
                        );
                      })),
                    ].filter((line) => line !== undefined);
                    const text = lines.join("\n");
                    setHardGapsClosureText(text);
                    try {
                      sessionStorage.setItem(hardGapClosureKey(firewallId), text);
                    } catch {
                      /* ignore */
                    }
                    onStatus?.(
                      `Hard-gap closure: ${(c.hard_gap_open || []).length} open`,
                    );
                  } catch (e) {
                    onError?.(e instanceof Error ? e.message : String(e));
                  } finally {
                    onBusy?.(false);
                  }
                })();
              }}
            >
              Show hard-gap closure
            </button>
            <button
              type="button"
              className="ghost"
              disabled={busy || !hardGapsClosureText}
              title="Download the last shown hard-gap closure text"
              onClick={() => {
                if (!hardGapsClosureText) return;
                const blob = new Blob([hardGapsClosureText + "\n"], {
                  type: "text/plain;charset=utf-8",
                });
                const url = URL.createObjectURL(blob);
                const a = document.createElement("a");
                a.href = url;
                a.download = `fwbweb-hard-gap-closure-${firewallId || "fw"}.txt`;
                a.click();
                URL.revokeObjectURL(url);
                onStatus?.("Downloaded hard-gap closure");
              }}
            >
              Download closure
            </button>
          </div>
          {hardGapsSummaryFidelity ? (
            <p
              className="muted"
              title={
                hardGapsSummaryFidelityTitle ||
                "layout_fidelity_sample_* from /hard-gaps/summary"
              }
            >
              {hardGapsSummaryFidelity}
            </p>
          ) : null}
          {hardGapsSummaryText ? (
            <pre className="deploy-log configlet-preview" tabIndex={0}>
              {hardGapsSummaryText}
            </pre>
          ) : null}
          {hardGapsClosureText ? (
            <pre className="deploy-log configlet-preview" tabIndex={0}>
              {hardGapsClosureText}
            </pre>
          ) : null}
        </div>
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
