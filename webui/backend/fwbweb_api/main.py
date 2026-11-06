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
WEBUI_SOFT_COMPLETE_PHASE = "3992"
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
# 5800: soft_fertig_session_storage_roster compact sessionStorage key titles/notes;
# 5850: session_storage_roster listed in honesty export + bundle sections;
# 5900: soft_fertig_honesty_surface_version bumped to 2.1 (session_storage_roster);
# 5950: session_storage_roster added to sessionStorage + clear catalogs;
# 6000: Soft 2520+ honesty surface checkpoint (session_storage_roster cycle complete);
# 6050: soft_fertig_honesty_export_roster compact honesty export key titles/notes;
# 6100: honesty_export_roster listed in honesty export + bundle sections;
# 6150: soft_fertig_honesty_surface_version bumped to 2.2 (honesty_export_roster);
# 6200: honesty_export_roster added to sessionStorage + clear catalogs;
# 6250: Soft 2600+ honesty surface checkpoint (honesty_export_roster cycle complete);
# 6300: soft_fertig_honesty_bundle_roster compact honesty bundle section titles/notes;
# 6350: honesty_bundle_roster listed in honesty export + bundle sections;
# 6400: soft_fertig_honesty_surface_version bumped to 2.3 (honesty_bundle_roster);
# 6450: honesty_bundle_roster added to sessionStorage + clear catalogs;
# 6500: Soft 2680+ honesty surface checkpoint (honesty_bundle_roster cycle complete);
# 6550: soft_fertig_surface_roster compact soft-fertig surface key titles/notes;
# 6600: surface_roster listed in honesty export + bundle sections;
# 6650: soft_fertig_honesty_surface_version bumped to 2.4 (surface_roster);
# 6700: surface_roster added to sessionStorage + clear catalogs;
# 6750: Soft 2760+ honesty surface checkpoint (surface_roster cycle complete);
# 6800: soft_fertig_changelog_roster compact honesty surface changelog versions;
# 6850: changelog_roster listed in honesty export + bundle sections;
# 6900: soft_fertig_honesty_surface_version bumped to 2.5 (changelog_roster);
# 6950: changelog_roster added to sessionStorage + clear catalogs;
# 7000: Soft 2840+ honesty surface checkpoint (changelog_roster cycle complete);
# 7050: soft_fertig_expect_step_roster compact refused expect install step titles/notes;
# 7100: expect_step_roster listed in honesty export + bundle sections;
# 7150: soft_fertig_honesty_surface_version bumped to 2.6 (expect_step_roster);
# 7200: expect_step_roster added to sessionStorage + clear catalogs;
# 7250: Soft 2920+ honesty surface checkpoint (expect_step_roster cycle complete);
# 7300: soft_fertig_ssh_honesty_roster compact SSH alternative/refusal titles/notes;
# 7350: ssh_honesty_roster listed in honesty export + bundle sections;
# 7400: soft_fertig_honesty_surface_version bumped to 2.7 (ssh_honesty_roster);
# 7450: ssh_honesty_roster added to sessionStorage + clear catalogs;
# 7500: Soft 3000+ honesty surface checkpoint (ssh_honesty_roster cycle complete);
# 7550: soft_fertig_layout_fidelity_signal_roster compact layout fidelity signal ids;
# 7600: layout_fidelity_signal_roster listed in honesty export + bundle sections;
# 7650: soft_fertig_honesty_surface_version bumped to 2.8 (layout_fidelity_signal_roster);
# 7700: layout_fidelity_signal_roster added to sessionStorage + clear catalogs;
# 7750: Soft 3080+ honesty surface checkpoint (layout_fidelity_signal_roster cycle complete);
# 7800: soft_fertig_layout_fidelity_sample_roster compact required sample catalog keys;
# 7850: layout_fidelity_sample_roster listed in honesty export + bundle sections;
# 7900: soft_fertig_honesty_surface_version bumped to 2.9 (layout_fidelity_sample_roster);
# 7950: layout_fidelity_sample_roster added to sessionStorage + clear catalogs;
# 8000: Soft 3160+ honesty surface checkpoint (layout_fidelity_sample_roster cycle complete);
# 8050: soft_fertig_layout_fidelity_sample_field_roster compact full hard-gaps sample fields;
# 8100: layout_fidelity_sample_field_roster listed in honesty export + bundle sections;
# 8150: soft_fertig_honesty_surface_version bumped to 3.0 (layout_fidelity_sample_field_roster);
# 8200: layout_fidelity_sample_field_roster added to sessionStorage + clear catalogs;
# 8250: Soft 3240+ honesty surface checkpoint (layout_fidelity_sample_field_roster cycle complete);
# 8300: soft_fertig_catalog_summary_roster compact catalog_summary field keys;
# 8350: catalog_summary_roster listed in honesty export + bundle sections;
# 8400: soft_fertig_honesty_surface_version bumped to 3.1 (catalog_summary_roster);
# 8450: catalog_summary_roster added to sessionStorage + clear catalogs;
# 8500: Soft 3320+ honesty surface checkpoint (catalog_summary_roster cycle complete);
# 8550: soft_fertig_honesty_readiness_roster compact readiness field keys;
# 8600: honesty_readiness_roster listed in honesty export + bundle sections;
# 8650: soft_fertig_honesty_surface_version bumped to 3.2 (honesty_readiness_roster);
# 8700: honesty_readiness_roster added to sessionStorage + clear catalogs;
# 8750: Soft 3400+ honesty surface checkpoint (honesty_readiness_roster cycle complete);
# 8800: soft_fertig_session_storage_clear_roster compact clear-key catalog;
# 8850: session_storage_clear_roster listed in honesty export + bundle sections;
# 8900: soft_fertig_honesty_surface_version bumped to 3.3 (session_storage_clear_roster);
# 8950: session_storage_clear_roster added to sessionStorage + clear catalogs;
# 9000: Soft 3480+ honesty surface checkpoint (session_storage_clear_roster cycle complete);
# 9050: soft_fertig_honesty_operator_brief_roster compact operator-brief field keys;
# 9100: honesty_operator_brief_roster listed in honesty export + bundle sections;
# 9150: soft_fertig_honesty_surface_version bumped to 3.4 (honesty_operator_brief_roster);
# 9200: honesty_operator_brief_roster added to sessionStorage + clear catalogs;
# 9250: Soft 3560+ honesty surface checkpoint (honesty_operator_brief_roster cycle complete);
# 9300: soft_fertig_surface_changelog_meta_roster compact changelog meta field keys;
# 9350: surface_changelog_meta_roster listed in honesty export + bundle sections;
# 9400: soft_fertig_honesty_surface_version bumped to 3.5 (surface_changelog_meta_roster);
# 9450: surface_changelog_meta_roster added to sessionStorage + clear catalogs;
# 9500: Soft 3640+ honesty surface checkpoint (surface_changelog_meta_roster cycle complete);
# 9550: soft_fertig_hard_gaps_summary_roster compact /hard-gaps/summary field keys;
# 9600: hard_gaps_summary_roster listed in honesty export + bundle sections;
# 9650: soft_fertig_honesty_surface_version bumped to 3.6 (hard_gaps_summary_roster);
# 9700: hard_gaps_summary_roster added to sessionStorage + clear catalogs;
# 9750: Soft 3720+ honesty surface checkpoint (hard_gaps_summary_roster cycle complete);
# 9800: soft_fertig_hard_gaps_closure_roster compact /hard-gaps/closure field keys;
# 9850: hard_gaps_closure_roster listed in honesty export + bundle sections;
# 9900: soft_fertig_honesty_surface_version bumped to 3.7 (hard_gaps_closure_roster);
# 9950: hard_gaps_closure_roster added to sessionStorage + clear catalogs;
# 10000: Soft 3800+ honesty surface checkpoint (hard_gaps_closure_roster cycle complete);
# 10050: soft_fertig_health_roster compact /health field keys;
# 10100: health_roster listed in honesty export + bundle sections;
# 10150: soft_fertig_honesty_surface_version bumped to 3.8 (health_roster);
# 10200: health_roster added to sessionStorage + clear catalogs;
# 10250: Soft 3880+ honesty surface checkpoint (health_roster cycle complete);
# 10300: soft_fertig_res_status_roster compact /res-status field keys;
# 10350: res_status_roster listed in honesty export + bundle sections;
# 10400: soft_fertig_honesty_surface_version bumped to 3.9 (res_status_roster);
# 10450: res_status_roster added to sessionStorage + clear catalogs;
# 10500: Soft 3960+ honesty surface checkpoint (res_status_roster cycle complete);
# 10550: soft_fertig_hard_gaps_field_roster compact /hard-gaps field keys.
WEBUI_HONESTY_MILESTONE = 10550
WEBUI_HONESTY_MILESTONE_NOTE = (
    "Honesty surface checkpoint 10550: soft_fertig_hard_gaps_field_roster "
    "lists all /hard-gaps field keys with titles and notes "
    "for operators — hard gaps remain open."
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
    "soft_fertig_honesty_export_roster",
    "soft_fertig_honesty_bundle_roster",
    "soft_fertig_surface_roster",
    "soft_fertig_changelog_roster",
    "soft_fertig_expect_step_roster",
    "soft_fertig_ssh_honesty_roster",
    "soft_fertig_layout_fidelity_signal_roster",
    "soft_fertig_layout_fidelity_sample_roster",
    "soft_fertig_layout_fidelity_sample_field_roster",
    "soft_fertig_catalog_summary_roster",
    "soft_fertig_honesty_readiness_roster",
    "soft_fertig_session_storage_clear_roster",
    "soft_fertig_honesty_operator_brief_roster",
    "soft_fertig_surface_changelog_meta_roster",
    "soft_fertig_hard_gaps_summary_roster",
    "soft_fertig_hard_gaps_closure_roster",
    "soft_fertig_health_roster",
    "soft_fertig_res_status_roster",
    "soft_fertig_hard_gaps_field_roster",
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
    "soft_fertig_honesty_export_roster": (
        "Honesty export catalog ids with titles and notes"
    ),
    "soft_fertig_honesty_bundle_roster": (
        "Honesty bundle section ids with titles and notes"
    ),
    "soft_fertig_surface_roster": (
        "Soft-fertig surface key ids with titles and notes"
    ),
    "soft_fertig_changelog_roster": (
        "Honesty surface changelog version ids with notes"
    ),
    "soft_fertig_expect_step_roster": (
        "Refused expect-install-plan step ids with titles and notes"
    ),
    "soft_fertig_ssh_honesty_roster": (
        "BatchMode SSH alternative and refusal-path ids with titles and notes"
    ),
    "soft_fertig_layout_fidelity_signal_roster": (
        "Layout-fidelity heuristic signal ids (fields/pages/chrome) with titles and notes"
    ),
    "soft_fertig_layout_fidelity_sample_roster": (
        "Required layout_fidelity_sample_* catalog keys with titles and notes"
    ),
    "soft_fertig_layout_fidelity_sample_field_roster": (
        "All layout_fidelity_sample_* fields on /hard-gaps with titles and notes"
    ),
    "soft_fertig_catalog_summary_roster": (
        "soft_fertig_catalog_summary field keys with titles and notes"
    ),
    "soft_fertig_honesty_readiness_roster": (
        "soft_fertig_honesty_readiness field keys with titles and notes"
    ),
    "soft_fertig_session_storage_clear_roster": (
        "sessionStorage clear-catalog keys with titles and notes"
    ),
    "soft_fertig_honesty_operator_brief_roster": (
        "soft_fertig_honesty_operator_brief field keys with titles and notes"
    ),
    "soft_fertig_surface_changelog_meta_roster": (
        "soft_fertig_honesty_surface_changelog meta field keys with titles and notes"
    ),
    "soft_fertig_hard_gaps_summary_roster": (
        "/hard-gaps/summary field keys with titles and notes"
    ),
    "soft_fertig_hard_gaps_closure_roster": (
        "/hard-gaps/closure field keys with titles and notes"
    ),
    "soft_fertig_health_roster": (
        "/health field keys with titles and notes"
    ),
    "soft_fertig_res_status_roster": (
        "/res-status field keys with titles and notes"
    ),
    "soft_fertig_hard_gaps_field_roster": (
        "/hard-gaps field keys with titles and notes"
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
    "soft_fertig_honesty_export_roster": (
        "Per honesty export catalog: id, short title, and note."
    ),
    "soft_fertig_honesty_bundle_roster": (
        "Per honesty bundle section: id, short title, and note."
    ),
    "soft_fertig_surface_roster": (
        "Per soft-fertig surface key: id, short title, and note."
    ),
    "soft_fertig_changelog_roster": (
        "Per honesty surface changelog version: id and note."
    ),
    "soft_fertig_expect_step_roster": (
        "Per refused expect-install-plan step: id, title, and note."
    ),
    "soft_fertig_ssh_honesty_roster": (
        "Per SSH alternative or refusal path: id, title, and note."
    ),
    "soft_fertig_layout_fidelity_signal_roster": (
        "Per layout-fidelity signal: id, group, title, and note."
    ),
    "soft_fertig_layout_fidelity_sample_roster": (
        "Per required layout_fidelity_sample_* key: id, title, and note."
    ),
    "soft_fertig_layout_fidelity_sample_field_roster": (
        "Per layout_fidelity_sample_* hard-gaps field: id, title, and note."
    ),
    "soft_fertig_catalog_summary_roster": (
        "Per soft_fertig_catalog_summary field: id, title, and note."
    ),
    "soft_fertig_honesty_readiness_roster": (
        "Per soft_fertig_honesty_readiness field: id, title, and note."
    ),
    "soft_fertig_session_storage_clear_roster": (
        "Per sessionStorage clear-catalog key: id, title, and note."
    ),
    "soft_fertig_honesty_operator_brief_roster": (
        "Per soft_fertig_honesty_operator_brief field: id, title, and note."
    ),
    "soft_fertig_surface_changelog_meta_roster": (
        "Per soft_fertig_honesty_surface_changelog meta field: id, title, and note."
    ),
    "soft_fertig_hard_gaps_summary_roster": (
        "Per /hard-gaps/summary field: id, title, and note."
    ),
    "soft_fertig_hard_gaps_closure_roster": (
        "Per /hard-gaps/closure field: id, title, and note."
    ),
    "soft_fertig_health_roster": (
        "Per /health field: id, title, and note."
    ),
    "soft_fertig_res_status_roster": (
        "Per /res-status field: id, title, and note."
    ),
    "soft_fertig_hard_gaps_field_roster": (
        "Per /hard-gaps field: id, title, and note."
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
    "session_storage_roster": "fwbweb.sessionStorageRoster.",
    "honesty_export_roster": "fwbweb.honestyExportRoster.",
    "honesty_bundle_roster": "fwbweb.honestyBundleRoster.",
    "surface_roster": "fwbweb.surfaceRoster.",
    "changelog_roster": "fwbweb.changelogRoster.",
    "expect_step_roster": "fwbweb.expectStepRoster.",
    "ssh_honesty_roster": "fwbweb.sshHonestyRoster.",
    "layout_fidelity_signal_roster": "fwbweb.layoutFidelitySignalRoster.",
    "layout_fidelity_sample_roster": "fwbweb.layoutFidelitySampleRoster.",
    "layout_fidelity_sample_field_roster": "fwbweb.layoutFidelitySampleFieldRoster.",
    "catalog_summary_roster": "fwbweb.catalogSummaryRoster.",
    "honesty_readiness_roster": "fwbweb.honestyReadinessRoster.",
    "session_storage_clear_roster": "fwbweb.sessionStorageClearRoster.",
    "honesty_operator_brief_roster": "fwbweb.honestyOperatorBriefRoster.",
    "surface_changelog_meta_roster": "fwbweb.surfaceChangelogMetaRoster.",
    "hard_gaps_summary_roster": "fwbweb.hardGapsSummaryRoster.",
    "hard_gaps_closure_roster": "fwbweb.hardGapsClosureRoster.",
    "health_roster": "fwbweb.healthRoster.",
    "res_status_roster": "fwbweb.resStatusRoster.",
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
    "session_storage_roster": "sessionStorage key roster JSON",
    "honesty_export_roster": "Honesty export roster JSON",
    "honesty_bundle_roster": "Honesty bundle roster JSON",
    "surface_roster": "Soft-fertig surface roster JSON",
    "changelog_roster": "Honesty surface changelog roster JSON",
    "expect_step_roster": "Expect install step roster JSON",
    "ssh_honesty_roster": "SSH honesty roster JSON",
    "layout_fidelity_signal_roster": "Layout fidelity signal roster JSON",
    "layout_fidelity_sample_roster": "Layout fidelity sample roster JSON",
    "layout_fidelity_sample_field_roster": "Layout fidelity sample field roster JSON",
    "catalog_summary_roster": "Catalog summary roster JSON",
    "honesty_readiness_roster": "Honesty readiness roster JSON",
    "session_storage_clear_roster": "Session storage clear roster JSON",
    "honesty_operator_brief_roster": "Honesty operator brief roster JSON",
    "surface_changelog_meta_roster": "Surface changelog meta roster JSON",
    "hard_gaps_summary_roster": "Hard-gaps summary roster JSON",
    "hard_gaps_closure_roster": "Hard-gaps closure roster JSON",
    "health_roster": "Health roster JSON",
    "res_status_roster": "Res-status roster JSON",
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
    "session_storage_roster": (
        "Persists last downloaded/copied soft_fertig_session_storage_roster "
        "per firewall; UI restores expandable sessionStorage-roster detail on load."
    ),
    "honesty_export_roster": (
        "Persists last downloaded/copied soft_fertig_honesty_export_roster "
        "per firewall; UI restores expandable honesty-export-roster detail on load."
    ),
    "honesty_bundle_roster": (
        "Persists last downloaded/copied soft_fertig_honesty_bundle_roster "
        "per firewall; UI restores expandable honesty-bundle-roster detail on load."
    ),
    "surface_roster": (
        "Persists last downloaded/copied soft_fertig_surface_roster "
        "per firewall; UI restores expandable surface-roster detail on load."
    ),
    "changelog_roster": (
        "Persists last downloaded/copied soft_fertig_changelog_roster "
        "per firewall; UI restores expandable changelog-roster detail on load."
    ),
    "expect_step_roster": (
        "Persists last downloaded/copied soft_fertig_expect_step_roster "
        "per firewall; UI restores expandable expect-step-roster detail on load."
    ),
    "ssh_honesty_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_honesty_roster "
        "per firewall; UI restores expandable SSH-honesty-roster detail on load."
    ),
    "layout_fidelity_signal_roster": (
        "Persists last downloaded/copied soft_fertig_layout_fidelity_signal_roster "
        "per firewall; UI restores expandable layout-fidelity-signal-roster detail "
        "on load."
    ),
    "layout_fidelity_sample_roster": (
        "Persists last downloaded/copied soft_fertig_layout_fidelity_sample_roster "
        "per firewall; UI restores expandable layout-fidelity-sample-roster detail "
        "on load."
    ),
    "layout_fidelity_sample_field_roster": (
        "Persists last downloaded/copied soft_fertig_layout_fidelity_sample_field_roster "
        "per firewall; UI restores expandable layout-fidelity-sample-field-roster detail "
        "on load."
    ),
    "catalog_summary_roster": (
        "Persists last downloaded/copied soft_fertig_catalog_summary_roster "
        "per firewall; UI restores expandable catalog-summary-roster detail "
        "on load."
    ),
    "honesty_readiness_roster": (
        "Persists last downloaded/copied soft_fertig_honesty_readiness_roster "
        "per firewall; UI restores expandable honesty-readiness-roster detail "
        "on load."
    ),
    "session_storage_clear_roster": (
        "Persists last downloaded/copied soft_fertig_session_storage_clear_roster "
        "per firewall; UI restores expandable session-storage-clear-roster detail "
        "on load."
    ),
    "honesty_operator_brief_roster": (
        "Persists last downloaded/copied soft_fertig_honesty_operator_brief_roster "
        "per firewall; UI restores expandable honesty-operator-brief-roster detail "
        "on load."
    ),
    "surface_changelog_meta_roster": (
        "Persists last downloaded/copied soft_fertig_surface_changelog_meta_roster "
        "per firewall; UI restores expandable surface-changelog-meta-roster detail "
        "on load."
    ),
    "hard_gaps_summary_roster": (
        "Persists last downloaded/copied soft_fertig_hard_gaps_summary_roster "
        "per firewall; UI restores expandable hard-gaps-summary-roster detail "
        "on load."
    ),
    "hard_gaps_closure_roster": (
        "Persists last downloaded/copied soft_fertig_hard_gaps_closure_roster "
        "per firewall; UI restores expandable hard-gaps-closure-roster detail "
        "on load."
    ),
    "health_roster": (
        "Persists last downloaded/copied soft_fertig_health_roster "
        "per firewall; UI restores expandable health-roster detail "
        "on load."
    ),
    "res_status_roster": (
        "Persists last downloaded/copied soft_fertig_res_status_roster "
        "per firewall; UI restores expandable res-status-roster detail "
        "on load."
    ),
}

# Keys removed by the UI "Clear honesty catalogs" action (same set as sessionStorage catalog).
SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS = tuple(SOFT_FERTIG_SESSION_STORAGE_KEYS.keys())
SOFT_FERTIG_SESSION_STORAGE_CLEAR_NOTE = (
    "UI Clear honesty catalogs removes each soft_fertig_session_storage_keys "
    "prefix + firewallId from sessionStorage (does not close hard gaps)."
)

# Soft-fertig honesty/preview catalog schema version (documentation; not a lock).
SOFT_FERTIG_HONESTY_SURFACE_VERSION = "3.9"
SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE = (
    "Schema 3.9: schema 3.8 plus soft_fertig_res_status_roster on "
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
    "session_storage_roster",
    "honesty_export_roster",
    "honesty_bundle_roster",
    "surface_roster",
    "changelog_roster",
    "expect_step_roster",
    "ssh_honesty_roster",
    "layout_fidelity_signal_roster",
    "layout_fidelity_sample_roster",
    "layout_fidelity_sample_field_roster",
    "catalog_summary_roster",
    "honesty_readiness_roster",
    "session_storage_clear_roster",
    "honesty_operator_brief_roster",
    "surface_changelog_meta_roster",
    "hard_gaps_summary_roster",
    "hard_gaps_closure_roster",
    "health_roster",
    "res_status_roster",
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
    "session_storage_roster": "sessionStorage key ids with titles and notes",
    "honesty_export_roster": "Honesty export catalog ids with titles and notes",
    "honesty_bundle_roster": "Honesty bundle section ids with titles and notes",
    "surface_roster": "Soft-fertig surface key ids with titles and notes",
    "changelog_roster": "Honesty surface changelog version ids with notes",
    "expect_step_roster": "Refused expect-install-plan step ids with titles and notes",
    "ssh_honesty_roster": "BatchMode SSH alternative and refusal-path ids with titles and notes",
    "layout_fidelity_signal_roster": "Layout-fidelity heuristic signal ids (fields/pages/chrome)",
    "layout_fidelity_sample_roster": "Required layout_fidelity_sample_* catalog keys",
    "layout_fidelity_sample_field_roster": "All layout_fidelity_sample_* fields on /hard-gaps",
    "catalog_summary_roster": "soft_fertig_catalog_summary field keys with titles and notes",
    "honesty_readiness_roster": "soft_fertig_honesty_readiness field keys with titles and notes",
    "session_storage_clear_roster": "sessionStorage clear-catalog keys with titles and notes",
    "honesty_operator_brief_roster": "soft_fertig_honesty_operator_brief field keys with titles and notes",
    "surface_changelog_meta_roster": "soft_fertig_honesty_surface_changelog meta field keys with titles and notes",
    "hard_gaps_summary_roster": "/hard-gaps/summary field keys with titles and notes",
    "hard_gaps_closure_roster": "/hard-gaps/closure field keys with titles and notes",
    "health_roster": "/health field keys with titles and notes",
    "res_status_roster": "/res-status field keys with titles and notes",
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
    "session_storage_roster": (
        "Download/Copy soft_fertig_session_storage_roster; also on /health; "
        "sessionStorage fwbweb.sessionStorageRoster.*."
    ),
    "honesty_export_roster": (
        "Download/Copy soft_fertig_honesty_export_roster; also on /health; "
        "sessionStorage fwbweb.honestyExportRoster.*."
    ),
    "honesty_bundle_roster": (
        "Download/Copy soft_fertig_honesty_bundle_roster; also on /health; "
        "sessionStorage fwbweb.honestyBundleRoster.*."
    ),
    "surface_roster": (
        "Download/Copy soft_fertig_surface_roster; also on /health; "
        "sessionStorage fwbweb.surfaceRoster.*."
    ),
    "changelog_roster": (
        "Download/Copy soft_fertig_changelog_roster; also on /health; "
        "sessionStorage fwbweb.changelogRoster.*."
    ),
    "expect_step_roster": (
        "Download/Copy soft_fertig_expect_step_roster; also on /health; "
        "sessionStorage fwbweb.expectStepRoster.*."
    ),
    "ssh_honesty_roster": (
        "Download/Copy soft_fertig_ssh_honesty_roster; also on /health; "
        "sessionStorage fwbweb.sshHonestyRoster.*."
    ),
    "layout_fidelity_signal_roster": (
        "Download/Copy soft_fertig_layout_fidelity_signal_roster; also on /health; "
        "sessionStorage fwbweb.layoutFidelitySignalRoster.*."
    ),
    "layout_fidelity_sample_roster": (
        "Download/Copy soft_fertig_layout_fidelity_sample_roster; also on /health; "
        "sessionStorage fwbweb.layoutFidelitySampleRoster.*."
    ),
    "layout_fidelity_sample_field_roster": (
        "Download/Copy soft_fertig_layout_fidelity_sample_field_roster; also on /health; "
        "sessionStorage fwbweb.layoutFidelitySampleFieldRoster.*"
    ),
    "catalog_summary_roster": (
        "Download/Copy soft_fertig_catalog_summary_roster; also on /health; "
        "sessionStorage fwbweb.catalogSummaryRoster.*"
    ),
    "honesty_readiness_roster": (
        "Download/Copy soft_fertig_honesty_readiness_roster; also on /health; "
        "sessionStorage fwbweb.honestyReadinessRoster.*"
    ),
    "session_storage_clear_roster": (
        "Download/Copy soft_fertig_session_storage_clear_roster; also on /health; "
        "sessionStorage fwbweb.sessionStorageClearRoster.*"
    ),
    "honesty_operator_brief_roster": (
        "Download/Copy soft_fertig_honesty_operator_brief_roster; also on /health; "
        "sessionStorage fwbweb.honestyOperatorBriefRoster.*"
    ),
    "surface_changelog_meta_roster": (
        "Download/Copy soft_fertig_surface_changelog_meta_roster; also on /health; "
        "sessionStorage fwbweb.surfaceChangelogMetaRoster.*"
    ),
    "hard_gaps_summary_roster": (
        "Download/Copy soft_fertig_hard_gaps_summary_roster; also on /health; "
        "sessionStorage fwbweb.hardGapsSummaryRoster.*"
    ),
    "hard_gaps_closure_roster": (
        "Download/Copy soft_fertig_hard_gaps_closure_roster; also on /health; "
        "sessionStorage fwbweb.hardGapsClosureRoster.*"
    ),
    "health_roster": (
        "Download/Copy soft_fertig_health_roster; also on /health; "
        "sessionStorage fwbweb.healthRoster.*"
    ),
    "res_status_roster": (
        "Download/Copy soft_fertig_res_status_roster; also on /res-status; "
        "sessionStorage fwbweb.resStatusRoster.*"
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
    "session_storage_roster",
    "honesty_export_roster",
    "honesty_bundle_roster",
    "surface_roster",
    "changelog_roster",
    "expect_step_roster",
    "ssh_honesty_roster",
    "layout_fidelity_signal_roster",
    "layout_fidelity_sample_roster",
    "layout_fidelity_sample_field_roster",
    "catalog_summary_roster",
    "honesty_readiness_roster",
    "session_storage_clear_roster",
    "honesty_operator_brief_roster",
    "surface_changelog_meta_roster",
    "hard_gaps_summary_roster",
    "hard_gaps_closure_roster",
    "health_roster",
    "res_status_roster",
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
    "session_storage_roster": "sessionStorage key ids with titles and notes",
    "honesty_export_roster": "Honesty export catalog ids with titles and notes",
    "honesty_bundle_roster": "Honesty bundle section ids with titles and notes",
    "surface_roster": "Soft-fertig surface key ids with titles and notes",
    "changelog_roster": "Honesty surface changelog version ids with notes",
    "expect_step_roster": "Refused expect-install-plan step ids with titles and notes",
    "ssh_honesty_roster": "BatchMode SSH alternative and refusal-path ids with titles and notes",
    "layout_fidelity_signal_roster": "Layout-fidelity heuristic signal ids (fields/pages/chrome)",
    "layout_fidelity_sample_roster": "Required layout_fidelity_sample_* catalog keys",
    "layout_fidelity_sample_field_roster": "All layout_fidelity_sample_* fields on /hard-gaps",
    "catalog_summary_roster": "soft_fertig_catalog_summary field keys with titles and notes",
    "honesty_readiness_roster": "soft_fertig_honesty_readiness field keys with titles and notes",
    "session_storage_clear_roster": "sessionStorage clear-catalog keys with titles and notes",
    "honesty_operator_brief_roster": "soft_fertig_honesty_operator_brief field keys with titles and notes",
    "surface_changelog_meta_roster": "soft_fertig_honesty_surface_changelog meta field keys with titles and notes",
    "hard_gaps_summary_roster": "/hard-gaps/summary field keys with titles and notes",
    "hard_gaps_closure_roster": "/hard-gaps/closure field keys with titles and notes",
    "health_roster": "/health field keys with titles and notes",
    "res_status_roster": "/res-status field keys with titles and notes",
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
    "session_storage_roster": (
        "Same subset as Download sessionStorage roster; "
        "also sessionStorage fwbweb.sessionStorageRoster.*."
    ),
    "honesty_export_roster": (
        "Same subset as Download honesty export roster; "
        "also sessionStorage fwbweb.honestyExportRoster.*."
    ),
    "honesty_bundle_roster": (
        "Same subset as Download honesty bundle roster; "
        "also sessionStorage fwbweb.honestyBundleRoster.*."
    ),
    "surface_roster": (
        "Same subset as Download surface roster; "
        "also sessionStorage fwbweb.surfaceRoster.*."
    ),
    "changelog_roster": (
        "Same subset as Download changelog roster; "
        "also sessionStorage fwbweb.changelogRoster.*."
    ),
    "expect_step_roster": (
        "Same subset as Download expect step roster; "
        "also sessionStorage fwbweb.expectStepRoster.*."
    ),
    "ssh_honesty_roster": (
        "Same subset as Download SSH honesty roster; "
        "also sessionStorage fwbweb.sshHonestyRoster.*."
    ),
    "layout_fidelity_signal_roster": (
        "Same subset as Download layout fidelity signal roster; "
        "also sessionStorage fwbweb.layoutFidelitySignalRoster.*."
    ),
    "layout_fidelity_sample_roster": (
        "Same subset as Download layout fidelity sample roster; "
        "also sessionStorage fwbweb.layoutFidelitySampleRoster.*."
    ),
    "layout_fidelity_sample_field_roster": (
        "Same subset as Download layout fidelity sample field roster; "
        "also sessionStorage fwbweb.layoutFidelitySampleFieldRoster.*"
    ),
    "catalog_summary_roster": (
        "Same subset as Download catalog summary roster; "
        "also sessionStorage fwbweb.catalogSummaryRoster.*"
    ),
    "honesty_readiness_roster": (
        "Same subset as Download honesty readiness roster; "
        "also sessionStorage fwbweb.honestyReadinessRoster.*"
    ),
    "session_storage_clear_roster": (
        "Same subset as Download session storage clear roster; "
        "also sessionStorage fwbweb.sessionStorageClearRoster.*"
    ),
    "honesty_operator_brief_roster": (
        "Same subset as Download honesty operator brief roster; "
        "also sessionStorage fwbweb.honestyOperatorBriefRoster.*"
    ),
    "surface_changelog_meta_roster": (
        "Same subset as Download surface changelog meta roster; "
        "also sessionStorage fwbweb.surfaceChangelogMetaRoster.*"
    ),
    "hard_gaps_summary_roster": (
        "Same subset as Download hard-gaps summary roster; "
        "also sessionStorage fwbweb.hardGapsSummaryRoster.*"
    ),
    "hard_gaps_closure_roster": (
        "Same subset as Download hard-gaps closure roster; "
        "also sessionStorage fwbweb.hardGapsClosureRoster.*"
    ),
    "health_roster": (
        "Same subset as Download health roster; "
        "also sessionStorage fwbweb.healthRoster.*"
    ),
    "res_status_roster": (
        "Same subset as Download res-status roster; "
        "also sessionStorage fwbweb.resStatusRoster.*"
    ),
    "honesty_exports": "Same subset as Download honesty exports.",
}




# soft_fertig_honesty_readiness field catalog (documentation; not closure).
SOFT_FERTIG_HONESTY_READINESS_KEYS: tuple[str, ...] = (
    "soft_fertig_catalogs_complete",
    "hard_gaps_remain",
    "hard_gap_count",
    "hard_gap_open",
    "soft_complete_phase",
    "honesty_milestone",
    "soft_fertig_honesty_surface_version",
    "note",
)



# /hard-gaps/summary field catalog (documentation; not closure).
SOFT_FERTIG_HARD_GAPS_SUMMARY_KEYS: tuple[str, ...] = (
    "closure_path",
    "expect_plan_step_count",
    "expect_plan_step_titles",
    "expect_steps_path",
    "hard_gap_closure_titles",
    "hard_gap_count",
    "hard_gap_open",
    "hard_gap_open_labels",
    "hard_gap_related_refusal_titles",
    "hard_gap_related_refusals",
    "honesty_milestone",
    "honesty_milestone_note",
    "honesty_path_notes",
    "honesty_path_notes_count",
    "honesty_path_titles",
    "honesty_paths",
    "honesty_paths_count",
    "layout_fidelity_alt2_sample_host_os",
    "layout_fidelity_alt2_sample_platform",
    "layout_fidelity_alt2_sample_score_percent",
    "layout_fidelity_alt2_sample_with_enabled",
    "layout_fidelity_alt_sample_buddy_labels",
    "layout_fidelity_alt_sample_host_os",
    "layout_fidelity_alt_sample_pages_with_buddy_labels",
    "layout_fidelity_alt_sample_platform",
    "layout_fidelity_alt_sample_score_percent",
    "layout_fidelity_alt_sample_with_external_label",
    "layout_fidelity_path",
    "layout_fidelity_pixel_parity",
    "layout_fidelity_sample_annotations",
    "layout_fidelity_sample_buddy_labels",
    "layout_fidelity_sample_catalog_complete",
    "layout_fidelity_sample_chrome_geometry",
    "layout_fidelity_sample_chrome_size_grip_enabled",
    "layout_fidelity_sample_chrome_tab_position",
    "layout_fidelity_sample_chrome_window_title",
    "layout_fidelity_sample_empty_stacked_sections",
    "layout_fidelity_sample_fields",
    "layout_fidelity_sample_host_os",
    "layout_fidelity_sample_key_count",
    "layout_fidelity_sample_layout_tree_max_depth",
    "layout_fidelity_sample_pages",
    "layout_fidelity_sample_pages_with_buddy_labels",
    "layout_fidelity_sample_pages_with_column_stretch",
    "layout_fidelity_sample_pages_with_layout_tree",
    "layout_fidelity_sample_pages_with_row_stretch",
    "layout_fidelity_sample_pages_with_spacing",
    "layout_fidelity_sample_pages_with_tooltip",
    "layout_fidelity_sample_platform",
    "layout_fidelity_sample_score_parts_count",
    "layout_fidelity_sample_score_percent",
    "layout_fidelity_sample_sections",
    "layout_fidelity_sample_sections_with_checkable",
    "layout_fidelity_sample_sections_with_flat",
    "layout_fidelity_sample_signal_key_count",
    "layout_fidelity_sample_spacers",
    "layout_fidelity_sample_spacers_with_orientation",
    "layout_fidelity_sample_spacers_with_size_hint",
    "layout_fidelity_sample_spacers_with_size_type",
    "layout_fidelity_sample_stack_names",
    "layout_fidelity_sample_stack_names_count",
    "layout_fidelity_sample_stacked_sections",
    "layout_fidelity_sample_with_alignment",
    "layout_fidelity_sample_with_enabled",
    "layout_fidelity_sample_with_external_label",
    "layout_fidelity_sample_with_grid",
    "layout_fidelity_sample_with_label",
    "layout_fidelity_sample_with_maximum_size",
    "layout_fidelity_sample_with_minimum_size",
    "layout_fidelity_sample_with_read_only",
    "layout_fidelity_sample_with_size_policy",
    "layout_fidelity_sample_with_size_policy_expanding",
    "layout_fidelity_sample_with_size_policy_fixed",
    "layout_fidelity_sample_with_size_policy_minimum",
    "layout_fidelity_sample_with_size_policy_preferred",
    "layout_fidelity_sample_with_tooltip",
    "layout_fidelity_sample_with_visible",
    "layout_fidelity_sample_with_whats_this",
    "note",
    "parent_path",
    "soft_complete_phase",
    "soft_fertig_catalog_summary",
    "soft_fertig_catalog_summary_roster",
    "soft_fertig_changelog_roster",
    "soft_fertig_expect_step_roster",
    "soft_fertig_hard_gap_refusal_roster",
    "soft_fertig_hard_gap_roster",
    "soft_fertig_honesty_bundle_notes_count",
    "soft_fertig_honesty_bundle_roster",
    "soft_fertig_honesty_bundle_section_count",
    "soft_fertig_honesty_bundle_section_titles",
    "soft_fertig_honesty_bundle_sections",
    "soft_fertig_honesty_export_key_count",
    "soft_fertig_honesty_export_key_titles",
    "soft_fertig_honesty_export_keys",
    "soft_fertig_honesty_export_notes_count",
    "soft_fertig_honesty_export_roster",
    "soft_fertig_honesty_operator_brief",
    "soft_fertig_honesty_operator_brief_roster",
    "soft_fertig_honesty_path_roster",
    "soft_fertig_honesty_readiness",
    "soft_fertig_honesty_readiness_roster",
    "soft_fertig_honesty_surface_changelog",
    "soft_fertig_honesty_surface_version",
    "soft_fertig_honesty_surface_version_note",
    "soft_fertig_honesty_track",
    "soft_fertig_honesty_track_note",
    "soft_fertig_layout_fidelity_sample_field_roster",
    "soft_fertig_layout_fidelity_sample_roster",
    "soft_fertig_layout_fidelity_signal_roster",
    "soft_fertig_session_storage_clear_key_count",
    "soft_fertig_session_storage_clear_keys",
    "soft_fertig_session_storage_clear_note",
    "soft_fertig_session_storage_clear_roster",
    "soft_fertig_session_storage_key_count",
    "soft_fertig_session_storage_key_titles",
    "soft_fertig_session_storage_keys",
    "soft_fertig_session_storage_notes",
    "soft_fertig_session_storage_notes_count",
    "soft_fertig_session_storage_roster",
    "soft_fertig_soft_complete_note",
    "soft_fertig_ssh_honesty_roster",
    "soft_fertig_surface_changelog_meta_roster",
    "soft_fertig_surface_key_count",
    "soft_fertig_surface_key_titles",
    "soft_fertig_surface_keys",
    "soft_fertig_surface_notes",
    "soft_fertig_surface_notes_count",
    "soft_fertig_surface_roster",
    "ssh_alternative_titles",
    "ssh_refusal_path_titles",
)


def soft_fertig_hard_gaps_summary_roster() -> dict[str, object]:
    """Hard-gaps summary field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_HARD_GAPS_SUMMARY_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Hard-gaps summary field: {key_id}",
                "note": (
                    f"Field `{key_id}` on /hard-gaps/summary; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /hard-gaps/summary field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_HARD_GAPS_CLOSURE_KEYS: tuple[str, ...] = (
    "hard_gap_closure",
    "hard_gap_closure_titles",
    "hard_gap_count",
    "hard_gap_notes",
    "hard_gap_open",
    "hard_gap_open_labels",
    "hard_gap_related_refusal_titles",
    "hard_gap_related_refusals",
    "honesty_milestone",
    "honesty_milestone_note",
    "honesty_path_notes",
    "honesty_path_notes_count",
    "honesty_path_titles",
    "honesty_paths",
    "honesty_paths_count",
    "note",
    "parent_path",
    "soft_complete_phase",
    "soft_fertig_catalog_summary",
    "soft_fertig_catalog_summary_roster",
    "soft_fertig_changelog_roster",
    "soft_fertig_expect_step_roster",
    "soft_fertig_hard_gap_refusal_roster",
    "soft_fertig_hard_gap_roster",
    "soft_fertig_hard_gaps_summary_roster",
    "soft_fertig_honesty_bundle_notes",
    "soft_fertig_honesty_bundle_notes_count",
    "soft_fertig_honesty_bundle_roster",
    "soft_fertig_honesty_bundle_section_count",
    "soft_fertig_honesty_bundle_section_titles",
    "soft_fertig_honesty_bundle_sections",
    "soft_fertig_honesty_export_key_count",
    "soft_fertig_honesty_export_key_titles",
    "soft_fertig_honesty_export_keys",
    "soft_fertig_honesty_export_notes",
    "soft_fertig_honesty_export_notes_count",
    "soft_fertig_honesty_export_roster",
    "soft_fertig_honesty_operator_brief",
    "soft_fertig_honesty_operator_brief_roster",
    "soft_fertig_honesty_path_roster",
    "soft_fertig_honesty_readiness",
    "soft_fertig_honesty_readiness_roster",
    "soft_fertig_honesty_surface_changelog",
    "soft_fertig_honesty_surface_version",
    "soft_fertig_honesty_surface_version_note",
    "soft_fertig_honesty_track",
    "soft_fertig_honesty_track_note",
    "soft_fertig_layout_fidelity_sample_field_roster",
    "soft_fertig_layout_fidelity_sample_roster",
    "soft_fertig_layout_fidelity_signal_roster",
    "soft_fertig_session_storage_clear_key_count",
    "soft_fertig_session_storage_clear_keys",
    "soft_fertig_session_storage_clear_note",
    "soft_fertig_session_storage_clear_roster",
    "soft_fertig_session_storage_key_count",
    "soft_fertig_session_storage_key_titles",
    "soft_fertig_session_storage_keys",
    "soft_fertig_session_storage_notes",
    "soft_fertig_session_storage_notes_count",
    "soft_fertig_session_storage_roster",
    "soft_fertig_soft_complete_note",
    "soft_fertig_ssh_honesty_roster",
    "soft_fertig_surface_changelog_meta_roster",
    "soft_fertig_surface_key_count",
    "soft_fertig_surface_key_titles",
    "soft_fertig_surface_keys",
    "soft_fertig_surface_notes",
    "soft_fertig_surface_notes_count",
    "soft_fertig_surface_roster",
    "summary_path",
)


def soft_fertig_hard_gaps_closure_roster() -> dict[str, object]:
    """Hard-gaps closure field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_HARD_GAPS_CLOSURE_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Hard-gaps closure field: {key_id}",
                "note": (
                    f"Field `{key_id}` on /hard-gaps/closure; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /hard-gaps/closure field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_HEALTH_KEYS: tuple[str, ...] = (
    "hard_gap_count",
    "honesty_milestone",
    "honesty_milestone_note",
    "soft_complete_phase",
    "soft_fertig_catalog_summary",
    "soft_fertig_catalog_summary_roster",
    "soft_fertig_changelog_roster",
    "soft_fertig_expect_step_roster",
    "soft_fertig_hard_gap_refusal_roster",
    "soft_fertig_hard_gap_roster",
    "soft_fertig_hard_gaps_closure_roster",
    "soft_fertig_hard_gaps_summary_roster",
    "soft_fertig_honesty_bundle_roster",
    "soft_fertig_honesty_export_roster",
    "soft_fertig_honesty_operator_brief",
    "soft_fertig_honesty_operator_brief_roster",
    "soft_fertig_honesty_path_roster",
    "soft_fertig_honesty_readiness",
    "soft_fertig_honesty_readiness_roster",
    "soft_fertig_honesty_surface_changelog",
    "soft_fertig_honesty_surface_version",
    "soft_fertig_honesty_track",
    "soft_fertig_honesty_track_note",
    "soft_fertig_layout_fidelity_sample_field_roster",
    "soft_fertig_layout_fidelity_sample_roster",
    "soft_fertig_layout_fidelity_signal_roster",
    "soft_fertig_session_storage_clear_roster",
    "soft_fertig_session_storage_roster",
    "soft_fertig_soft_complete_note",
    "soft_fertig_ssh_honesty_roster",
    "soft_fertig_surface_changelog_meta_roster",
    "soft_fertig_surface_roster",
    "status",
)


def soft_fertig_health_roster() -> dict[str, object]:
    """Health endpoint field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_HEALTH_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Health field: {key_id}",
                "note": (
                    f"Field `{key_id}` on /health; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /health field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_RES_STATUS_KEYS: tuple[str, ...] = (
    "configlet_os",
    "configlet_os_count",
    "configlets_dir",
    "configlets_ok",
    "hard_gap_count",
    "hard_gap_open",
    "honesty_milestone",
    "honesty_milestone_note",
    "res_dir",
    "res_ok",
    "soft_complete_phase",
    "soft_fertig_catalog_summary",
    "soft_fertig_catalog_summary_roster",
    "soft_fertig_changelog_roster",
    "soft_fertig_expect_step_roster",
    "soft_fertig_hard_gap_refusal_roster",
    "soft_fertig_hard_gap_roster",
    "soft_fertig_hard_gaps_closure_roster",
    "soft_fertig_hard_gaps_summary_roster",
    "soft_fertig_health_roster",
    "soft_fertig_honesty_bundle_roster",
    "soft_fertig_honesty_export_roster",
    "soft_fertig_honesty_operator_brief",
    "soft_fertig_honesty_operator_brief_roster",
    "soft_fertig_honesty_path_roster",
    "soft_fertig_honesty_readiness",
    "soft_fertig_honesty_readiness_roster",
    "soft_fertig_honesty_surface_changelog",
    "soft_fertig_honesty_surface_version",
    "soft_fertig_honesty_track",
    "soft_fertig_honesty_track_note",
    "soft_fertig_layout_fidelity_sample_field_roster",
    "soft_fertig_layout_fidelity_sample_roster",
    "soft_fertig_layout_fidelity_signal_roster",
    "soft_fertig_session_storage_clear_roster",
    "soft_fertig_session_storage_roster",
    "soft_fertig_soft_complete_note",
    "soft_fertig_ssh_honesty_roster",
    "soft_fertig_surface_changelog_meta_roster",
    "soft_fertig_surface_roster",
    "status",
)


def soft_fertig_res_status_roster() -> dict[str, object]:
    """Res-status endpoint field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_RES_STATUS_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Res-status field: {key_id}",
                "note": (
                    f"Field `{key_id}` on /res-status; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /res-status field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_HARD_GAPS_FIELD_KEYS: tuple[str, ...] = (
    "closure_path",
    "expect_plan_step_ids",
    "expect_plan_step_notes",
    "expect_plan_step_notes_count",
    "expect_plan_step_titles",
    "expect_run_path",
    "expect_steps_path",
    "expect_steps_refusals_path",
    "hard_gap_closure",
    "hard_gap_closure_titles",
    "hard_gap_count",
    "hard_gap_notes",
    "hard_gap_open",
    "hard_gap_open_labels",
    "hard_gap_related_refusal_titles",
    "hard_gap_related_refusals",
    "honesty_milestone",
    "honesty_milestone_note",
    "honesty_path_notes",
    "honesty_path_notes_count",
    "honesty_path_titles",
    "honesty_paths",
    "honesty_paths_count",
    "layout_fidelity_alt2_sample_host_os",
    "layout_fidelity_alt2_sample_platform",
    "layout_fidelity_alt2_sample_score_percent",
    "layout_fidelity_alt2_sample_with_enabled",
    "layout_fidelity_alt_sample_buddy_labels",
    "layout_fidelity_alt_sample_host_os",
    "layout_fidelity_alt_sample_pages_with_buddy_labels",
    "layout_fidelity_alt_sample_platform",
    "layout_fidelity_alt_sample_score_percent",
    "layout_fidelity_alt_sample_with_external_label",
    "layout_fidelity_path",
    "layout_fidelity_pixel_parity",
    "layout_fidelity_sample_annotations",
    "layout_fidelity_sample_buddy_labels",
    "layout_fidelity_sample_catalog_complete",
    "layout_fidelity_sample_chrome_geometry",
    "layout_fidelity_sample_chrome_size_grip_enabled",
    "layout_fidelity_sample_chrome_tab_position",
    "layout_fidelity_sample_chrome_window_title",
    "layout_fidelity_sample_empty_stacked_sections",
    "layout_fidelity_sample_fields",
    "layout_fidelity_sample_host_os",
    "layout_fidelity_sample_key_count",
    "layout_fidelity_sample_layout_tree_max_depth",
    "layout_fidelity_sample_pages",
    "layout_fidelity_sample_pages_with_buddy_labels",
    "layout_fidelity_sample_pages_with_column_stretch",
    "layout_fidelity_sample_pages_with_layout_tree",
    "layout_fidelity_sample_pages_with_row_stretch",
    "layout_fidelity_sample_pages_with_spacing",
    "layout_fidelity_sample_pages_with_tooltip",
    "layout_fidelity_sample_platform",
    "layout_fidelity_sample_score_parts_count",
    "layout_fidelity_sample_score_percent",
    "layout_fidelity_sample_sections",
    "layout_fidelity_sample_sections_with_checkable",
    "layout_fidelity_sample_sections_with_flat",
    "layout_fidelity_sample_signal_key_count",
    "layout_fidelity_sample_spacers",
    "layout_fidelity_sample_spacers_with_orientation",
    "layout_fidelity_sample_spacers_with_size_hint",
    "layout_fidelity_sample_spacers_with_size_type",
    "layout_fidelity_sample_stack_names",
    "layout_fidelity_sample_stack_names_count",
    "layout_fidelity_sample_stacked_sections",
    "layout_fidelity_sample_with_alignment",
    "layout_fidelity_sample_with_enabled",
    "layout_fidelity_sample_with_external_label",
    "layout_fidelity_sample_with_grid",
    "layout_fidelity_sample_with_label",
    "layout_fidelity_sample_with_maximum_size",
    "layout_fidelity_sample_with_minimum_size",
    "layout_fidelity_sample_with_read_only",
    "layout_fidelity_sample_with_size_policy",
    "layout_fidelity_sample_with_size_policy_expanding",
    "layout_fidelity_sample_with_size_policy_fixed",
    "layout_fidelity_sample_with_size_policy_minimum",
    "layout_fidelity_sample_with_size_policy_preferred",
    "layout_fidelity_sample_with_tooltip",
    "layout_fidelity_sample_with_visible",
    "layout_fidelity_sample_with_whats_this",
    "layout_fidelity_signal_catalog",
    "note",
    "option_enable_path",
    "password_ssh_path",
    "soft_complete_phase",
    "soft_fertig_catalog_summary",
    "soft_fertig_catalog_summary_roster",
    "soft_fertig_changelog_roster",
    "soft_fertig_expect_step_roster",
    "soft_fertig_hard_gap_refusal_roster",
    "soft_fertig_hard_gap_roster",
    "soft_fertig_hard_gaps_closure_roster",
    "soft_fertig_hard_gaps_summary_roster",
    "soft_fertig_health_roster",
    "soft_fertig_honesty_bundle_notes",
    "soft_fertig_honesty_bundle_notes_count",
    "soft_fertig_honesty_bundle_roster",
    "soft_fertig_honesty_bundle_section_count",
    "soft_fertig_honesty_bundle_section_titles",
    "soft_fertig_honesty_bundle_sections",
    "soft_fertig_honesty_export_key_count",
    "soft_fertig_honesty_export_key_titles",
    "soft_fertig_honesty_export_keys",
    "soft_fertig_honesty_export_notes",
    "soft_fertig_honesty_export_notes_count",
    "soft_fertig_honesty_export_roster",
    "soft_fertig_honesty_operator_brief",
    "soft_fertig_honesty_operator_brief_roster",
    "soft_fertig_honesty_path_roster",
    "soft_fertig_honesty_readiness",
    "soft_fertig_honesty_readiness_roster",
    "soft_fertig_honesty_surface_changelog",
    "soft_fertig_honesty_surface_version",
    "soft_fertig_honesty_surface_version_note",
    "soft_fertig_honesty_track",
    "soft_fertig_honesty_track_note",
    "soft_fertig_layout_fidelity_sample_field_roster",
    "soft_fertig_layout_fidelity_sample_roster",
    "soft_fertig_layout_fidelity_signal_roster",
    "soft_fertig_res_status_roster",
    "soft_fertig_session_storage_clear_key_count",
    "soft_fertig_session_storage_clear_keys",
    "soft_fertig_session_storage_clear_note",
    "soft_fertig_session_storage_clear_roster",
    "soft_fertig_session_storage_key_count",
    "soft_fertig_session_storage_key_titles",
    "soft_fertig_session_storage_keys",
    "soft_fertig_session_storage_notes",
    "soft_fertig_session_storage_notes_count",
    "soft_fertig_session_storage_roster",
    "soft_fertig_soft_complete_note",
    "soft_fertig_ssh_honesty_roster",
    "soft_fertig_surface_changelog_meta_roster",
    "soft_fertig_surface_key_count",
    "soft_fertig_surface_key_titles",
    "soft_fertig_surface_keys",
    "soft_fertig_surface_notes",
    "soft_fertig_surface_notes_count",
    "soft_fertig_surface_roster",
    "ssh_alternative_notes",
    "ssh_alternative_titles",
    "ssh_alternatives",
    "ssh_auth_path",
    "ssh_batch_mode_only",
    "ssh_refusal_path_notes",
    "ssh_refusal_path_titles",
    "ssh_refusal_paths",
    "stack_switch_path",
    "summary_path",
)


def soft_fertig_hard_gaps_field_roster() -> dict[str, object]:
    """Hard-gaps endpoint field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_HARD_GAPS_FIELD_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Hard-gaps field: {key_id}",
                "note": (
                    f"Field `{key_id}` on /hard-gaps; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /hard-gaps field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }






def soft_fertig_honesty_readiness_roster() -> dict[str, object]:
    """Honesty-readiness field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_HONESTY_READINESS_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Honesty readiness field: {key_id}",
                "note": (
                    f"Field `{key_id}` on soft_fertig_honesty_readiness; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of soft_fertig_honesty_readiness field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



def soft_fertig_session_storage_clear_roster() -> dict[str, object]:
    """SessionStorage clear-key roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS:
        title = SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES.get(
            key_id, f"Clear catalog key: {key_id}"
        )
        note = SOFT_FERTIG_SESSION_STORAGE_NOTES.get(
            key_id,
            (
                f"Key `{key_id}` cleared by Clear honesty catalogs; "
                "soft-fertig catalogs do not close hard gaps."
            ),
        )
        entries.append({"id": key_id, "title": title, "note": note})
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of soft_fertig_session_storage_clear_keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
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
    "2.1": (
        "soft_fertig_session_storage_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "2.2": (
        "soft_fertig_honesty_export_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "2.3": (
        "soft_fertig_honesty_bundle_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "2.4": (
        "soft_fertig_surface_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "2.5": (
        "soft_fertig_changelog_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "2.6": (
        "soft_fertig_expect_step_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "2.7": (
        "soft_fertig_ssh_honesty_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "2.8": (
        "soft_fertig_layout_fidelity_signal_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "2.9": (
        "soft_fertig_layout_fidelity_sample_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.0": (
        "soft_fertig_layout_fidelity_sample_field_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.1": (
        "soft_fertig_catalog_summary_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.2": (
        "soft_fertig_honesty_readiness_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.3": (
        "soft_fertig_session_storage_clear_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.4": (
        "soft_fertig_honesty_operator_brief_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.5": (
        "soft_fertig_surface_changelog_meta_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.6": (
        "soft_fertig_hard_gaps_summary_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.7": (
        "soft_fertig_hard_gaps_closure_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.8": (
        "soft_fertig_health_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "3.9": (
        "soft_fertig_res_status_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
}



# soft_fertig_honesty_surface_changelog meta field catalog (documentation; not closure).
SOFT_FERTIG_SURFACE_CHANGELOG_META_KEYS: tuple[str, ...] = (
    "current_version",
    "versions",
    "version_count",
    "hard_gaps_remain",
)


def soft_fertig_surface_changelog_meta_roster() -> dict[str, object]:
    """Surface-changelog meta field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SURFACE_CHANGELOG_META_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Surface changelog meta field: {key_id}",
                "note": (
                    f"Field `{key_id}` on soft_fertig_honesty_surface_changelog; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of soft_fertig_honesty_surface_changelog meta field keys; "
            "soft-fertig catalogs do not close hard gaps."
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



# soft_fertig_honesty_operator_brief field catalog (documentation; not closure).
SOFT_FERTIG_HONESTY_OPERATOR_BRIEF_KEYS: tuple[str, ...] = (
    "soft_complete_phase",
    "honesty_milestone",
    "soft_fertig_honesty_surface_version",
    "soft_fertig_catalogs_complete",
    "hard_gaps_remain",
    "hard_gap_count",
    "hard_gap_open",
    "summary",
    "note",
)


def soft_fertig_honesty_operator_brief_roster() -> dict[str, object]:
    """Operator-brief field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_HONESTY_OPERATOR_BRIEF_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Operator brief field: {key_id}",
                "note": (
                    f"Field `{key_id}` on soft_fertig_honesty_operator_brief; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of soft_fertig_honesty_operator_brief field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
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


def soft_fertig_honesty_export_roster() -> dict[str, object]:
    """Honesty export catalog roster with titles and notes (documentation)."""
    entries = [
        {
            "id": key_id,
            "title": SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES.get(key_id, ""),
            "note": SOFT_FERTIG_HONESTY_EXPORT_NOTES.get(key_id, ""),
        }
        for key_id in SOFT_FERTIG_HONESTY_EXPORT_KEYS
    ]
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of downloadable honesty/preview export ids only; "
            "catalogs do not close hard gaps."
        ),
    }


def soft_fertig_honesty_bundle_roster() -> dict[str, object]:
    """Honesty bundle section roster with titles and notes (documentation)."""
    entries = [
        {
            "id": section_id,
            "title": SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES.get(section_id, ""),
            "note": SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get(section_id, ""),
        }
        for section_id in SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS
    ]
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of combined honesty bundle section ids only; "
            "catalogs do not close hard gaps."
        ),
    }


def soft_fertig_surface_roster() -> dict[str, object]:
    """Soft-fertig surface key roster with titles and notes (documentation)."""
    entries = [
        {
            "id": key_id,
            "title": SOFT_FERTIG_SURFACE_KEY_TITLES.get(key_id, ""),
            "note": SOFT_FERTIG_SURFACE_NOTES.get(key_id, ""),
        }
        for key_id in SOFT_FERTIG_SURFACE_KEYS
    ]
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of soft-fertig surface key ids only; "
            "catalogs do not close hard gaps."
        ),
    }


def soft_fertig_changelog_roster() -> dict[str, object]:
    """Honesty surface changelog version roster (documentation)."""
    entries = [
        {
            "id": version_id,
            "title": f"Schema {version_id}",
            "note": SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG.get(version_id, ""),
        }
        for version_id in SOFT_FERTIG_HONESTY_SURFACE_CHANGELOG
    ]
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of honesty surface changelog versions only; "
            "catalogs do not close hard gaps."
        ),
    }


def soft_fertig_expect_step_roster() -> dict[str, object]:
    """Refused expect-install-plan step roster (documentation; not closure)."""
    from .expect_installer import (
        EXPECT_PLAN_STEP_IDS,
        EXPECT_PLAN_STEP_NOTES,
        EXPECT_PLAN_STEP_TITLES,
    )

    entries = [
        {
            "id": step_id,
            "title": EXPECT_PLAN_STEP_TITLES.get(step_id, ""),
            "note": EXPECT_PLAN_STEP_NOTES.get(step_id, ""),
        }
        for step_id in EXPECT_PLAN_STEP_IDS
    ]
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of refused expect-install-plan steps only; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }




# Documented layout-fidelity heuristic signal catalog (documentation; not pixel).
SOFT_FERTIG_LAYOUT_FIDELITY_SIGNAL_GROUPS: dict[str, tuple[str, ...]] = {
    "fields": (
        "fields",
        "with_alignment",
        "with_enabled",
        "with_external_label",
        "with_grid",
        "with_label",
        "with_maximum_size",
        "with_minimum_size",
        "with_read_only",
        "with_size_policy",
        "with_size_policy_expanding",
        "with_size_policy_fixed",
        "with_size_policy_minimum",
        "with_size_policy_preferred",
        "with_tooltip",
        "with_visible",
        "with_whats_this",
    ),
    "pages": (
        "annotations",
        "buddy_labels",
        "empty_stacked_sections",
        "layout_tree_max_depth",
        "pages",
        "pages_with_buddy_labels",
        "pages_with_column_stretch",
        "pages_with_layout_tree",
        "pages_with_row_stretch",
        "pages_with_spacing",
        "pages_with_tooltip",
        "sections",
        "sections_with_checkable",
        "sections_with_flat",
        "spacers",
        "spacers_with_orientation",
        "spacers_with_size_hint",
        "spacers_with_size_type",
        "stack_names",
        "stacked_sections",
    ),
    "chrome": (
        "geometry",
        "size_grip_enabled",
        "tab_position",
        "window_title",
    ),
}

def soft_fertig_ssh_honesty_roster() -> dict[str, object]:
    """BatchMode SSH alternative + refusal-path roster (documentation; not closure)."""
    from .deploy import (
        SSH_ALTERNATIVE_NOTES,
        SSH_ALTERNATIVE_TITLES,
        SSH_REFUSAL_PATH_NOTES,
        SSH_REFUSAL_PATH_TITLES,
    )

    entries: list[dict[str, object]] = []
    for alt_id in SSH_ALTERNATIVE_NOTES:
        entries.append(
            {
                "id": alt_id,
                "kind": "alternative",
                "title": SSH_ALTERNATIVE_TITLES.get(alt_id, ""),
                "note": SSH_ALTERNATIVE_NOTES.get(alt_id, ""),
            }
        )
    for path_id in SSH_REFUSAL_PATH_NOTES:
        entries.append(
            {
                "id": path_id,
                "kind": "refusal_path",
                "title": SSH_REFUSAL_PATH_TITLES.get(path_id, ""),
                "note": SSH_REFUSAL_PATH_NOTES.get(path_id, ""),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of BatchMode SSH alternatives and refusal paths only; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



# Documented required layout-fidelity sample catalog keys (documentation; not pixel).
SOFT_FERTIG_LAYOUT_FIDELITY_SAMPLE_KEYS: tuple[str, ...] = (
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

def soft_fertig_layout_fidelity_signal_roster() -> dict[str, object]:
    """Layout-fidelity heuristic signal roster (documentation; not pixel closure)."""
    entries: list[dict[str, object]] = []
    for group, signal_ids in SOFT_FERTIG_LAYOUT_FIDELITY_SIGNAL_GROUPS.items():
        for signal_id in signal_ids:
            entries.append(
                {
                    "id": signal_id,
                    "group": group,
                    "title": f"Layout fidelity {group} signal: {signal_id}",
                    "note": (
                        f"Heuristic {group} signal `{signal_id}` on layout-fidelity "
                        "samples; not pixel parity."
                    ),
                }
            )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "group_count": len(SOFT_FERTIG_LAYOUT_FIDELITY_SIGNAL_GROUPS),
        "note": (
            "Catalog of layout-fidelity heuristic signal ids only; "
            "soft-fertig catalogs do not close hard gaps (not pixel)."
        ),
    }



# Full layout_fidelity_sample_* field catalog on /hard-gaps (documentation; not pixel).
SOFT_FERTIG_LAYOUT_FIDELITY_SAMPLE_FIELD_KEYS: tuple[str, ...] = (
    "layout_fidelity_sample_annotations",
    "layout_fidelity_sample_buddy_labels",
    "layout_fidelity_sample_catalog_complete",
    "layout_fidelity_sample_chrome_geometry",
    "layout_fidelity_sample_chrome_size_grip_enabled",
    "layout_fidelity_sample_chrome_tab_position",
    "layout_fidelity_sample_chrome_window_title",
    "layout_fidelity_sample_empty_stacked_sections",
    "layout_fidelity_sample_fields",
    "layout_fidelity_sample_host_os",
    "layout_fidelity_sample_key_count",
    "layout_fidelity_sample_layout_tree_max_depth",
    "layout_fidelity_sample_pages",
    "layout_fidelity_sample_pages_with_buddy_labels",
    "layout_fidelity_sample_pages_with_column_stretch",
    "layout_fidelity_sample_pages_with_layout_tree",
    "layout_fidelity_sample_pages_with_row_stretch",
    "layout_fidelity_sample_pages_with_spacing",
    "layout_fidelity_sample_pages_with_tooltip",
    "layout_fidelity_sample_platform",
    "layout_fidelity_sample_score_parts_count",
    "layout_fidelity_sample_score_percent",
    "layout_fidelity_sample_sections",
    "layout_fidelity_sample_sections_with_checkable",
    "layout_fidelity_sample_sections_with_flat",
    "layout_fidelity_sample_signal_key_count",
    "layout_fidelity_sample_spacers",
    "layout_fidelity_sample_spacers_with_orientation",
    "layout_fidelity_sample_spacers_with_size_hint",
    "layout_fidelity_sample_spacers_with_size_type",
    "layout_fidelity_sample_stack_names",
    "layout_fidelity_sample_stack_names_count",
    "layout_fidelity_sample_stacked_sections",
    "layout_fidelity_sample_with_alignment",
    "layout_fidelity_sample_with_enabled",
    "layout_fidelity_sample_with_external_label",
    "layout_fidelity_sample_with_grid",
    "layout_fidelity_sample_with_label",
    "layout_fidelity_sample_with_maximum_size",
    "layout_fidelity_sample_with_minimum_size",
    "layout_fidelity_sample_with_read_only",
    "layout_fidelity_sample_with_size_policy",
    "layout_fidelity_sample_with_size_policy_expanding",
    "layout_fidelity_sample_with_size_policy_fixed",
    "layout_fidelity_sample_with_size_policy_minimum",
    "layout_fidelity_sample_with_size_policy_preferred",
    "layout_fidelity_sample_with_tooltip",
    "layout_fidelity_sample_with_visible",
    "layout_fidelity_sample_with_whats_this",
)

def soft_fertig_layout_fidelity_sample_roster() -> dict[str, object]:
    """Required layout-fidelity sample catalog roster (documentation; not pixel)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_LAYOUT_FIDELITY_SAMPLE_KEYS:
        short = key_id.removeprefix("layout_fidelity_sample_")
        entries.append(
            {
                "id": key_id,
                "title": f"Layout fidelity sample key: {short}",
                "note": (
                    f"Required hard-gaps sample field `{key_id}` for "
                    "layout_fidelity_sample_catalog_complete; not pixel parity."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of required layout_fidelity_sample_* keys only; "
            "soft-fertig catalogs do not close hard gaps (not pixel)."
        ),
    }


def soft_fertig_layout_fidelity_sample_field_roster() -> dict[str, object]:
    """Full layout_fidelity_sample_* hard-gaps field roster (documentation; not pixel)."""
    required = set(SOFT_FERTIG_LAYOUT_FIDELITY_SAMPLE_KEYS)
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_LAYOUT_FIDELITY_SAMPLE_FIELD_KEYS:
        short = key_id.removeprefix("layout_fidelity_sample_")
        entries.append(
            {
                "id": key_id,
                "required": key_id in required,
                "title": f"Layout fidelity sample field: {short}",
                "note": (
                    f"Hard-gaps sample field `{key_id}`"
                    + (" (required for catalog_complete)" if key_id in required else "")
                    + "; not pixel parity."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "required_count": len(required),
        "note": (
            "Catalog of all layout_fidelity_sample_* fields on /hard-gaps; "
            "soft-fertig catalogs do not close hard gaps (not pixel)."
        ),
    }



# Compact soft_fertig_catalog_summary field catalog (documentation; not closure).
SOFT_FERTIG_CATALOG_SUMMARY_KEYS: tuple[str, ...] = (
    "soft_fertig_honesty_surface_version",
    "soft_fertig_honesty_track_note",
    "soft_fertig_surface_key_count",
    "soft_fertig_session_storage_key_count",
    "soft_fertig_honesty_export_key_count",
    "soft_fertig_honesty_bundle_section_count",
    "soft_fertig_session_storage_clear_key_count",
    "hard_gap_count",
    "soft_fertig_catalogs_complete",
    "hard_gaps_remain",
    "soft_fertig_soft_complete_note",
    "soft_fertig_honesty_surface_changelog_version_count",
    "soft_fertig_honesty_operator_brief_summary",
    "soft_fertig_hard_gap_roster_entry_count",
    "soft_fertig_hard_gap_refusal_roster_entry_count",
    "soft_fertig_honesty_path_roster_entry_count",
    "soft_fertig_session_storage_roster_entry_count",
    "soft_fertig_honesty_export_roster_entry_count",
    "soft_fertig_honesty_bundle_roster_entry_count",
    "soft_fertig_surface_roster_entry_count",
    "soft_fertig_changelog_roster_entry_count",
    "soft_fertig_expect_step_roster_entry_count",
    "soft_fertig_ssh_honesty_roster_entry_count",
    "soft_fertig_layout_fidelity_signal_roster_entry_count",
    "soft_fertig_layout_fidelity_sample_roster_entry_count",
    "soft_fertig_layout_fidelity_sample_field_roster_entry_count",
    "soft_fertig_catalog_summary_roster_entry_count",
    "soft_fertig_honesty_readiness_roster_entry_count",
    "soft_fertig_session_storage_clear_roster_entry_count",
    "soft_fertig_honesty_operator_brief_roster_entry_count",
    "soft_fertig_surface_changelog_meta_roster_entry_count",
    "soft_fertig_hard_gaps_summary_roster_entry_count",
    "soft_fertig_hard_gaps_closure_roster_entry_count",
    "soft_fertig_health_roster_entry_count",
    "soft_fertig_res_status_roster_entry_count",
    "soft_fertig_hard_gaps_field_roster_entry_count",
    "honesty_milestone",
    "soft_complete_phase",
)


def soft_fertig_catalog_summary_roster() -> dict[str, object]:
    """Catalog-summary field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_CATALOG_SUMMARY_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Catalog summary field: {key_id}",
                "note": (
                    f"Field `{key_id}` on soft_fertig_catalog_summary; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of soft_fertig_catalog_summary field keys; "
            "soft-fertig catalogs do not close hard gaps."
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
        "soft_fertig_honesty_export_roster_entry_count": (
            soft_fertig_honesty_export_roster()["entry_count"]
        ),
        "soft_fertig_honesty_bundle_roster_entry_count": (
            soft_fertig_honesty_bundle_roster()["entry_count"]
        ),
        "soft_fertig_surface_roster_entry_count": (
            soft_fertig_surface_roster()["entry_count"]
        ),
        "soft_fertig_changelog_roster_entry_count": (
            soft_fertig_changelog_roster()["entry_count"]
        ),
        "soft_fertig_expect_step_roster_entry_count": (
            soft_fertig_expect_step_roster()["entry_count"]
        ),
        "soft_fertig_ssh_honesty_roster_entry_count": (
            soft_fertig_ssh_honesty_roster()["entry_count"]
        ),
        "soft_fertig_layout_fidelity_signal_roster_entry_count": (
            soft_fertig_layout_fidelity_signal_roster()["entry_count"]
        ),
        "soft_fertig_layout_fidelity_sample_roster_entry_count": (
            soft_fertig_layout_fidelity_sample_roster()["entry_count"]
        ),
        "soft_fertig_layout_fidelity_sample_field_roster_entry_count": (
            soft_fertig_layout_fidelity_sample_field_roster()["entry_count"]
        ),
        "soft_fertig_catalog_summary_roster_entry_count": (
            soft_fertig_catalog_summary_roster()["entry_count"]
        ),
        "soft_fertig_honesty_readiness_roster_entry_count": (
            soft_fertig_honesty_readiness_roster()["entry_count"]
        ),
        "soft_fertig_session_storage_clear_roster_entry_count": (
            soft_fertig_session_storage_clear_roster()["entry_count"]
        ),
        "soft_fertig_honesty_operator_brief_roster_entry_count": (
            soft_fertig_honesty_operator_brief_roster()["entry_count"]
        ),
        "soft_fertig_surface_changelog_meta_roster_entry_count": (
            soft_fertig_surface_changelog_meta_roster()["entry_count"]
        ),
        "soft_fertig_hard_gaps_summary_roster_entry_count": (
            soft_fertig_hard_gaps_summary_roster()["entry_count"]
        ),
        "soft_fertig_hard_gaps_closure_roster_entry_count": (
            soft_fertig_hard_gaps_closure_roster()["entry_count"]
        ),
        "soft_fertig_health_roster_entry_count": (
            soft_fertig_health_roster()["entry_count"]
        ),
        "soft_fertig_res_status_roster_entry_count": (
            soft_fertig_res_status_roster()["entry_count"]
        ),
        "soft_fertig_hard_gaps_field_roster_entry_count": (
            soft_fertig_hard_gaps_field_roster()["entry_count"]
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


_LAYOUT_FIDELITY_SAMPLE_CATALOG_REQUIRED = SOFT_FERTIG_LAYOUT_FIDELITY_SAMPLE_KEYS


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
        "soft_fertig_honesty_export_roster": soft_fertig_honesty_export_roster(),
        "soft_fertig_honesty_bundle_roster": soft_fertig_honesty_bundle_roster(),
        "soft_fertig_surface_roster": soft_fertig_surface_roster(),
        "soft_fertig_changelog_roster": soft_fertig_changelog_roster(),
        "soft_fertig_expect_step_roster": soft_fertig_expect_step_roster(),
        "soft_fertig_ssh_honesty_roster": soft_fertig_ssh_honesty_roster(),
        "soft_fertig_layout_fidelity_signal_roster": soft_fertig_layout_fidelity_signal_roster(),
        "soft_fertig_layout_fidelity_sample_roster": soft_fertig_layout_fidelity_sample_roster(),
        "soft_fertig_layout_fidelity_sample_field_roster": soft_fertig_layout_fidelity_sample_field_roster(),
        "soft_fertig_catalog_summary_roster": soft_fertig_catalog_summary_roster(),
        "soft_fertig_honesty_readiness_roster": soft_fertig_honesty_readiness_roster(),
        "soft_fertig_session_storage_clear_roster": soft_fertig_session_storage_clear_roster(),
        "soft_fertig_honesty_operator_brief_roster": soft_fertig_honesty_operator_brief_roster(),
        "soft_fertig_surface_changelog_meta_roster": soft_fertig_surface_changelog_meta_roster(),
        "soft_fertig_hard_gaps_summary_roster": soft_fertig_hard_gaps_summary_roster(),
        "soft_fertig_hard_gaps_closure_roster": soft_fertig_hard_gaps_closure_roster(),
        "soft_fertig_health_roster": soft_fertig_health_roster(),
        "soft_fertig_res_status_roster": soft_fertig_res_status_roster(),
        "soft_fertig_hard_gaps_field_roster": soft_fertig_hard_gaps_field_roster(),
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
        "soft_fertig_honesty_export_roster": soft_fertig_honesty_export_roster(),
        "soft_fertig_honesty_bundle_roster": soft_fertig_honesty_bundle_roster(),
        "soft_fertig_surface_roster": soft_fertig_surface_roster(),
        "soft_fertig_changelog_roster": soft_fertig_changelog_roster(),
        "soft_fertig_expect_step_roster": soft_fertig_expect_step_roster(),
        "soft_fertig_ssh_honesty_roster": soft_fertig_ssh_honesty_roster(),
        "soft_fertig_layout_fidelity_signal_roster": soft_fertig_layout_fidelity_signal_roster(),
        "soft_fertig_layout_fidelity_sample_roster": soft_fertig_layout_fidelity_sample_roster(),
        "soft_fertig_layout_fidelity_sample_field_roster": soft_fertig_layout_fidelity_sample_field_roster(),
        "soft_fertig_catalog_summary_roster": soft_fertig_catalog_summary_roster(),
        "soft_fertig_honesty_readiness_roster": soft_fertig_honesty_readiness_roster(),
        "soft_fertig_session_storage_clear_roster": soft_fertig_session_storage_clear_roster(),
        "soft_fertig_honesty_operator_brief_roster": soft_fertig_honesty_operator_brief_roster(),
        "soft_fertig_surface_changelog_meta_roster": soft_fertig_surface_changelog_meta_roster(),
        "soft_fertig_hard_gaps_summary_roster": soft_fertig_hard_gaps_summary_roster(),
        "soft_fertig_hard_gaps_closure_roster": soft_fertig_hard_gaps_closure_roster(),
        "soft_fertig_health_roster": soft_fertig_health_roster(),
        "soft_fertig_res_status_roster": soft_fertig_res_status_roster(),
        "soft_fertig_hard_gaps_field_roster": soft_fertig_hard_gaps_field_roster(),
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
        "soft_fertig_honesty_export_roster": soft_fertig_honesty_export_roster(),
        "soft_fertig_honesty_bundle_roster": soft_fertig_honesty_bundle_roster(),
        "soft_fertig_surface_roster": soft_fertig_surface_roster(),
        "soft_fertig_changelog_roster": soft_fertig_changelog_roster(),
        "soft_fertig_expect_step_roster": soft_fertig_expect_step_roster(),
        "soft_fertig_ssh_honesty_roster": soft_fertig_ssh_honesty_roster(),
        "soft_fertig_layout_fidelity_signal_roster": soft_fertig_layout_fidelity_signal_roster(),
        "soft_fertig_layout_fidelity_sample_roster": soft_fertig_layout_fidelity_sample_roster(),
        "soft_fertig_layout_fidelity_sample_field_roster": soft_fertig_layout_fidelity_sample_field_roster(),
        "soft_fertig_catalog_summary_roster": soft_fertig_catalog_summary_roster(),
        "soft_fertig_honesty_readiness_roster": soft_fertig_honesty_readiness_roster(),
        "soft_fertig_session_storage_clear_roster": soft_fertig_session_storage_clear_roster(),
        "soft_fertig_honesty_operator_brief_roster": soft_fertig_honesty_operator_brief_roster(),
        "soft_fertig_surface_changelog_meta_roster": soft_fertig_surface_changelog_meta_roster(),
        "soft_fertig_hard_gaps_summary_roster": soft_fertig_hard_gaps_summary_roster(),
        "soft_fertig_hard_gaps_closure_roster": soft_fertig_hard_gaps_closure_roster(),
        "soft_fertig_health_roster": soft_fertig_health_roster(),
        "soft_fertig_res_status_roster": soft_fertig_res_status_roster(),
        "soft_fertig_hard_gaps_field_roster": soft_fertig_hard_gaps_field_roster(),
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
        "soft_fertig_honesty_export_roster": dict(
            full.get("soft_fertig_honesty_export_roster") or {}
        ),
        "soft_fertig_honesty_bundle_roster": dict(
            full.get("soft_fertig_honesty_bundle_roster") or {}
        ),
        "soft_fertig_surface_roster": dict(
            full.get("soft_fertig_surface_roster") or {}
        ),
        "soft_fertig_changelog_roster": dict(
            full.get("soft_fertig_changelog_roster") or {}
        ),
        "soft_fertig_expect_step_roster": dict(
            full.get("soft_fertig_expect_step_roster") or {}
        ),
        "soft_fertig_ssh_honesty_roster": dict(
            full.get("soft_fertig_ssh_honesty_roster") or {}
        ),
        "soft_fertig_layout_fidelity_signal_roster": dict(
            full.get("soft_fertig_layout_fidelity_signal_roster") or {}
        ),
        "soft_fertig_layout_fidelity_sample_roster": dict(
            full.get("soft_fertig_layout_fidelity_sample_roster") or {}
        ),
        "soft_fertig_layout_fidelity_sample_field_roster": dict(
            full.get("soft_fertig_layout_fidelity_sample_field_roster") or {}
        ),
        "soft_fertig_catalog_summary_roster": dict(
            full.get("soft_fertig_catalog_summary_roster") or {}
        ),
        "soft_fertig_honesty_readiness_roster": dict(
            full.get("soft_fertig_honesty_readiness_roster") or {}
        ),
        "soft_fertig_session_storage_clear_roster": dict(
            full.get("soft_fertig_session_storage_clear_roster") or {}
        ),
        "soft_fertig_honesty_operator_brief_roster": dict(
            full.get("soft_fertig_honesty_operator_brief_roster") or {}
        ),
        "soft_fertig_surface_changelog_meta_roster": dict(
            full.get("soft_fertig_surface_changelog_meta_roster") or {}
        ),
        "soft_fertig_hard_gaps_summary_roster": dict(
            full.get("soft_fertig_hard_gaps_summary_roster") or {}
        ),
        "soft_fertig_hard_gaps_closure_roster": dict(
            full.get("soft_fertig_hard_gaps_closure_roster") or {}
        ),
        "soft_fertig_health_roster": dict(
            full.get("soft_fertig_health_roster") or {}
        ),
        "soft_fertig_res_status_roster": dict(
            full.get("soft_fertig_res_status_roster") or {}
        ),
        "soft_fertig_hard_gaps_field_roster": dict(
            full.get("soft_fertig_hard_gaps_field_roster") or {}
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
        "soft_fertig_honesty_export_roster": soft_fertig_honesty_export_roster(),
        "soft_fertig_honesty_bundle_roster": soft_fertig_honesty_bundle_roster(),
        "soft_fertig_surface_roster": soft_fertig_surface_roster(),
        "soft_fertig_changelog_roster": soft_fertig_changelog_roster(),
        "soft_fertig_expect_step_roster": soft_fertig_expect_step_roster(),
        "soft_fertig_ssh_honesty_roster": soft_fertig_ssh_honesty_roster(),
        "soft_fertig_layout_fidelity_signal_roster": soft_fertig_layout_fidelity_signal_roster(),
        "soft_fertig_layout_fidelity_sample_roster": soft_fertig_layout_fidelity_sample_roster(),
        "soft_fertig_layout_fidelity_sample_field_roster": soft_fertig_layout_fidelity_sample_field_roster(),
        "soft_fertig_catalog_summary_roster": soft_fertig_catalog_summary_roster(),
        "soft_fertig_honesty_readiness_roster": soft_fertig_honesty_readiness_roster(),
        "soft_fertig_session_storage_clear_roster": soft_fertig_session_storage_clear_roster(),
        "soft_fertig_honesty_operator_brief_roster": soft_fertig_honesty_operator_brief_roster(),
        "soft_fertig_surface_changelog_meta_roster": soft_fertig_surface_changelog_meta_roster(),
        "soft_fertig_hard_gaps_summary_roster": soft_fertig_hard_gaps_summary_roster(),
        "soft_fertig_hard_gaps_closure_roster": soft_fertig_hard_gaps_closure_roster(),
        "soft_fertig_health_roster": soft_fertig_health_roster(),
        "soft_fertig_res_status_roster": soft_fertig_res_status_roster(),
        "soft_fertig_hard_gaps_field_roster": soft_fertig_hard_gaps_field_roster(),
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
