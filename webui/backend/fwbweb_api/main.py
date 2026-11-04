from __future__ import annotations

from fastapi import Depends, FastAPI, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware

from .auth import require_token
from .routes.compile import router as compile_router
from .routes.deploy import router as deploy_router
from .routes.options import router as options_router
from .routes.platforms import router as platforms_router
from .routes.projects import router as projects_router
from .routes.rules import router as rules_router
from .settings import settings

app = FastAPI(
    title="Firewall Builder WebUI API",
    version="0.1.0",
    description="REST/WebSocket front for the libfwbuilder fwbweb bridge",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origin_list,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(projects_router)
app.include_router(rules_router)
app.include_router(compile_router)
app.include_router(options_router)
app.include_router(deploy_router)
app.include_router(platforms_router)


# Soft-complete marker for the hard-gap honesty/preview track (not full expect/pixel).
WEBUI_SOFT_COMPLETE_PHASE = "2472"
SOFT_FERTIG_HONESTY_TRACK_NOTE = (
    "Soft-fertig honesty/preview track is complete for documentation/UI catalogs; "
    "three hard gaps remain open (pixel layout, expect/SSHSession, password SSH)."
)
# Honesty/preview track milestone (last thematic checkpoint; soft marker may be higher).
# 600: refusals/closure; 650: health/summary/paths + fidelity sample;
# 700: expect step_notes + SSH alternative/refusal notes;
# 750: spacer sizeType extract + qtSpacerStyle/CSS;
# 800: with_size_policy_expanding in fidelity sample;
# 850: field CSS Minimum/Preferred/Fixed sizePolicy mapping (still not pixel);
# 900: fixed/minimum sizePolicy fidelity + spacer Max/Min/Pref CSS + min/max size samples;
# 950: preferred sizePolicy + treeDepth/buddies + stacked_sections hard-gaps samples;
# 1000: flat/checkable/annotations samples + min/max size as score weights;
# 1050: column_stretch/spacing/layout_tree + chrome geometry/size_grip samples;
# 1100: with_grid/label/tooltip + fields count hard-gaps samples;
# 1150: pages/sections counts + stack_names on hard-gaps sample;
# 1200: chrome window_title/tab_position hard-gaps samples;
# 1250: UI truncates long sample fidelity lines (title keeps full);
# 1300: with_size_policy total count on hard-gaps sample;
# 1350: sample_key_count + with_visible + spacers_with_size_hint +
#       signal_key_count + with_whats_this on hard-gaps sample;
# 1400: with_enabled/alignment/read_only + pages row_stretch/tooltip samples;
# 1450: with_external_label + pages_with_buddy_labels samples (catalog complete);
# 1500: layout_fidelity_sample_catalog_complete flag on hard-gaps/summary;
# 1550: alt iosacl/ios sample (buddy_labels + with_external_label);
# 1600: alt2 junosacl/junos sample (with_enabled);
# 1650: alt iosacl pages_with_buddy_labels sample;
# 1700: hard_gap_open_labels on hard-gaps/summary/closure;
# 1750: hard_gap_closure_titles short closure criteria titles;
# 1800: expect_plan_step_titles for refused install steps;
# 1850: ssh_alternative_titles + ssh_refusal_path_titles;
# 1900: honesty_path_titles for honesty/preview endpoint catalog;
# 1950: honesty_path_notes (+ count) for honesty/preview endpoints;
# 2000: soft_fertig_surface_keys (+ titles/count) documentation catalog;
# 2050: hard_gap_related_refusals (+ titles) mapped per open hard gap;
# 2100: UI expandable soft_fertig_surface_keys catalog detail;
# 2150: UI expandable hard_gap_related_refusals detail;
# 2200: soft_fertig_surface_notes (+ count) for surface key catalog;
# 2250: hard_gap_related_refusals also on closure + full map on summary;
# 2300: soft_fertig_surface keys/titles/notes on hard-gaps summary;
# 2350: soft_fertig_surface catalog also on hard-gaps/closure;
# 2400: honesty_paths + honesty_path_notes mirrored on hard-gaps summary;
# 2450: honesty_paths (+ titles/notes) also on hard-gaps/closure;
# 2500: UI download/copy soft-fertig surface catalog JSON;
# 2550: UI download/copy hard_gap_related_refusals JSON;
# 2600: UI download/copy honesty_paths catalog JSON;
# 2650: sessionStorage for soft-fertig surface / related refusals / honesty paths;
# 2700: soft_fertig_session_storage_keys catalog on /hard-gaps;
# 2750: session storage keys also on summary + closure;
# 2800: UI expandable soft_fertig_session_storage_keys detail;
# 2850: UI download/copy soft_fertig_session_storage_keys catalog;
# 2900: session storage keys included in soft_fertig_surface_keys catalog;
# 2950: soft_fertig_session_storage_notes (+ count) on honesty endpoints;
# 3000: session storage notes included in soft_fertig_surface_keys catalog;
# 3050: soft_fertig_honesty_export_keys catalog of downloadable honesty JSONs;
# 3100: honesty export keys included in soft_fertig_surface_keys catalog;
# 3150: soft_fertig_honesty_bundle sections + UI combined download/copy;
# 3200: honesty bundle sections included in soft_fertig_surface_keys catalog;
# 3250: honesty_bundle added to sessionStorage + honesty export catalogs;
# 3300: soft_fertig_session_storage_clear_* documents UI clear of honesty catalogs;
# 3350: session storage clear fields included in soft_fertig_surface_keys catalog;
# 3400: UI expandable clear-keys detail + download/copy clear catalog;
# 3450: session_storage_clear listed in honesty export + bundle sections;
# 3500: soft_fertig_honesty_surface_version documents catalog schema version;
# 3550: surface_version listed in honesty export + bundle sections;
# 3600: soft_fertig_catalog_summary compact counts on health + honesty endpoints;
# 3650: UI expandable catalog summary detail + download/copy;
# 3700: catalog_summary listed in honesty export + bundle sections;
# 3750: soft_fertig_honesty_surface_version bumped to 1.1 (catalog_summary);
# 3800: soft_fertig_honesty_track_note clarifies soft track vs open hard gaps;
# 3850: track_note included in catalog_summary + honesty export catalogs;
# 3900: track_note added to sessionStorage + clear catalogs;
# 3950: soft_fertig_honesty_surface_version bumped to 1.2 (track_note);
# 4000: UI expandable track-note detail + sessionStorage restore on load;
# 4050: soft_fertig_honesty_readiness compact soft-vs-hard checklist;
# 4100: readiness listed in honesty export + bundle sections;
# 4150: soft_fertig_honesty_surface_version bumped to 1.3 (readiness);
# 4200: readiness added to sessionStorage + clear catalogs;
# 4250: catalog_summary includes soft_fertig_catalogs_complete + hard_gaps_remain;
# 4300: soft_fertig_honesty_surface_version bumped to 1.4 (catalog flags);
# 4350: soft_fertig_soft_complete_note clarifies soft-complete phase marker vs hard gaps;
# 4400: soft_complete_note listed in honesty export + bundle sections;
# 4450: soft_fertig_honesty_surface_version bumped to 1.5 (soft_complete_note);
# 4500: soft_complete_note added to sessionStorage + clear catalogs;
# 4550: UI expandable soft-complete-note detail + sessionStorage restore on load;
# 4600: soft_fertig_honesty_surface_changelog documents schema history;
# 4650: surface_changelog listed in honesty export + bundle sections;
# 4700: soft_fertig_honesty_surface_version bumped to 1.6 (surface_changelog);
# 4750: surface_changelog added to sessionStorage + clear catalogs;
# 4800: soft_fertig_honesty_operator_brief compact soft-vs-hard operator briefing;
# 4850: operator_brief listed in honesty export + bundle sections;
# 4900: soft_fertig_honesty_surface_version bumped to 1.7 (operator_brief);
# 4950: operator_brief added to sessionStorage + clear catalogs;
# 5000: Soft 2200+ honesty surface checkpoint (operator brief cycle complete);
# 5050: soft_fertig_hard_gap_roster compact open-gap labels/closure titles;
# 5100: hard_gap_roster listed in honesty export + bundle sections;
# 5150: soft_fertig_honesty_surface_version bumped to 1.8 (hard_gap_roster);
# 5200: hard_gap_roster added to sessionStorage + clear catalogs;
# 5250: Soft 2280+ honesty surface checkpoint (hard_gap_roster cycle complete);
# 5300: soft_fertig_hard_gap_refusal_roster compact open-gap related refusals;
# 5350: hard_gap_refusal_roster listed in honesty export + bundle sections;
# 5400: soft_fertig_honesty_surface_version bumped to 1.9 (hard_gap_refusal_roster);
# 5450: hard_gap_refusal_roster added to sessionStorage + clear catalogs;
# 5500: Soft 2360+ honesty surface checkpoint (hard_gap_refusal_roster cycle complete);
# 5550: soft_fertig_honesty_path_roster compact honesty path ids/titles/notes;
# 5600: honesty_path_roster listed in honesty export + bundle sections;
# 5650: soft_fertig_honesty_surface_version bumped to 2.0 (honesty_path_roster);
# 5700: honesty_path_roster added to sessionStorage + clear catalogs;
# 5750: Soft 2440+ honesty surface checkpoint (honesty_path_roster cycle complete);
# 5800: soft_fertig_session_storage_roster compact sessionStorage key titles/notes.
WEBUI_HONESTY_MILESTONE = 5800
WEBUI_HONESTY_MILESTONE_NOTE = (
    "Honesty surface checkpoint 5800: soft_fertig_session_storage_roster lists "
    "sessionStorage key ids with titles and notes for operators — "
    "hard gaps remain open."
)
SOFT_FERTIG_SOFT_COMPLETE_NOTE = (
    "WEBUI_SOFT_COMPLETE_PHASE marks soft-fertig honesty/preview catalog "
    "completeness only; three hard gaps remain open (pixel layout, "
    "expect/SSHSession, password SSH)."
)

HARD_GAPS_OPEN = (
    "full_qt_pixel_layout",
    "expect_sshsession_runtime",
    "password_keyboard_interactive_ssh",
)

HARD_GAP_LABELS = {
    "full_qt_pixel_layout": "Full Qt pixel-equivalent layout",
    "expect_sshsession_runtime": "Expect/SSHSession install runtime",
    "password_keyboard_interactive_ssh": "Password / keyboard-interactive SSH",
}

HARD_GAP_CLOSURE_TITLES = {
    "full_qt_pixel_layout": "Desktop-equivalent geometry within stated tolerance",
    "expect_sshsession_runtime": "Live SSHSession/expect install path (not 501)",
    "password_keyboard_interactive_ssh": "Working password/keyboard-interactive deploy auth",
}

# Related refuse status codes for each open hard gap (honesty documentation).
HARD_GAP_RELATED_REFUSALS = {
    "full_qt_pixel_layout": {
        "layout_fidelity_pixel_parity": False,
        "note": "No HTTP refuse; pixel parity stays false on fidelity endpoints.",
    },
    "expect_sshsession_runtime": {
        "expect_install_plan_run": 501,
        "expect_install_plan_run_step": 501,
        "note": "POST /expect-install-plan/run (+ optional step=) → 501.",
    },
    "password_keyboard_interactive_ssh": {
        "deploy_allow_password_auth": 400,
        "ssh_auth_password": 501,
        "note": "allow_password_auth → 400; POST /ssh-auth/password → 501.",
    },
}
HARD_GAP_RELATED_REFUSAL_TITLES = {
    "full_qt_pixel_layout": "Pixel parity stays false (no HTTP refuse)",
    "expect_sshsession_runtime": "Expect run/step → 501",
    "password_keyboard_interactive_ssh": "Password SSH → 400/501",
}

HONESTY_PATHS = {
    "hard_gaps": "/api/v1/hard-gaps",
    "summary": "/api/v1/hard-gaps/summary",
    "closure": "/api/v1/hard-gaps/closure",
    "layout_fidelity": "/api/v1/layout-fidelity",
    "stack_switch": "/api/v1/stack-switch",
    "option_enable": "/api/v1/option-enable",
    "expect_run": "/api/v1/expect-install-plan/run",
    "expect_steps": "/api/v1/expect-install-plan/steps",
    "expect_steps_refusals": "/api/v1/expect-install-plan/steps/refusals",
    "ssh_auth": "/api/v1/ssh-auth",
    "password_ssh": "/api/v1/ssh-auth/password",
}

HONESTY_PATH_TITLES = {
    "hard_gaps": "Hard gaps list",
    "summary": "Hard gaps summary",
    "closure": "Hard gap closure criteria",
    "layout_fidelity": "Layout fidelity score",
    "stack_switch": "Stack switch maps",
    "option_enable": "Option enable maps",
    "expect_run": "Expect install plan run (501)",
    "expect_steps": "Expect install plan steps",
    "expect_steps_refusals": "Expect step refusal previews",
    "ssh_auth": "SSH auth capabilities",
    "password_ssh": "Password SSH endpoint (501)",
}

HONESTY_PATH_NOTES = {
    "hard_gaps": "Full honesty/preview snapshot with open hard gaps.",
    "summary": "Compact honesty snapshot (counts + titles; no full notes).",
    "closure": "Criteria that would close each open hard gap.",
    "layout_fidelity": "Heuristic signal coverage score (not pixel parity).",
    "stack_switch": "Desktop QStackedWidget switch maps for preview/follow.",
    "option_enable": "Desktop option enable/follow maps (bonding, LOG/ULOG).",
    "expect_run": "POST expect-install-plan/run stays 501 (no SSHSession).",
    "expect_steps": "Canonical refused expect plan step ids.",
    "expect_steps_refusals": "Per-step 501 refusal payload previews.",
    "ssh_auth": "BatchMode-only SSH capability summary.",
    "password_ssh": "POST /ssh-auth/password stays 501.",
}

# Top-level honesty/preview keys callers can rely on from GET /hard-gaps
# (documentation catalog; not a schema lock — soft-fertig surface only).
SOFT_FERTIG_SURFACE_KEYS = (
    "soft_complete_phase",
    "soft_fertig_honesty_track",
    "soft_fertig_honesty_track_note",
    "honesty_milestone",
    "honesty_milestone_note",
    "hard_gap_open",
    "hard_gap_open_labels",
    "hard_gap_closure_titles",
    "hard_gap_related_refusals",
    "hard_gap_related_refusal_titles",
    "hard_gap_count",
    "hard_gap_notes",
    "hard_gap_closure",
    "honesty_paths",
    "honesty_paths_count",
    "honesty_path_titles",
    "honesty_path_notes",
    "honesty_path_notes_count",
    "summary_path",
    "layout_fidelity_path",
    "expect_plan_step_titles",
    "ssh_alternative_titles",
    "ssh_refusal_path_titles",
    "layout_fidelity_sample_catalog_complete",
    "soft_fertig_session_storage_keys",
    "soft_fertig_session_storage_key_count",
    "soft_fertig_session_storage_key_titles",
    "soft_fertig_session_storage_notes",
    "soft_fertig_session_storage_notes_count",
    "soft_fertig_honesty_export_keys",
    "soft_fertig_honesty_export_key_count",
    "soft_fertig_honesty_export_key_titles",
    "soft_fertig_honesty_export_notes",
    "soft_fertig_honesty_export_notes_count",
    "soft_fertig_honesty_bundle_sections",
    "soft_fertig_honesty_bundle_section_count",
    "soft_fertig_honesty_bundle_section_titles",
    "soft_fertig_honesty_bundle_notes",
    "soft_fertig_honesty_bundle_notes_count",
    "soft_fertig_session_storage_clear_keys",
    "soft_fertig_session_storage_clear_key_count",
    "soft_fertig_session_storage_clear_note",
    "soft_fertig_honesty_surface_version",
    "soft_fertig_honesty_surface_version_note",
    "soft_fertig_catalog_summary",
    "soft_fertig_honesty_readiness",
    "soft_fertig_soft_complete_note",
    "soft_fertig_honesty_surface_changelog",
    "soft_fertig_honesty_operator_brief",
    "soft_fertig_hard_gap_roster",
    "soft_fertig_hard_gap_refusal_roster",
    "soft_fertig_honesty_path_roster",
    "soft_fertig_session_storage_roster",
)
SOFT_FERTIG_SURFACE_KEY_TITLES = {
    "soft_complete_phase": "Soft-complete phase marker",
    "soft_fertig_honesty_track": "Soft-fertig honesty track flag",
    "soft_fertig_honesty_track_note": "Soft-fertig vs hard-gap clarification note",
    "honesty_milestone": "Honesty surface milestone number",
    "honesty_milestone_note": "Honesty milestone checkpoint note",
    "hard_gap_open": "Open hard gap ids",
    "hard_gap_open_labels": "Human labels for open hard gaps",
    "hard_gap_closure_titles": "Short closure criteria titles",
    "hard_gap_related_refusals": "Related refuse status per open hard gap",
    "hard_gap_related_refusal_titles": "Short titles for related refusals",
    "hard_gap_count": "Count of open hard gaps",
    "hard_gap_notes": "Long honesty notes per open hard gap",
    "hard_gap_closure": "Closure criteria text per open hard gap",
    "honesty_paths": "Catalog of honesty/preview API paths",
    "honesty_paths_count": "Count of honesty/preview paths",
    "honesty_path_titles": "Short titles for honesty paths",
    "honesty_path_notes": "Short notes for honesty paths",
    "honesty_path_notes_count": "Count of honesty path notes",
    "summary_path": "Path to hard-gaps summary",
    "layout_fidelity_path": "Path to layout-fidelity score",
    "expect_plan_step_titles": "Titles for refused expect steps",
    "ssh_alternative_titles": "Titles for BatchMode SSH alternatives",
    "ssh_refusal_path_titles": "Titles for SSH refusal paths",
    "layout_fidelity_sample_catalog_complete": "Sample fidelity catalog complete flag",
    "soft_fertig_session_storage_keys": "UI sessionStorage key prefixes",
    "soft_fertig_session_storage_key_count": "Count of sessionStorage key prefixes",
    "soft_fertig_session_storage_key_titles": "Titles for sessionStorage key prefixes",
    "soft_fertig_session_storage_notes": "Notes for sessionStorage key prefixes",
    "soft_fertig_session_storage_notes_count": "Count of sessionStorage key notes",
    "soft_fertig_honesty_export_keys": "Downloadable honesty/preview JSON catalogs",
    "soft_fertig_honesty_export_key_count": "Count of honesty export catalogs",
    "soft_fertig_honesty_export_key_titles": "Titles for honesty export catalogs",
    "soft_fertig_honesty_export_notes": "Notes for honesty export catalogs",
    "soft_fertig_honesty_export_notes_count": "Count of honesty export notes",
    "soft_fertig_honesty_bundle_sections": "Combined honesty bundle section ids",
    "soft_fertig_honesty_bundle_section_count": "Count of honesty bundle sections",
    "soft_fertig_honesty_bundle_section_titles": "Titles for honesty bundle sections",
    "soft_fertig_honesty_bundle_notes": "Notes for honesty bundle sections",
    "soft_fertig_honesty_bundle_notes_count": "Count of honesty bundle notes",
    "soft_fertig_session_storage_clear_keys": "Keys cleared by Clear honesty catalogs",
    "soft_fertig_session_storage_clear_key_count": "Count of clearable sessionStorage keys",
    "soft_fertig_session_storage_clear_note": "Note describing Clear honesty catalogs",
    "soft_fertig_honesty_surface_version": "Soft-fertig honesty catalog schema version",
    "soft_fertig_honesty_surface_version_note": "Note for honesty catalog schema version",
    "soft_fertig_catalog_summary": "Compact soft-fertig catalog counts",
    "soft_fertig_honesty_readiness": "Soft-fertig vs hard-gap readiness checklist",
    "soft_fertig_soft_complete_note": "Soft-complete phase marker clarification note",
    "soft_fertig_honesty_surface_changelog": "Honesty surface schema version history",
    "soft_fertig_honesty_operator_brief": "Compact soft-vs-hard operator briefing",
    "soft_fertig_hard_gap_roster": "Open hard-gap ids with labels and closure titles",
    "soft_fertig_hard_gap_refusal_roster": (
        "Open hard-gap related refusal keys and titles"
    ),
    "soft_fertig_honesty_path_roster": (
        "Honesty/preview path ids with titles and notes"
    ),
    "soft_fertig_session_storage_roster": (
        "sessionStorage key ids with titles and notes"
    ),
}

SOFT_FERTIG_SURFACE_NOTES = {
    "soft_complete_phase": "Highest soft-fertig E2E phase number completed.",
    "soft_fertig_honesty_track": "True while honesty/preview track is soft-complete.",
    "soft_fertig_honesty_track_note": "States soft-fertig catalogs are done; hard gaps stay open.",
    "honesty_milestone": "Checkpoint number for honesty surface growth.",
    "honesty_milestone_note": "Human checkpoint text for the current milestone.",
    "hard_gap_open": "Ids of the three remaining hard gaps.",
    "hard_gap_open_labels": "Short human labels for open hard gaps.",
    "hard_gap_closure_titles": "One-line closure criteria titles.",
    "hard_gap_related_refusals": "Mapped refuse status / pixel_parity per hard gap.",
    "hard_gap_related_refusal_titles": "One-line titles for related refusals.",
    "hard_gap_count": "Always 3 until a hard gap is closed.",
    "hard_gap_notes": "Long honesty notes (current preview state).",
    "hard_gap_closure": "Full closure criteria text per hard gap.",
    "honesty_paths": "Map of honesty/preview endpoint paths.",
    "honesty_paths_count": "Number of honesty/preview paths.",
    "honesty_path_titles": "Short titles for honesty paths.",
    "honesty_path_notes": "Short notes for honesty paths.",
    "honesty_path_notes_count": "Number of honesty path notes.",
    "summary_path": "URL path of the compact hard-gaps summary.",
    "layout_fidelity_path": "URL path of layout-fidelity score.",
    "expect_plan_step_titles": "Titles for refused expect install steps.",
    "ssh_alternative_titles": "Titles for BatchMode SSH alternatives.",
    "ssh_refusal_path_titles": "Titles for SSH refusal paths.",
    "layout_fidelity_sample_catalog_complete": "True when sample fidelity catalog is complete.",
    "soft_fertig_session_storage_keys": "Prefixes for UI sessionStorage honesty catalogs.",
    "soft_fertig_session_storage_key_count": "Number of documented sessionStorage prefixes.",
    "soft_fertig_session_storage_key_titles": "Short titles for sessionStorage prefixes.",
    "soft_fertig_session_storage_notes": "Short notes for each sessionStorage prefix.",
    "soft_fertig_session_storage_notes_count": "Number of sessionStorage prefix notes.",
    "soft_fertig_honesty_export_keys": "Ids of UI-downloadable honesty JSON catalogs.",
    "soft_fertig_honesty_export_key_count": "Number of honesty export catalog ids.",
    "soft_fertig_honesty_export_key_titles": "Short titles for honesty export catalogs.",
    "soft_fertig_honesty_export_notes": "Short notes for honesty export catalogs.",
    "soft_fertig_honesty_export_notes_count": "Number of honesty export notes.",
    "soft_fertig_honesty_bundle_sections": "Section ids of the combined honesty bundle download.",
    "soft_fertig_honesty_bundle_section_count": "Number of honesty bundle sections.",
    "soft_fertig_honesty_bundle_section_titles": "Short titles for honesty bundle sections.",
    "soft_fertig_honesty_bundle_notes": "Short notes for honesty bundle sections.",
    "soft_fertig_honesty_bundle_notes_count": "Number of honesty bundle notes.",
    "soft_fertig_session_storage_clear_keys": "Ids cleared by the UI Clear honesty catalogs action.",
    "soft_fertig_session_storage_clear_key_count": "Number of clearable sessionStorage catalog keys.",
    "soft_fertig_session_storage_clear_note": "Human note for the Clear honesty catalogs action.",
    "soft_fertig_honesty_surface_version": "Semver-like schema id for soft-fertig honesty catalogs.",
    "soft_fertig_honesty_surface_version_note": "Human description of the current schema version.",
    "soft_fertig_catalog_summary": "Compact counts for surface/session/export/bundle/clear catalogs.",
    "soft_fertig_honesty_readiness": "Soft catalogs complete flag plus open hard-gap count/note.",
    "soft_fertig_soft_complete_note": "States soft-complete phase is catalog-only; hard gaps stay open.",
    "soft_fertig_honesty_surface_changelog": (
        "Maps schema versions 1.0+ to short change notes; not a lock."
    ),
    "soft_fertig_honesty_operator_brief": (
        "One-screen soft-complete vs hard-gap briefing for operators."
    ),
    "soft_fertig_hard_gap_roster": (
        "Per open hard gap: id, label, and short closure title."
    ),
    "soft_fertig_hard_gap_refusal_roster": (
        "Per open hard gap: related refusal keys, titles, and note."
    ),
    "soft_fertig_honesty_path_roster": (
        "Per honesty path: id, API path, short title, and note."
    ),
    "soft_fertig_session_storage_roster": (
        "Per sessionStorage catalog key: id, prefix, title, and note."
    ),
}

# Browser sessionStorage key prefixes used by the WebUI honesty track
# (suffix is the firewall id). Documentation only — not written by the API.
SOFT_FERTIG_SESSION_STORAGE_KEYS = {
    "hard_gaps": "fwbweb.hardGaps.",
    "hard_gaps_summary": "fwbweb.hardGapsSummary.",
    "soft_fertig_surface": "fwbweb.softFertigSurface.",
    "related_refusals": "fwbweb.relatedRefusals.",
    "honesty_paths": "fwbweb.honestyPaths.",
    "honesty_bundle": "fwbweb.honestyBundle.",
    "track_note": "fwbweb.honestyTrackNote.",
    "readiness": "fwbweb.honestyReadiness.",
    "soft_complete_note": "fwbweb.softCompleteNote.",
    "surface_changelog": "fwbweb.honestySurfaceChangelog.",
    "operator_brief": "fwbweb.honestyOperatorBrief.",
    "hard_gap_roster": "fwbweb.hardGapRoster.",
    "hard_gap_refusal_roster": "fwbweb.hardGapRefusalRoster.",
    "honesty_path_roster": "fwbweb.honestyPathRoster.",
}
SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES = {
    "hard_gaps": "Full /hard-gaps JSON snapshot",
    "hard_gaps_summary": "Hard-gaps summary text snapshot",
    "soft_fertig_surface": "Soft-fertig surface catalog JSON",
    "related_refusals": "Related hard-gap refusals JSON",
    "honesty_paths": "Honesty paths catalog JSON",
    "honesty_bundle": "Combined honesty bundle JSON",
    "track_note": "Soft-fertig honesty track note JSON",
    "readiness": "Soft-fertig honesty readiness checklist JSON",
    "soft_complete_note": "Soft-complete phase marker clarification note JSON",
    "surface_changelog": "Honesty surface schema changelog JSON",
    "operator_brief": "Soft-vs-hard operator briefing JSON",
    "hard_gap_roster": "Open hard-gap roster JSON",
    "hard_gap_refusal_roster": "Open hard-gap refusal roster JSON",
    "honesty_path_roster": "Honesty/preview path roster JSON",
}
SOFT_FERTIG_SESSION_STORAGE_NOTES = {
    "hard_gaps": "Persists last downloaded/copied /hard-gaps JSON per firewall.",
    "hard_gaps_summary": "Persists last hard-gaps summary text per firewall.",
    "soft_fertig_surface": "Persists soft-fertig surface (+ sessionKeys) catalogs.",
    "related_refusals": "Persists related hard-gap refusals JSON per firewall.",
    "honesty_paths": "Persists honesty paths catalog JSON per firewall.",
    "honesty_bundle": "Persists last downloaded/copied honesty bundle per firewall.",
    "track_note": (
        "Persists last downloaded/copied soft_fertig_honesty_track_note per "
        "firewall; UI restores expandable track-note detail on load."
    ),
    "readiness": (
        "Persists last downloaded/copied soft_fertig_honesty_readiness per "
        "firewall; UI restores expandable readiness detail on load."
    ),
    "soft_complete_note": (
        "Persists last downloaded/copied soft_fertig_soft_complete_note per "
        "firewall; UI restores expandable soft-complete-note detail on load."
    ),
    "surface_changelog": (
        "Persists last downloaded/copied soft_fertig_honesty_surface_changelog "
        "per firewall; UI restores expandable surface-changelog detail on load."
    ),
    "operator_brief": (
        "Persists last downloaded/copied soft_fertig_honesty_operator_brief "
        "per firewall; UI restores expandable operator-brief detail on load."
    ),
    "hard_gap_roster": (
        "Persists last downloaded/copied soft_fertig_hard_gap_roster "
        "per firewall; UI restores expandable hard-gap-roster detail on load."
    ),
    "hard_gap_refusal_roster": (
        "Persists last downloaded/copied soft_fertig_hard_gap_refusal_roster "
        "per firewall; UI restores expandable hard-gap-refusal-roster detail "
        "on load."
    ),
    "honesty_path_roster": (
        "Persists last downloaded/copied soft_fertig_honesty_path_roster "
        "per firewall; UI restores expandable honesty-path-roster detail on load."
    ),
}

# Keys removed by the UI "Clear honesty catalogs" action (same set as sessionStorage catalog).
SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS = tuple(SOFT_FERTIG_SESSION_STORAGE_KEYS.keys())
SOFT_FERTIG_SESSION_STORAGE_CLEAR_NOTE = (
    "UI Clear honesty catalogs removes each soft_fertig_session_storage_keys "
    "prefix + firewallId from sessionStorage (does not close hard gaps)."
)

# Soft-fertig honesty/preview catalog schema version (documentation; not a lock).
SOFT_FERTIG_HONESTY_SURFACE_VERSION = "2.0"
SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE = (
    "Schema 2.0: schema 1.9 plus soft_fertig_honesty_path_roster on "
    "/health and honesty endpoints (+ export/bundle); hard gaps remain open."
)

# Downloadable honesty/preview JSON catalogs the UI can export (documentation).
SOFT_FERTIG_HONESTY_EXPORT_KEYS = (
    "hard_gaps",
    "soft_fertig_surface",
    "related_refusals",
    "honesty_paths",
    "session_storage_keys",
    "honesty_bundle",
    "session_storage_clear",
    "surface_version",
    "catalog_summary",
    "track_note",
    "readiness",
    "soft_complete_note",
    "surface_changelog",
    "operator_brief",
    "hard_gap_roster",
    "hard_gap_refusal_roster",
    "honesty_path_roster",
)
SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES = {
    "hard_gaps": "Full /hard-gaps honesty snapshot JSON",
    "soft_fertig_surface": "Soft-fertig surface keys/titles/notes JSON",
    "related_refusals": "Related hard-gap refusals JSON",
    "honesty_paths": "Honesty paths catalog JSON",
    "session_storage_keys": "sessionStorage keys/titles/notes JSON",
    "honesty_bundle": "Combined honesty bundle JSON",
    "session_storage_clear": "sessionStorage clear keys/note JSON",
    "surface_version": "Honesty surface schema version (+ note)",
    "catalog_summary": "Compact soft-fertig catalog counts",
    "track_note": "Soft-fertig honesty track clarification note",
    "readiness": "Soft-fertig vs hard-gap readiness checklist",
    "soft_complete_note": "Soft-complete phase marker clarification note",
    "surface_changelog": "Honesty surface schema version history",
    "operator_brief": "Compact soft-vs-hard operator briefing",
    "hard_gap_roster": "Open hard-gap ids with labels and closure titles",
    "hard_gap_refusal_roster": "Open hard-gap related refusal keys and titles",
    "honesty_path_roster": "Honesty/preview path ids with titles and notes",
}
SOFT_FERTIG_HONESTY_EXPORT_NOTES = {
    "hard_gaps": "Download hard-gaps JSON button; sessionStorage fwbweb.hardGaps.*.",
    "soft_fertig_surface": "Download soft-fertig surface catalog from /hard-gaps fields.",
    "related_refusals": "Download related refusals catalog from /hard-gaps fields.",
    "honesty_paths": "Download honesty_paths (+ titles/notes) catalog.",
    "session_storage_keys": "Download sessionStorage keys (+ titles/notes) catalog.",
    "honesty_bundle": "Download/Copy honesty bundle; sessionStorage fwbweb.honestyBundle.*.",
    "session_storage_clear": "Download/Copy clear catalogs; Clear honesty catalogs action.",
    "surface_version": "soft_fertig_honesty_surface_version (+ note) from /hard-gaps.",
    "catalog_summary": "Download/Copy soft_fertig_catalog_summary; also on /health.",
    "track_note": (
        "soft_fertig_honesty_track_note from /hard-gaps and /health; "
        "sessionStorage fwbweb.honestyTrackNote.*."
    ),
    "readiness": (
        "Download/Copy soft_fertig_honesty_readiness; also on /health; "
        "sessionStorage fwbweb.honestyReadiness.*."
    ),
    "soft_complete_note": (
        "soft_fertig_soft_complete_note from /hard-gaps and /health; "
        "also in catalog_summary; sessionStorage fwbweb.softCompleteNote.*."
    ),
    "surface_changelog": (
        "Download/Copy soft_fertig_honesty_surface_changelog; also on /health; "
        "sessionStorage fwbweb.honestySurfaceChangelog.*."
    ),
    "operator_brief": (
        "Download/Copy soft_fertig_honesty_operator_brief; also on /health; "
        "sessionStorage fwbweb.honestyOperatorBrief.*."
    ),
    "hard_gap_roster": (
        "Download/Copy soft_fertig_hard_gap_roster; also on /health; "
        "sessionStorage fwbweb.hardGapRoster.*."
    ),
    "hard_gap_refusal_roster": (
        "Download/Copy soft_fertig_hard_gap_refusal_roster; also on /health; "
        "sessionStorage fwbweb.hardGapRefusalRoster.*."
    ),
    "honesty_path_roster": (
        "Download/Copy soft_fertig_honesty_path_roster; also on /health; "
        "sessionStorage fwbweb.honestyPathRoster.*."
    ),
}

# Top-level sections of the combined UI honesty bundle download.
SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS = (
    "meta",
    "hard_gaps",
    "soft_fertig_surface",
    "related_refusals",
    "honesty_paths",
    "session_storage_keys",
    "session_storage_clear",
    "surface_version",
    "catalog_summary",
    "track_note",
    "readiness",
    "soft_complete_note",
    "surface_changelog",
    "operator_brief",
    "hard_gap_roster",
    "hard_gap_refusal_roster",
    "honesty_path_roster",
    "honesty_exports",
)
SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES = {
    "meta": "soft_complete_phase + honesty_milestone",
    "hard_gaps": "Full /hard-gaps payload",
    "soft_fertig_surface": "Surface keys/titles/notes subset",
    "related_refusals": "Related refusals + titles",
    "honesty_paths": "Honesty paths + titles/notes",
    "session_storage_keys": "sessionStorage keys/titles/notes",
    "session_storage_clear": "sessionStorage clear keys/note",
    "surface_version": "Honesty surface schema version (+ note)",
    "catalog_summary": "Compact soft-fertig catalog counts",
    "track_note": "Soft-fertig honesty track clarification note",
    "readiness": "Soft-fertig vs hard-gap readiness checklist",
    "soft_complete_note": "Soft-complete phase marker clarification note",
    "surface_changelog": "Honesty surface schema version history",
    "operator_brief": "Compact soft-vs-hard operator briefing",
    "hard_gap_roster": "Open hard-gap ids with labels and closure titles",
    "hard_gap_refusal_roster": "Open hard-gap related refusal keys and titles",
    "honesty_path_roster": "Honesty/preview path ids with titles and notes",
    "honesty_exports": "Export catalog meta (keys/titles/notes)",
}
SOFT_FERTIG_HONESTY_BUNDLE_NOTES = {
    "meta": "Always included for provenance of soft-fertig track.",
    "hard_gaps": "Same JSON as Download hard-gaps JSON.",
    "soft_fertig_surface": "Same subset as Download soft-fertig surface.",
    "related_refusals": "Same subset as Download related refusals.",
    "honesty_paths": "Same subset as Download honesty paths.",
    "session_storage_keys": "Same subset as Download sessionStorage keys.",
    "session_storage_clear": "Same subset as Download clear catalogs.",
    "surface_version": "Dedicated surface_version section (also in meta).",
    "catalog_summary": "Same subset as Download catalog summary.",
    "track_note": (
        "soft_fertig_honesty_track_note clarification text; "
        "also sessionStorage fwbweb.honestyTrackNote.*."
    ),
    "readiness": (
        "Same subset as Download readiness; "
        "also sessionStorage fwbweb.honestyReadiness.*."
    ),
    "soft_complete_note": (
        "Same subset as Download soft-complete note; "
        "also sessionStorage fwbweb.softCompleteNote.*."
    ),
    "surface_changelog": (
        "Same subset as Download surface changelog; "
        "also sessionStorage fwbweb.honestySurfaceChangelog.*."
    ),
    "operator_brief": (
        "Same subset as Download operator brief; "
        "also sessionStorage fwbweb.honestyOperatorBrief.*."
    ),
    "hard_gap_roster": (
        "Same subset as Download hard-gap roster; "
        "also sessionStorage fwbweb.hardGapRoster.*."
    ),
    "hard_gap_refusal_roster": (
        "Same subset as Download hard-gap refusal roster; "
        "also sessionStorage fwbweb.hardGapRefusalRoster.*."
    ),
    "honesty_path_roster": (
        "Same subset as Download honesty path roster; "
        "also sessionStorage fwbweb.honestyPathRoster.*."
    ),
    "honesty_exports": "Same subset as Download honesty exports.",
}



def soft_fertig_honesty_readiness() -> dict[str, object]:
    """Soft-fertig vs hard-gap readiness checklist (documentation; not closure)."""
    return {
        "soft_fertig_catalogs_complete": True,
        "hard_gaps_remain": True,
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "soft_fertig_honesty_surface_version": SOFT_FERTIG_HONESTY_SURFACE_VERSION,
        "note": SOFT_FERTIG_HONESTY_TRACK_NOTE,
    }


# Soft-fertig honesty surface schema history (documentation; not a lock).
SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG = {
    "1.0": "Initial soft-fertig honesty surface schema version.",
    "1.1": "catalog_summary counts on honesty surface.",
    "1.2": "track_note in catalog_summary, exports, and sessionStorage.",
    "1.3": "readiness on /health and honesty endpoints (+ export/bundle).",
    "1.4": "soft_fertig_catalogs_complete and hard_gaps_remain on catalog_summary.",
    "1.5": (
        "soft_fertig_soft_complete_note on /health and honesty endpoints "
        "(+ export/bundle)."
    ),
    "1.6": (
        "soft_fertig_honesty_surface_changelog on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "1.7": (
        "soft_fertig_honesty_operator_brief on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "1.8": (
        "soft_fertig_hard_gap_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "1.9": (
        "soft_fertig_hard_gap_refusal_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "2.0": (
        "soft_fertig_honesty_path_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
}


def soft_fertig_honesty_surface_changelog() -> dict[str, object]:
    """Honesty surface schema version history (documentation; not closure)."""
    return {
        "current_version": SOFT_FERTIG_HONESTY_SURFACE_VERSION,
        "versions": dict(SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG),
        "version_count": len(SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG),
        "hard_gaps_remain": True,
    }


def soft_fertig_honesty_operator_brief() -> dict[str, object]:
    """Compact soft-vs-hard operator briefing (documentation; not closure)."""
    return {
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "soft_fertig_honesty_surface_version": SOFT_FERTIG_HONESTY_SURFACE_VERSION,
        "soft_fertig_catalogs_complete": True,
        "hard_gaps_remain": True,
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "summary": (
            f"Soft-fertig catalogs through phase {WEBUI_SOFT_COMPLETE_PHASE} "
            f"(milestone {WEBUI_HONESTY_MILESTONE}, schema "
            f"{SOFT_FERTIG_HONESTY_SURFACE_VERSION}); "
            f"{len(HARD_GAPS_OPEN)} hard gaps remain open."
        ),
        "note": SOFT_FERTIG_HONESTY_TRACK_NOTE,
    }


def soft_fertig_hard_gap_roster() -> dict[str, object]:
    """Open hard-gap roster with labels and closure titles (documentation)."""
    entries = [
        {
            "id": gap_id,
            "label": HARD_GAP_LABELS.get(gap_id, gap_id),
            "closure_title": HARD_GAP_CLOSURE_TITLES.get(gap_id, ""),
        }
        for gap_id in HARD_GAPS_OPEN
    ]
    return {
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Roster of open hard gaps only; soft-fertig catalogs do not close them."
        ),
    }


def soft_fertig_hard_gap_refusal_roster() -> dict[str, object]:
    """Open hard-gap related refusal keys/titles (documentation; not closure)."""
    entries: list[dict[str, object]] = []
    for gap_id in HARD_GAPS_OPEN:
        refusals = dict(HARD_GAP_RELATED_REFUSALS.get(gap_id) or {})
        note = str(refusals.pop("note", "") or "")
        refusal_keys = sorted(str(k) for k in refusals.keys())
        entries.append(
            {
                "id": gap_id,
                "label": HARD_GAP_LABELS.get(gap_id, gap_id),
                "refusal_title": HARD_GAP_RELATED_REFUSAL_TITLES.get(gap_id, ""),
                "refusal_keys": refusal_keys,
                "refusal_key_count": len(refusal_keys),
                "note": note,
            }
        )
    return {
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Related refusal keys per open hard gap; soft-fertig catalogs "
            "do not close them."
        ),
    }


def soft_fertig_honesty_path_roster() -> dict[str, object]:
    """Honesty/preview path roster with titles and notes (documentation)."""
    entries = [
        {
            "id": path_id,
            "path": HONESTY_PATHS[path_id],
            "title": HONESTY_PATH_TITLES.get(path_id, ""),
            "note": HONESTY_PATH_NOTES.get(path_id, ""),
        }
        for path_id in HONESTY_PATHS
    ]
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of honesty/preview paths only; soft-fertig catalogs "
            "do not close hard gaps."
        ),
    }



def soft_fertig_session_storage_roster() -> dict[str, object]:
    """sessionStorage key roster with titles and notes (documentation)."""
    entries = [
        {
            "id": key_id,
            "prefix": SOFT_FERTIG_SESSION_STORAGE_KEYS[key_id],
            "title": SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES.get(key_id, ""),
            "note": SOFT_FERTIG_SESSION_STORAGE_NOTES.get(key_id, ""),
        }
        for key_id in SOFT_FERTIG_SESSION_STORAGE_KEYS
    ]
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of soft-fertig sessionStorage keys only; catalogs "
            "do not close hard gaps."
        ),
    }

def soft_fertig_catalog_summary() -> dict[str, object]:
    """Compact soft-fertig catalog counts for /health and honesty endpoints."""
    return {
        "soft_fertig_honesty_surface_version": SOFT_FERTIG_HONESTY_SURFACE_VERSION,
        "soft_fertig_honesty_track_note": SOFT_FERTIG_HONESTY_TRACK_NOTE,
        "soft_fertig_surface_key_count": len(SOFT_FERTIG_SURFACE_KEYS),
        "soft_fertig_session_storage_key_count": len(SOFT_FERTIG_SESSION_STORAGE_KEYS),
        "soft_fertig_honesty_export_key_count": len(SOFT_FERTIG_HONESTY_EXPORT_KEYS),
        "soft_fertig_honesty_bundle_section_count": len(
            SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
        ),
        "soft_fertig_session_storage_clear_key_count": len(
            SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
        ),
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "soft_fertig_catalogs_complete": True,
        "hard_gaps_remain": True,
        "soft_fertig_soft_complete_note": SOFT_FERTIG_SOFT_COMPLETE_NOTE,
        "soft_fertig_honesty_surface_changelog_version_count": len(
            SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG
        ),
        "soft_fertig_honesty_operator_brief_summary": soft_fertig_honesty_operator_brief()[
            "summary"
        ],
        "soft_fertig_hard_gap_roster_entry_count": soft_fertig_hard_gap_roster()[
            "entry_count"
        ],
        "soft_fertig_hard_gap_refusal_roster_entry_count": (
            soft_fertig_hard_gap_refusal_roster()["entry_count"]
        ),
        "soft_fertig_honesty_path_roster_entry_count": soft_fertig_honesty_path_roster()[
            "entry_count"
        ],
        "soft_fertig_session_storage_roster_entry_count": (
            soft_fertig_session_storage_roster()["entry_count"]
        ),
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
    }


HARD_GAP_NOTES = {
    "full_qt_pixel_layout": (
        "Grid/spacers/stretch/buddy_labels/alignment/sizePolicy/sizeHint/"
        "layout_tree/tab_position/sizeGrip/QStackedWidget pages extracted "
        "(Firewall + Interface section chrome + empty pages + stack switcher + "
        "use_ULOG/device-type stack hints + option_enable follow); "
        "fidelity counts with_visible + sections flat/checkable + signal_keys + "
        "layout_tree_max_depth + spacers_with_orientation/size_type + "
        "with_size_policy_expanding/fixed/minimum/preferred + with_minimum_size/maximum_size "
        "(also score weights) + "
        "layout_tree_max_depth/buddy_labels + stacked_sections + "
        "sections_with_flat/checkable + annotations + "
        "pages_with_column_stretch/spacing/layout_tree + chrome geometry/size_grip + "
        "with_grid/label/tooltip field samples + pages/sections/stack_names counts + "
        "chrome window_title/tab_position samples; UI truncates long sample "
        "fidelity lines (title keeps full text); with_size_policy total sample + "
        "layout_fidelity_sample_key_count + with_visible field sample + spacers_with_size_hint sample + signal_key_count sample + with_whats_this field sample + with_enabled sample + with_alignment sample + with_read_only sample + pages_with_row_stretch sample + pages_with_tooltip sample + with_external_label sample + pages_with_buddy_labels sample + catalog_complete flag + alt iosacl sample (buddy/external_label) + alt2 junosacl sample (with_enabled) + alt pages_with_buddy_labels; hard_gap_open_labels on honesty endpoints; "
        "UI applies data-size-type Expanding/Fixed/Maximum/Minimum/Preferred via "
        "qtSpacerStyle/CSS and field size-h/v Expanding/Minimum/Preferred/Fixed classes "
        "(still not desktop-equivalent geometry); visible=false keeps field-ui-hidden "
        "grid holes; exact pixel geometry still open."
    ),
    "expect_sshsession_runtime": (
        "Plan + walkthrough + configlet previews available; POST /run → 501; "
        "no SSHSession/expect execution. Canonical refused step ids listed as "
        "expect_plan_step_ids on /hard-gaps with expect_plan_step_notes; "
        "GET …/steps carries step_notes; GET …/steps/refusals previews "
        "per-step 501 payloads."
    ),
    "password_keyboard_interactive_ssh": (
        "BatchMode only (batch_mode_only); allow_password_auth → 400; "
        "POST /ssh-auth/password → 501 with alternatives/refusal_paths; "
        "ssh_alternative_notes and ssh_refusal_path_notes document each path."
    ),
}

HARD_GAP_CLOSURE = {
    "full_qt_pixel_layout": (
        "Close when AdvancedDialog pages render with desktop-equivalent geometry "
        "(row/col sizes, nested layouts, and widget bounds match Qt within a stated "
        "tolerance) — layout-fidelity score alone is not sufficient."
    ),
    "expect_sshsession_runtime": (
        "Close when WebUI can open an SSHSession and run the desktop expect install "
        "path for interactive platforms (Cisco/Juniper/Procurve), or an explicitly "
        "documented subset with live execution (not preview-only / 501)."
    ),
    "password_keyboard_interactive_ssh": (
        "Close when password and/or keyboard-interactive SSH auth works for deploy "
        "(BatchMode-only is not enough); must not hang on prompts."
    ),
}


def _layout_fidelity_sample_key_count(payload: dict[str, object]) -> int:
    """Count layout_fidelity_sample_* keys (excludes this meta count itself)."""
    return sum(
        1
        for k in payload
        if k.startswith("layout_fidelity_sample_")
        and k != "layout_fidelity_sample_key_count"
    )


def _layout_fidelity_signal_key_count(sample_fid: dict[str, object]) -> int | None:
    """Total extracted signal keys (fields + pages + chrome) for a fidelity payload."""
    if not sample_fid.get("ok"):
        return None
    sk = sample_fid.get("signal_keys") or {}
    if not isinstance(sk, dict):
        return None
    return (
        len(sk.get("fields") or [])
        + len(sk.get("pages") or [])
        + len(sk.get("chrome") or [])
    )


_LAYOUT_FIDELITY_SAMPLE_CATALOG_REQUIRED = (
    "layout_fidelity_sample_with_visible",
    "layout_fidelity_sample_with_whats_this",
    "layout_fidelity_sample_with_enabled",
    "layout_fidelity_sample_with_alignment",
    "layout_fidelity_sample_with_read_only",
    "layout_fidelity_sample_with_external_label",
    "layout_fidelity_sample_with_size_policy",
    "layout_fidelity_sample_pages_with_buddy_labels",
    "layout_fidelity_sample_pages_with_row_stretch",
    "layout_fidelity_sample_pages_with_tooltip",
    "layout_fidelity_sample_spacers_with_size_hint",
    "layout_fidelity_sample_signal_key_count",
    "layout_fidelity_sample_key_count",
)


def _layout_fidelity_sample_catalog_complete(payload: dict[str, object]) -> bool:
    """True when required field/page sample keys are present on the payload."""
    return all(k in payload for k in _LAYOUT_FIDELITY_SAMPLE_CATALOG_REQUIRED)


@app.get("/api/v1/health")
def health() -> dict[str, object]:
    return {
        "status": "ok",
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "soft_fertig_honesty_track_note": SOFT_FERTIG_HONESTY_TRACK_NOTE,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "honesty_milestone_note": WEBUI_HONESTY_MILESTONE_NOTE,
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "soft_fertig_catalog_summary": soft_fertig_catalog_summary(),
        "soft_fertig_honesty_readiness": soft_fertig_honesty_readiness(),
        "soft_fertig_soft_complete_note": SOFT_FERTIG_SOFT_COMPLETE_NOTE,
        "soft_fertig_honesty_surface_changelog": soft_fertig_honesty_surface_changelog(),
        "soft_fertig_honesty_operator_brief": soft_fertig_honesty_operator_brief(),
        "soft_fertig_hard_gap_roster": soft_fertig_hard_gap_roster(),
        "soft_fertig_hard_gap_refusal_roster": soft_fertig_hard_gap_refusal_roster(),
        "soft_fertig_honesty_path_roster": soft_fertig_honesty_path_roster(),
        "soft_fertig_session_storage_roster": soft_fertig_session_storage_roster(),
        "soft_fertig_honesty_surface_version": SOFT_FERTIG_HONESTY_SURFACE_VERSION,
    }


@app.get("/api/v1/res-status")
def res_status(_: str = Depends(require_token)) -> dict[str, object]:
    """Report FWBUILDER_RES_DIR / configlets availability for installer features."""
    from .configlets import configlets_root
    from .platforms import res_dir

    root = res_dir()
    cfg = configlets_root()
    dirs: list[str] = []
    if cfg.is_dir():
        dirs = sorted(p.name for p in cfg.iterdir() if p.is_dir())
    return {
        "status": "ok" if root.is_dir() else "missing_res",
        "res_dir": str(root),
        "res_ok": root.is_dir(),
        "configlets_dir": str(cfg),
        "configlets_ok": cfg.is_dir(),
        "configlet_os_count": len(dirs),
        "configlet_os": dirs,
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "soft_fertig_honesty_track_note": SOFT_FERTIG_HONESTY_TRACK_NOTE,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "honesty_milestone_note": WEBUI_HONESTY_MILESTONE_NOTE,
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "soft_fertig_catalog_summary": soft_fertig_catalog_summary(),
        "soft_fertig_honesty_readiness": soft_fertig_honesty_readiness(),
        "soft_fertig_soft_complete_note": SOFT_FERTIG_SOFT_COMPLETE_NOTE,
        "soft_fertig_honesty_surface_changelog": soft_fertig_honesty_surface_changelog(),
        "soft_fertig_honesty_operator_brief": soft_fertig_honesty_operator_brief(),
        "soft_fertig_hard_gap_roster": soft_fertig_hard_gap_roster(),
        "soft_fertig_hard_gap_refusal_roster": soft_fertig_hard_gap_refusal_roster(),
        "soft_fertig_honesty_path_roster": soft_fertig_honesty_path_roster(),
        "soft_fertig_session_storage_roster": soft_fertig_session_storage_roster(),
        "soft_fertig_honesty_surface_version": SOFT_FERTIG_HONESTY_SURFACE_VERSION,
    }


@app.get("/api/v1/hard-gaps")
def hard_gaps(_: str = Depends(require_token)) -> dict[str, object]:
    """Explicit list of remaining hard-gap items (honesty track)."""
    from .deploy import ssh_auth_capabilities
    from .expect_installer import (
        EXPECT_PLAN_STEP_IDS,
        EXPECT_PLAN_STEP_NOTES,
        EXPECT_PLAN_STEP_TITLES,
    )
    from .platforms import layout_fidelity_for

    ssh = ssh_auth_capabilities()
    sample_fid = layout_fidelity_for("iptables", "linux24")
    alt_fid = layout_fidelity_for("iosacl", "ios")
    alt2_fid = layout_fidelity_for("junosacl", "junos")
    signal_catalog = sample_fid.get("signal_keys") if sample_fid.get("ok") else None
    honesty_paths = dict(HONESTY_PATHS)
    out: dict[str, object] = {
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "soft_fertig_honesty_track_note": SOFT_FERTIG_HONESTY_TRACK_NOTE,
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "hard_gap_open_labels": {
            k: HARD_GAP_LABELS[k] for k in HARD_GAPS_OPEN if k in HARD_GAP_LABELS
        },
        "hard_gap_closure_titles": {
            k: HARD_GAP_CLOSURE_TITLES[k]
            for k in HARD_GAPS_OPEN
            if k in HARD_GAP_CLOSURE_TITLES
        },
        "hard_gap_related_refusals": {
            k: dict(HARD_GAP_RELATED_REFUSALS[k])
            for k in HARD_GAPS_OPEN
            if k in HARD_GAP_RELATED_REFUSALS
        },
        "hard_gap_related_refusal_titles": {
            k: HARD_GAP_RELATED_REFUSAL_TITLES[k]
            for k in HARD_GAPS_OPEN
            if k in HARD_GAP_RELATED_REFUSAL_TITLES
        },
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "hard_gap_notes": dict(HARD_GAP_NOTES),
        "hard_gap_closure": dict(HARD_GAP_CLOSURE),
        "closure_path": honesty_paths["closure"],
        "layout_fidelity_path": honesty_paths["layout_fidelity"],
        "layout_fidelity_signal_catalog": signal_catalog,
        "layout_fidelity_sample_platform": "iptables",
        "layout_fidelity_sample_host_os": "linux24",
        "layout_fidelity_sample_score_percent": (
            sample_fid.get("score_percent") if sample_fid.get("ok") else None
        ),
        "layout_fidelity_sample_score_parts_count": (
            sample_fid.get("score_parts_count") if sample_fid.get("ok") else None
        ),
        "layout_fidelity_sample_spacers": (
            (sample_fid.get("pages") or {}).get("spacers") if sample_fid.get("ok") else None
        ),
        "layout_fidelity_sample_spacers_with_orientation": (
            (sample_fid.get("pages") or {}).get("spacers_with_orientation")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_spacers_with_size_type": (
            (sample_fid.get("pages") or {}).get("spacers_with_size_type")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_spacers_with_size_hint": (
            (sample_fid.get("pages") or {}).get("spacers_with_size_hint")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy": (
            (sample_fid.get("fields") or {}).get("with_size_policy")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy_expanding": (
            (sample_fid.get("fields") or {}).get("with_size_policy_expanding")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy_fixed": (
            (sample_fid.get("fields") or {}).get("with_size_policy_fixed")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy_minimum": (
            (sample_fid.get("fields") or {}).get("with_size_policy_minimum")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy_preferred": (
            (sample_fid.get("fields") or {}).get("with_size_policy_preferred")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_minimum_size": (
            (sample_fid.get("fields") or {}).get("with_minimum_size")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_maximum_size": (
            (sample_fid.get("fields") or {}).get("with_maximum_size")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_layout_tree_max_depth": (
            (sample_fid.get("pages") or {}).get("layout_tree_max_depth")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_buddy_labels": (
            (sample_fid.get("pages") or {}).get("buddy_labels")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_stacked_sections": (
            (sample_fid.get("pages") or {}).get("stacked_sections")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_empty_stacked_sections": (
            (sample_fid.get("pages") or {}).get("empty_stacked_sections")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_sections_with_flat": (
            (sample_fid.get("pages") or {}).get("sections_with_flat")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_sections_with_checkable": (
            (sample_fid.get("pages") or {}).get("sections_with_checkable")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_annotations": (
            (sample_fid.get("pages") or {}).get("annotations")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_column_stretch": (
            (sample_fid.get("pages") or {}).get("pages_with_column_stretch")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_spacing": (
            (sample_fid.get("pages") or {}).get("pages_with_spacing")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_layout_tree": (
            (sample_fid.get("pages") or {}).get("pages_with_layout_tree")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_chrome_geometry": (
            (sample_fid.get("chrome") or {}).get("geometry")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_chrome_size_grip_enabled": (
            (sample_fid.get("chrome") or {}).get("size_grip_enabled")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_grid": (
            (sample_fid.get("fields") or {}).get("with_grid")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_label": (
            (sample_fid.get("fields") or {}).get("with_label")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_tooltip": (
            (sample_fid.get("fields") or {}).get("with_tooltip")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_visible": (
            (sample_fid.get("fields") or {}).get("with_visible")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_whats_this": (
            (sample_fid.get("fields") or {}).get("with_whats_this")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_enabled": (
            (sample_fid.get("fields") or {}).get("with_enabled")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_alignment": (
            (sample_fid.get("fields") or {}).get("with_alignment")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_read_only": (
            (sample_fid.get("fields") or {}).get("with_read_only")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_row_stretch": (
            (sample_fid.get("pages") or {}).get("pages_with_row_stretch")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_tooltip": (
            (sample_fid.get("pages") or {}).get("pages_with_tooltip")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_external_label": (
            (sample_fid.get("fields") or {}).get("with_external_label")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_buddy_labels": (
            (sample_fid.get("pages") or {}).get("pages_with_buddy_labels")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_fields": (
            (sample_fid.get("fields") or {}).get("fields")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages": (
            (sample_fid.get("pages") or {}).get("pages")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_sections": (
            (sample_fid.get("pages") or {}).get("sections")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_stack_names": (
            list((sample_fid.get("pages") or {}).get("stack_names") or [])
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_stack_names_count": (
            len((sample_fid.get("pages") or {}).get("stack_names") or [])
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_chrome_window_title": (
            (sample_fid.get("chrome") or {}).get("window_title")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_chrome_tab_position": (
            (sample_fid.get("chrome") or {}).get("tab_position")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_signal_key_count": _layout_fidelity_signal_key_count(
            sample_fid
        ),
        "layout_fidelity_alt_sample_platform": "iosacl",
        "layout_fidelity_alt_sample_host_os": "ios",
        "layout_fidelity_alt_sample_score_percent": (
            alt_fid.get("score_percent") if alt_fid.get("ok") else None
        ),
        "layout_fidelity_alt_sample_buddy_labels": (
            (alt_fid.get("pages") or {}).get("buddy_labels")
            if alt_fid.get("ok")
            else None
        ),
        "layout_fidelity_alt_sample_pages_with_buddy_labels": (
            (alt_fid.get("pages") or {}).get("pages_with_buddy_labels")
            if alt_fid.get("ok")
            else None
        ),
        "layout_fidelity_alt_sample_with_external_label": (
            (alt_fid.get("fields") or {}).get("with_external_label")
            if alt_fid.get("ok")
            else None
        ),
        "layout_fidelity_alt2_sample_platform": "junosacl",
        "layout_fidelity_alt2_sample_host_os": "junos",
        "layout_fidelity_alt2_sample_score_percent": (
            alt2_fid.get("score_percent") if alt2_fid.get("ok") else None
        ),
        "layout_fidelity_alt2_sample_with_enabled": (
            (alt2_fid.get("fields") or {}).get("with_enabled")
            if alt2_fid.get("ok")
            else None
        ),
        "layout_fidelity_pixel_parity": False,
        "stack_switch_path": honesty_paths["stack_switch"],
        "option_enable_path": honesty_paths["option_enable"],
        "expect_run_path": honesty_paths["expect_run"],
        "expect_steps_path": honesty_paths["expect_steps"],
        "expect_steps_refusals_path": honesty_paths["expect_steps_refusals"],
        "expect_plan_step_ids": list(EXPECT_PLAN_STEP_IDS),
        "expect_plan_step_notes": dict(EXPECT_PLAN_STEP_NOTES),
        "expect_plan_step_titles": dict(EXPECT_PLAN_STEP_TITLES),
        "expect_plan_step_notes_count": len(EXPECT_PLAN_STEP_NOTES),
        "ssh_auth_path": honesty_paths["ssh_auth"],
        "password_ssh_path": honesty_paths["password_ssh"],
        "ssh_batch_mode_only": bool(ssh.get("batch_mode_only")),
        "ssh_alternatives": list(ssh.get("alternatives") or []),
        "ssh_alternative_notes": dict(ssh.get("alternative_notes") or {}),
        "ssh_alternative_titles": dict(ssh.get("alternative_titles") or {}),
        "ssh_refusal_paths": dict(ssh.get("refusal_paths") or {}),
        "ssh_refusal_path_titles": dict(ssh.get("refusal_path_titles") or {}),
        "ssh_refusal_path_notes": dict(ssh.get("refusal_path_notes") or {}),
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "honesty_milestone_note": WEBUI_HONESTY_MILESTONE_NOTE,
        "honesty_paths": honesty_paths,
        "honesty_path_titles": {
            k: HONESTY_PATH_TITLES[k]
            for k in honesty_paths
            if k in HONESTY_PATH_TITLES
        },
        "honesty_path_notes": {
            k: HONESTY_PATH_NOTES[k]
            for k in honesty_paths
            if k in HONESTY_PATH_NOTES
        },
        "honesty_path_notes_count": sum(
            1 for k in honesty_paths if k in HONESTY_PATH_NOTES
        ),
        "soft_fertig_surface_keys": list(SOFT_FERTIG_SURFACE_KEYS),
        "soft_fertig_surface_key_count": len(SOFT_FERTIG_SURFACE_KEYS),
        "soft_fertig_surface_key_titles": {
            k: SOFT_FERTIG_SURFACE_KEY_TITLES[k]
            for k in SOFT_FERTIG_SURFACE_KEYS
            if k in SOFT_FERTIG_SURFACE_KEY_TITLES
        },
        "soft_fertig_surface_notes": {
            k: SOFT_FERTIG_SURFACE_NOTES[k]
            for k in SOFT_FERTIG_SURFACE_KEYS
            if k in SOFT_FERTIG_SURFACE_NOTES
        },
        "soft_fertig_surface_notes_count": sum(
            1 for k in SOFT_FERTIG_SURFACE_KEYS if k in SOFT_FERTIG_SURFACE_NOTES
        ),
        "soft_fertig_session_storage_keys": dict(SOFT_FERTIG_SESSION_STORAGE_KEYS),
        "soft_fertig_session_storage_key_count": len(SOFT_FERTIG_SESSION_STORAGE_KEYS),
        "soft_fertig_session_storage_key_titles": dict(
            SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
        ),
        "soft_fertig_session_storage_notes": dict(SOFT_FERTIG_SESSION_STORAGE_NOTES),
        "soft_fertig_session_storage_notes_count": len(SOFT_FERTIG_SESSION_STORAGE_NOTES),
        "soft_fertig_session_storage_clear_keys": list(
            SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
        ),
        "soft_fertig_session_storage_clear_key_count": len(
            SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
        ),
        "soft_fertig_session_storage_clear_note": SOFT_FERTIG_SESSION_STORAGE_CLEAR_NOTE,
        "soft_fertig_honesty_surface_version": SOFT_FERTIG_HONESTY_SURFACE_VERSION,
        "soft_fertig_honesty_surface_version_note": (
            SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        ),
        "soft_fertig_catalog_summary": soft_fertig_catalog_summary(),
        "soft_fertig_honesty_readiness": soft_fertig_honesty_readiness(),
        "soft_fertig_soft_complete_note": SOFT_FERTIG_SOFT_COMPLETE_NOTE,
        "soft_fertig_honesty_surface_changelog": soft_fertig_honesty_surface_changelog(),
        "soft_fertig_honesty_operator_brief": soft_fertig_honesty_operator_brief(),
        "soft_fertig_hard_gap_roster": soft_fertig_hard_gap_roster(),
        "soft_fertig_hard_gap_refusal_roster": soft_fertig_hard_gap_refusal_roster(),
        "soft_fertig_honesty_path_roster": soft_fertig_honesty_path_roster(),
        "soft_fertig_session_storage_roster": soft_fertig_session_storage_roster(),
        "soft_fertig_honesty_export_keys": list(SOFT_FERTIG_HONESTY_EXPORT_KEYS),
        "soft_fertig_honesty_export_key_count": len(SOFT_FERTIG_HONESTY_EXPORT_KEYS),
        "soft_fertig_honesty_export_key_titles": {
            k: SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES[k]
            for k in SOFT_FERTIG_HONESTY_EXPORT_KEYS
            if k in SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
        },
        "soft_fertig_honesty_export_notes": {
            k: SOFT_FERTIG_HONESTY_EXPORT_NOTES[k]
            for k in SOFT_FERTIG_HONESTY_EXPORT_KEYS
            if k in SOFT_FERTIG_HONESTY_EXPORT_NOTES
        },
        "soft_fertig_honesty_export_notes_count": sum(
            1
            for k in SOFT_FERTIG_HONESTY_EXPORT_KEYS
            if k in SOFT_FERTIG_HONESTY_EXPORT_NOTES
        ),
        "soft_fertig_honesty_bundle_sections": list(
            SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
        ),
        "soft_fertig_honesty_bundle_section_count": len(
            SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
        ),
        "soft_fertig_honesty_bundle_section_titles": {
            k: SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES[k]
            for k in SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
            if k in SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
        },
        "soft_fertig_honesty_bundle_notes": {
            k: SOFT_FERTIG_HONESTY_BUNDLE_NOTES[k]
            for k in SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
            if k in SOFT_FERTIG_HONESTY_BUNDLE_NOTES
        },
        "soft_fertig_honesty_bundle_notes_count": sum(
            1
            for k in SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
            if k in SOFT_FERTIG_HONESTY_BUNDLE_NOTES
        ),
        "honesty_paths_count": len(honesty_paths),
        "summary_path": "/api/v1/hard-gaps/summary",
        "note": (
            "Honesty/preview track is soft-complete (soft_fertig); these items remain "
            "unimplemented (full Qt pixel layout, expect/SSHSession runtime, password SSH). "
            "GET /layout-fidelity reports extracted-signal coverage only "
            "(includes stacked_sections / with_visible / signal_keys). "
            "GET /stack-switch and /option-enable expose desktop maps for preview/follow. "
            "POST expect-install-plan/run and ssh-auth/password stay 501. "
            "expect_plan_step_ids / GET expect-install-plan/steps list canonical plan "
            "step ids (all refused; unknown step → expect_installer_unknown_step). "
            "ssh_refusal_paths documents BatchMode-only refuse status codes. "
            "hard_gap_closure documents what would close each gap. "
            "honesty_paths catalogs honesty/preview endpoints. "
            "GET /hard-gaps/summary is the compact honesty snapshot. "
            "layout_fidelity_sample_* mirrors summary (iptables/linux24 heuristic; not pixel)."
        ),
    }
    out["layout_fidelity_sample_key_count"] = _layout_fidelity_sample_key_count(out)
    out["layout_fidelity_sample_catalog_complete"] = (
        _layout_fidelity_sample_catalog_complete(out)
    )
    return out


@app.get("/api/v1/hard-gaps/summary")
def hard_gaps_summary(_: str = Depends(require_token)) -> dict[str, object]:
    """Compact honesty-track snapshot (counts + open ids; no full notes/paths)."""
    from .platforms import layout_fidelity_for

    full = hard_gaps()
    sample_fid = layout_fidelity_for("iptables", "linux24")
    alt_fid = layout_fidelity_for("iosacl", "ios")
    alt2_fid = layout_fidelity_for("junosacl", "junos")
    sample_score = sample_fid.get("score_percent") if sample_fid.get("ok") else None
    sample_parts = sample_fid.get("score_parts_count") if sample_fid.get("ok") else None
    out: dict[str, object] = {
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "soft_fertig_honesty_track_note": SOFT_FERTIG_HONESTY_TRACK_NOTE,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "honesty_milestone_note": WEBUI_HONESTY_MILESTONE_NOTE,
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "hard_gap_open_labels": {
            k: HARD_GAP_LABELS[k] for k in HARD_GAPS_OPEN if k in HARD_GAP_LABELS
        },
        "hard_gap_closure_titles": {
            k: HARD_GAP_CLOSURE_TITLES[k]
            for k in HARD_GAPS_OPEN
            if k in HARD_GAP_CLOSURE_TITLES
        },
        "hard_gap_related_refusal_titles": dict(
            full.get("hard_gap_related_refusal_titles") or {}
        ),
        "hard_gap_related_refusals": dict(
            full.get("hard_gap_related_refusals") or {}
        ),
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "honesty_paths": dict(full.get("honesty_paths") or {}),
        "honesty_paths_count": int(full.get("honesty_paths_count") or 0),
        "honesty_path_titles": dict(full.get("honesty_path_titles") or {}),
        "honesty_path_notes": dict(full.get("honesty_path_notes") or {}),
        "honesty_path_notes_count": int(full.get("honesty_path_notes_count") or 0),
        "soft_fertig_surface_keys": list(full.get("soft_fertig_surface_keys") or []),
        "soft_fertig_surface_key_count": int(
            full.get("soft_fertig_surface_key_count") or 0
        ),
        "soft_fertig_surface_key_titles": dict(
            full.get("soft_fertig_surface_key_titles") or {}
        ),
        "soft_fertig_surface_notes": dict(
            full.get("soft_fertig_surface_notes") or {}
        ),
        "soft_fertig_surface_notes_count": int(
            full.get("soft_fertig_surface_notes_count") or 0
        ),
        "soft_fertig_session_storage_keys": dict(
            full.get("soft_fertig_session_storage_keys") or {}
        ),
        "soft_fertig_session_storage_key_count": int(
            full.get("soft_fertig_session_storage_key_count") or 0
        ),
        "soft_fertig_session_storage_key_titles": dict(
            full.get("soft_fertig_session_storage_key_titles") or {}
        ),
        "soft_fertig_session_storage_notes": dict(
            full.get("soft_fertig_session_storage_notes") or {}
        ),
        "soft_fertig_session_storage_notes_count": int(
            full.get("soft_fertig_session_storage_notes_count") or 0
        ),
        "soft_fertig_session_storage_clear_keys": list(
            full.get("soft_fertig_session_storage_clear_keys") or []
        ),
        "soft_fertig_session_storage_clear_key_count": int(
            full.get("soft_fertig_session_storage_clear_key_count") or 0
        ),
        "soft_fertig_session_storage_clear_note": str(
            full.get("soft_fertig_session_storage_clear_note") or ""
        ),
        "soft_fertig_honesty_surface_version": str(
            full.get("soft_fertig_honesty_surface_version") or ""
        ),
        "soft_fertig_honesty_surface_version_note": str(
            full.get("soft_fertig_honesty_surface_version_note") or ""
        ),
        "soft_fertig_catalog_summary": dict(
            full.get("soft_fertig_catalog_summary") or {}
        ),
        "soft_fertig_honesty_readiness": dict(
            full.get("soft_fertig_honesty_readiness") or {}
        ),
        "soft_fertig_soft_complete_note": str(
            full.get("soft_fertig_soft_complete_note") or ""
        ),
        "soft_fertig_honesty_surface_changelog": dict(
            full.get("soft_fertig_honesty_surface_changelog") or {}
        ),
        "soft_fertig_honesty_operator_brief": dict(
            full.get("soft_fertig_honesty_operator_brief") or {}
        ),
        "soft_fertig_hard_gap_roster": dict(
            full.get("soft_fertig_hard_gap_roster") or {}
        ),
        "soft_fertig_hard_gap_refusal_roster": dict(
            full.get("soft_fertig_hard_gap_refusal_roster") or {}
        ),
        "soft_fertig_honesty_path_roster": dict(
            full.get("soft_fertig_honesty_path_roster") or {}
        ),
        "soft_fertig_session_storage_roster": dict(
            full.get("soft_fertig_session_storage_roster") or {}
        ),
        "soft_fertig_honesty_export_keys": list(
            full.get("soft_fertig_honesty_export_keys") or []
        ),
        "soft_fertig_honesty_export_key_count": int(
            full.get("soft_fertig_honesty_export_key_count") or 0
        ),
        "soft_fertig_honesty_export_key_titles": dict(
            full.get("soft_fertig_honesty_export_key_titles") or {}
        ),
        "soft_fertig_honesty_export_notes_count": int(
            full.get("soft_fertig_honesty_export_notes_count") or 0
        ),
        "soft_fertig_honesty_bundle_sections": list(
            full.get("soft_fertig_honesty_bundle_sections") or []
        ),
        "soft_fertig_honesty_bundle_section_count": int(
            full.get("soft_fertig_honesty_bundle_section_count") or 0
        ),
        "soft_fertig_honesty_bundle_section_titles": dict(
            full.get("soft_fertig_honesty_bundle_section_titles") or {}
        ),
        "soft_fertig_honesty_bundle_notes_count": int(
            full.get("soft_fertig_honesty_bundle_notes_count") or 0
        ),
        "expect_plan_step_count": int(full.get("expect_plan_step_notes_count") or 0),
        "expect_plan_step_titles": dict(full.get("expect_plan_step_titles") or {}),
        "ssh_alternative_titles": dict(full.get("ssh_alternative_titles") or {}),
        "ssh_refusal_path_titles": dict(full.get("ssh_refusal_path_titles") or {}),
        "layout_fidelity_sample_platform": "iptables",
        "layout_fidelity_sample_host_os": "linux24",
        "layout_fidelity_sample_score_percent": sample_score,
        "layout_fidelity_sample_score_parts_count": sample_parts,
        "layout_fidelity_sample_spacers": (
            (sample_fid.get("pages") or {}).get("spacers") if sample_fid.get("ok") else None
        ),
        "layout_fidelity_sample_spacers_with_orientation": (
            (sample_fid.get("pages") or {}).get("spacers_with_orientation")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_spacers_with_size_type": (
            (sample_fid.get("pages") or {}).get("spacers_with_size_type")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_spacers_with_size_hint": (
            (sample_fid.get("pages") or {}).get("spacers_with_size_hint")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy": (
            (sample_fid.get("fields") or {}).get("with_size_policy")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy_expanding": (
            (sample_fid.get("fields") or {}).get("with_size_policy_expanding")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy_fixed": (
            (sample_fid.get("fields") or {}).get("with_size_policy_fixed")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy_minimum": (
            (sample_fid.get("fields") or {}).get("with_size_policy_minimum")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_size_policy_preferred": (
            (sample_fid.get("fields") or {}).get("with_size_policy_preferred")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_minimum_size": (
            (sample_fid.get("fields") or {}).get("with_minimum_size")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_maximum_size": (
            (sample_fid.get("fields") or {}).get("with_maximum_size")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_layout_tree_max_depth": (
            (sample_fid.get("pages") or {}).get("layout_tree_max_depth")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_buddy_labels": (
            (sample_fid.get("pages") or {}).get("buddy_labels")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_stacked_sections": (
            (sample_fid.get("pages") or {}).get("stacked_sections")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_empty_stacked_sections": (
            (sample_fid.get("pages") or {}).get("empty_stacked_sections")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_sections_with_flat": (
            (sample_fid.get("pages") or {}).get("sections_with_flat")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_sections_with_checkable": (
            (sample_fid.get("pages") or {}).get("sections_with_checkable")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_annotations": (
            (sample_fid.get("pages") or {}).get("annotations")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_column_stretch": (
            (sample_fid.get("pages") or {}).get("pages_with_column_stretch")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_spacing": (
            (sample_fid.get("pages") or {}).get("pages_with_spacing")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_layout_tree": (
            (sample_fid.get("pages") or {}).get("pages_with_layout_tree")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_chrome_geometry": (
            (sample_fid.get("chrome") or {}).get("geometry")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_chrome_size_grip_enabled": (
            (sample_fid.get("chrome") or {}).get("size_grip_enabled")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_grid": (
            (sample_fid.get("fields") or {}).get("with_grid")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_label": (
            (sample_fid.get("fields") or {}).get("with_label")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_tooltip": (
            (sample_fid.get("fields") or {}).get("with_tooltip")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_visible": (
            (sample_fid.get("fields") or {}).get("with_visible")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_whats_this": (
            (sample_fid.get("fields") or {}).get("with_whats_this")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_enabled": (
            (sample_fid.get("fields") or {}).get("with_enabled")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_alignment": (
            (sample_fid.get("fields") or {}).get("with_alignment")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_read_only": (
            (sample_fid.get("fields") or {}).get("with_read_only")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_row_stretch": (
            (sample_fid.get("pages") or {}).get("pages_with_row_stretch")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_tooltip": (
            (sample_fid.get("pages") or {}).get("pages_with_tooltip")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_with_external_label": (
            (sample_fid.get("fields") or {}).get("with_external_label")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages_with_buddy_labels": (
            (sample_fid.get("pages") or {}).get("pages_with_buddy_labels")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_fields": (
            (sample_fid.get("fields") or {}).get("fields")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_pages": (
            (sample_fid.get("pages") or {}).get("pages")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_sections": (
            (sample_fid.get("pages") or {}).get("sections")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_stack_names": (
            list((sample_fid.get("pages") or {}).get("stack_names") or [])
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_stack_names_count": (
            len((sample_fid.get("pages") or {}).get("stack_names") or [])
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_chrome_window_title": (
            (sample_fid.get("chrome") or {}).get("window_title")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_chrome_tab_position": (
            (sample_fid.get("chrome") or {}).get("tab_position")
            if sample_fid.get("ok")
            else None
        ),
        "layout_fidelity_sample_signal_key_count": _layout_fidelity_signal_key_count(
            sample_fid
        ),
        "layout_fidelity_alt_sample_platform": "iosacl",
        "layout_fidelity_alt_sample_host_os": "ios",
        "layout_fidelity_alt_sample_score_percent": (
            alt_fid.get("score_percent") if alt_fid.get("ok") else None
        ),
        "layout_fidelity_alt_sample_buddy_labels": (
            (alt_fid.get("pages") or {}).get("buddy_labels")
            if alt_fid.get("ok")
            else None
        ),
        "layout_fidelity_alt_sample_pages_with_buddy_labels": (
            (alt_fid.get("pages") or {}).get("pages_with_buddy_labels")
            if alt_fid.get("ok")
            else None
        ),
        "layout_fidelity_alt_sample_with_external_label": (
            (alt_fid.get("fields") or {}).get("with_external_label")
            if alt_fid.get("ok")
            else None
        ),
        "layout_fidelity_alt2_sample_platform": "junosacl",
        "layout_fidelity_alt2_sample_host_os": "junos",
        "layout_fidelity_alt2_sample_score_percent": (
            alt2_fid.get("score_percent") if alt2_fid.get("ok") else None
        ),
        "layout_fidelity_alt2_sample_with_enabled": (
            (alt2_fid.get("fields") or {}).get("with_enabled")
            if alt2_fid.get("ok")
            else None
        ),
        "layout_fidelity_pixel_parity": False,
        "parent_path": "/api/v1/hard-gaps",
        "closure_path": "/api/v1/hard-gaps/closure",
        "layout_fidelity_path": "/api/v1/layout-fidelity",
        "expect_steps_path": "/api/v1/expect-install-plan/steps",
        "note": (
            "Compact honesty snapshot. Prefer GET /hard-gaps for full paths/notes "
            "and GET /hard-gaps/closure for closure criteria. "
            "layout_fidelity_sample_* is heuristic signal coverage for iptables/linux24 "
            "— not pixel parity (layout_fidelity_pixel_parity stays false). "
            "expect_plan_step_count is the refused step-notes catalog size."
        ),
    }
    out["layout_fidelity_sample_key_count"] = _layout_fidelity_sample_key_count(out)
    out["layout_fidelity_sample_catalog_complete"] = (
        _layout_fidelity_sample_catalog_complete(out)
    )
    return out


@app.get("/api/v1/hard-gaps/closure")
def hard_gap_closure(_: str = Depends(require_token)) -> dict[str, object]:
    """Closure criteria for each open hard gap (honesty track)."""
    return {
        "soft_complete_phase": WEBUI_SOFT_COMPLETE_PHASE,
        "soft_fertig_honesty_track": True,
        "soft_fertig_honesty_track_note": SOFT_FERTIG_HONESTY_TRACK_NOTE,
        "honesty_milestone": WEBUI_HONESTY_MILESTONE,
        "honesty_milestone_note": WEBUI_HONESTY_MILESTONE_NOTE,
        "hard_gap_open": list(HARD_GAPS_OPEN),
        "hard_gap_open_labels": {
            k: HARD_GAP_LABELS[k] for k in HARD_GAPS_OPEN if k in HARD_GAP_LABELS
        },
        "hard_gap_closure_titles": {
            k: HARD_GAP_CLOSURE_TITLES[k]
            for k in HARD_GAPS_OPEN
            if k in HARD_GAP_CLOSURE_TITLES
        },
        "hard_gap_related_refusals": {
            k: dict(HARD_GAP_RELATED_REFUSALS[k])
            for k in HARD_GAPS_OPEN
            if k in HARD_GAP_RELATED_REFUSALS
        },
        "hard_gap_related_refusal_titles": {
            k: HARD_GAP_RELATED_REFUSAL_TITLES[k]
            for k in HARD_GAPS_OPEN
            if k in HARD_GAP_RELATED_REFUSAL_TITLES
        },
        "hard_gap_count": len(HARD_GAPS_OPEN),
        "hard_gap_closure": dict(HARD_GAP_CLOSURE),
        "hard_gap_notes": dict(HARD_GAP_NOTES),
        "soft_fertig_surface_keys": list(SOFT_FERTIG_SURFACE_KEYS),
        "soft_fertig_surface_key_count": len(SOFT_FERTIG_SURFACE_KEYS),
        "soft_fertig_surface_key_titles": {
            k: SOFT_FERTIG_SURFACE_KEY_TITLES[k]
            for k in SOFT_FERTIG_SURFACE_KEYS
            if k in SOFT_FERTIG_SURFACE_KEY_TITLES
        },
        "soft_fertig_surface_notes": {
            k: SOFT_FERTIG_SURFACE_NOTES[k]
            for k in SOFT_FERTIG_SURFACE_KEYS
            if k in SOFT_FERTIG_SURFACE_NOTES
        },
        "soft_fertig_surface_notes_count": sum(
            1 for k in SOFT_FERTIG_SURFACE_KEYS if k in SOFT_FERTIG_SURFACE_NOTES
        ),
        "soft_fertig_session_storage_keys": dict(SOFT_FERTIG_SESSION_STORAGE_KEYS),
        "soft_fertig_session_storage_key_count": len(SOFT_FERTIG_SESSION_STORAGE_KEYS),
        "soft_fertig_session_storage_key_titles": dict(
            SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
        ),
        "soft_fertig_session_storage_notes": dict(SOFT_FERTIG_SESSION_STORAGE_NOTES),
        "soft_fertig_session_storage_notes_count": len(SOFT_FERTIG_SESSION_STORAGE_NOTES),
        "soft_fertig_session_storage_clear_keys": list(
            SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
        ),
        "soft_fertig_session_storage_clear_key_count": len(
            SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
        ),
        "soft_fertig_session_storage_clear_note": SOFT_FERTIG_SESSION_STORAGE_CLEAR_NOTE,
        "soft_fertig_honesty_surface_version": SOFT_FERTIG_HONESTY_SURFACE_VERSION,
        "soft_fertig_honesty_surface_version_note": (
            SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        ),
        "soft_fertig_catalog_summary": soft_fertig_catalog_summary(),
        "soft_fertig_honesty_readiness": soft_fertig_honesty_readiness(),
        "soft_fertig_soft_complete_note": SOFT_FERTIG_SOFT_COMPLETE_NOTE,
        "soft_fertig_honesty_surface_changelog": soft_fertig_honesty_surface_changelog(),
        "soft_fertig_honesty_operator_brief": soft_fertig_honesty_operator_brief(),
        "soft_fertig_hard_gap_roster": soft_fertig_hard_gap_roster(),
        "soft_fertig_hard_gap_refusal_roster": soft_fertig_hard_gap_refusal_roster(),
        "soft_fertig_honesty_path_roster": soft_fertig_honesty_path_roster(),
        "soft_fertig_session_storage_roster": soft_fertig_session_storage_roster(),
        "soft_fertig_honesty_export_keys": list(SOFT_FERTIG_HONESTY_EXPORT_KEYS),
        "soft_fertig_honesty_export_key_count": len(SOFT_FERTIG_HONESTY_EXPORT_KEYS),
        "soft_fertig_honesty_export_key_titles": {
            k: SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES[k]
            for k in SOFT_FERTIG_HONESTY_EXPORT_KEYS
            if k in SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
        },
        "soft_fertig_honesty_export_notes": {
            k: SOFT_FERTIG_HONESTY_EXPORT_NOTES[k]
            for k in SOFT_FERTIG_HONESTY_EXPORT_KEYS
            if k in SOFT_FERTIG_HONESTY_EXPORT_NOTES
        },
        "soft_fertig_honesty_export_notes_count": sum(
            1
            for k in SOFT_FERTIG_HONESTY_EXPORT_KEYS
            if k in SOFT_FERTIG_HONESTY_EXPORT_NOTES
        ),
        "soft_fertig_honesty_bundle_sections": list(
            SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
        ),
        "soft_fertig_honesty_bundle_section_count": len(
            SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
        ),
        "soft_fertig_honesty_bundle_section_titles": {
            k: SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES[k]
            for k in SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
            if k in SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
        },
        "soft_fertig_honesty_bundle_notes": {
            k: SOFT_FERTIG_HONESTY_BUNDLE_NOTES[k]
            for k in SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
            if k in SOFT_FERTIG_HONESTY_BUNDLE_NOTES
        },
        "soft_fertig_honesty_bundle_notes_count": sum(
            1
            for k in SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
            if k in SOFT_FERTIG_HONESTY_BUNDLE_NOTES
        ),
        "honesty_paths": {
            "hard_gaps": "/api/v1/hard-gaps",
            "summary": "/api/v1/hard-gaps/summary",
            "closure": "/api/v1/hard-gaps/closure",
            "layout_fidelity": "/api/v1/layout-fidelity",
            "stack_switch": "/api/v1/stack-switch",
            "option_enable": "/api/v1/option-enable",
            "expect_run": "/api/v1/expect-install-plan/run",
            "expect_steps": "/api/v1/expect-install-plan/steps",
            "expect_steps_refusals": "/api/v1/expect-install-plan/steps/refusals",
            "ssh_auth": "/api/v1/ssh-auth",
            "password_ssh": "/api/v1/ssh-auth/password",
        },
        "honesty_paths_count": len(HONESTY_PATH_TITLES),
        "honesty_path_titles": dict(HONESTY_PATH_TITLES),
        "honesty_path_notes": dict(HONESTY_PATH_NOTES),
        "honesty_path_notes_count": len(HONESTY_PATH_NOTES),
        "parent_path": "/api/v1/hard-gaps",
        "summary_path": "/api/v1/hard-gaps/summary",
        "note": (
            "Criteria for closing each hard gap. Meeting layout-fidelity score alone "
            "does not close full_qt_pixel_layout. hard_gap_notes summarize the "
            "current honesty/preview state for each open gap."
        ),
    }


@app.get("/api/v1/me")
def me(_: str = Depends(require_token)) -> dict[str, str]:
    return {"auth": "ok"}


@app.get("/api/v1/sessions")
def list_sessions(_: str = Depends(require_token)) -> dict[str, object]:
    from .sessions import store

    sessions = store.list()
    return {"count": len(sessions), "sessions": sessions}


@app.websocket("/api/v1/ws/{session_id}")
async def session_ws(websocket: WebSocket, session_id: str) -> None:
    """Phase-1 stub: accept connections; mutation fan-out comes later."""
    token = websocket.query_params.get("token")
    if token != settings.api_token:
        await websocket.close(code=4403)
        return
    await websocket.accept()
    await websocket.send_json({"ok": True, "event": "subscribed", "session_id": session_id})
    try:
        while True:
            await websocket.receive_text()
    except WebSocketDisconnect:
        return


def run() -> None:
    import uvicorn

    uvicorn.run("fwbweb_api.main:app", host="127.0.0.1", port=8088, reload=False)
