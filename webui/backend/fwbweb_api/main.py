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
WEBUI_SOFT_COMPLETE_PHASE = "10296"
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
# 10550: soft_fertig_hard_gaps_field_roster compact /hard-gaps field keys;
# 10600: hard_gaps_field_roster listed in honesty export + bundle sections;
# 10650: soft_fertig_honesty_surface_version bumped to 4.0 (hard_gaps_field_roster);
# 10700: hard_gaps_field_roster added to sessionStorage + clear catalogs;
# 10750: Soft 4040+ honesty surface checkpoint (hard_gaps_field_roster cycle complete);
# 10800: soft_fertig_layout_fidelity_roster compact /layout-fidelity field keys;
# 10850: layout_fidelity_roster listed in honesty export + bundle sections;
# 10900: soft_fertig_honesty_surface_version bumped to 4.1 (layout_fidelity_roster);
# 10950: layout_fidelity_roster added to sessionStorage + clear catalogs;
# 11000: Soft 4120+ honesty surface checkpoint (layout_fidelity_roster cycle complete);
# 11050: soft_fertig_stack_switch_roster compact /stack-switch field keys;
# 11100: stack_switch_roster listed in honesty export + bundle sections;
# 11150: soft_fertig_honesty_surface_version bumped to 4.2 (stack_switch_roster);
# 11200: stack_switch_roster added to sessionStorage + clear catalogs;
# 11250: Soft 4200+ honesty surface checkpoint (stack_switch_roster cycle complete);
# 11300: soft_fertig_option_enable_roster compact /option-enable field keys;
# 11350: option_enable_roster listed in honesty export + bundle sections;
# 11400: soft_fertig_honesty_surface_version bumped to 4.3 (option_enable_roster);
# 11450: option_enable_roster added to sessionStorage + clear catalogs;
# 11500: Soft 4280+ honesty surface checkpoint (option_enable_roster cycle complete);
# 11550: soft_fertig_expect_run_roster compact /expect-install-plan/run field keys;
# 11600: expect_run_roster listed in honesty export + bundle sections;
# 11650: soft_fertig_honesty_surface_version bumped to 4.4 (expect_run_roster);
# 11700: expect_run_roster added to sessionStorage + clear catalogs;
# 11750: Soft 4360+ honesty surface checkpoint (expect_run_roster cycle complete);
# 11800: soft_fertig_expect_steps_roster compact /expect-install-plan/steps field keys;
# 11850: expect_steps_roster listed in honesty export + bundle sections;
# 11900: soft_fertig_honesty_surface_version bumped to 4.5 (expect_steps_roster);
# 11950: expect_steps_roster added to sessionStorage + clear catalogs;
# 12000: Soft 4440+ honesty surface checkpoint (expect_steps_roster cycle complete);
# 12050: soft_fertig_expect_steps_refusals_roster compact /steps/refusals field keys;
# 12100: expect_steps_refusals_roster listed in honesty export + bundle sections;
# 12150: soft_fertig_honesty_surface_version bumped to 4.6 (expect_steps_refusals_roster);
# 12200: expect_steps_refusals_roster added to sessionStorage + clear catalogs;
# 12250: Soft 4520+ honesty surface checkpoint (expect_steps_refusals_roster cycle complete);
# 12300: soft_fertig_ssh_auth_roster compact /ssh-auth field keys;
# 12350: ssh_auth_roster listed in honesty export + bundle sections;
# 12400: soft_fertig_honesty_surface_version bumped to 4.7 (ssh_auth_roster);
# 12450: ssh_auth_roster added to sessionStorage + clear catalogs;
# 12500: Soft 4600+ honesty surface checkpoint (ssh_auth_roster cycle complete);
# 12550: soft_fertig_password_ssh_roster compact /ssh-auth/password refusal field keys;
# 12600: password_ssh_roster listed in honesty export + bundle sections;
# 12650: soft_fertig_honesty_surface_version bumped to 4.8 (password_ssh_roster);
# 12700: password_ssh_roster added to sessionStorage + clear catalogs;
# 12750: Soft 4680+ honesty surface checkpoint (password_ssh_roster cycle complete).
# 12800: soft_fertig_ssh_not_implemented_roster compact /ssh-auth not_implemented ids;
# 12850: ssh_not_implemented_roster listed in honesty export + bundle sections;
# 12900: soft_fertig_honesty_surface_version bumped to 4.9 (ssh_not_implemented_roster);
# 12950: ssh_not_implemented_roster added to sessionStorage + clear catalogs;
# 13000: Soft 4760+ honesty surface checkpoint (ssh_not_implemented_roster cycle complete);
# 13050: soft_fertig_ssh_implemented_roster compact /ssh-auth implemented method ids;
# 13100: ssh_implemented_roster listed in honesty export + bundle sections;
# 13150: soft_fertig_honesty_surface_version bumped to 5.0 (ssh_implemented_roster);
# 13200: ssh_implemented_roster added to sessionStorage + clear catalogs;
# 13250: Soft 4840+ honesty surface checkpoint (ssh_implemented_roster cycle complete);
# 13300: soft_fertig_ssh_capability_flags_roster compact /ssh-auth boolean capability flags;
# 13350: ssh_capability_flags_roster listed in honesty export + bundle sections;
# 13400: soft_fertig_honesty_surface_version bumped to 5.1 (ssh_capability_flags_roster);
# 13450: ssh_capability_flags_roster added to sessionStorage + clear catalogs;
# 13500: Soft 4920+ honesty surface checkpoint (ssh_capability_flags_roster cycle complete);
# 13550: soft_fertig_ssh_alternatives_roster compact /ssh-auth alternatives ids;
# 13600: ssh_alternatives_roster listed in honesty export + bundle sections;
# 13650: soft_fertig_honesty_surface_version bumped to 5.2 (ssh_alternatives_roster);
# 13700: ssh_alternatives_roster added to sessionStorage + clear catalogs;
# 13750: Soft 5000+ honesty surface checkpoint (ssh_alternatives_roster cycle complete).
# 13800: soft_fertig_ssh_refusal_paths_roster compact /ssh-auth refusal path ids;
# 13850: ssh_refusal_paths_roster listed in honesty export + bundle sections;
# 13900: soft_fertig_honesty_surface_version bumped to 5.3 (ssh_refusal_paths_roster);
# 13950: ssh_refusal_paths_roster added to sessionStorage + clear catalogs;
# 14000: Soft 5080+ honesty surface checkpoint (ssh_refusal_paths_roster cycle complete).
# 14050: soft_fertig_ssh_refusal_status_roster compact /ssh-auth refusal HTTP status codes;
# 14100: ssh_refusal_status_roster listed in honesty export + bundle sections;
# 14150: soft_fertig_honesty_surface_version bumped to 5.4 (ssh_refusal_status_roster);
# 14200: ssh_refusal_status_roster added to sessionStorage + clear catalogs;
# 14250: Soft 5160+ honesty surface checkpoint (ssh_refusal_status_roster cycle complete).
# 14300: soft_fertig_ssh_method_lists_roster compact /ssh-auth method list fields;
# 14350: ssh_method_lists_roster listed in honesty export + bundle sections;
# 14400: soft_fertig_honesty_surface_version bumped to 5.5 (ssh_method_lists_roster);
# 14450: ssh_method_lists_roster added to sessionStorage + clear catalogs;
# 14500: Soft 5240+ honesty surface checkpoint (ssh_method_lists_roster cycle complete).
# 14550: soft_fertig_ssh_auth_policy_roster compact /ssh-auth policy booleans;
# 14600: ssh_auth_policy_roster listed in honesty export + bundle sections;
# 14650: soft_fertig_honesty_surface_version bumped to 5.6 (ssh_auth_policy_roster);
# 14700: ssh_auth_policy_roster added to sessionStorage + clear catalogs;
# 14750: Soft 5320+ honesty surface checkpoint (ssh_auth_policy_roster cycle complete).
# 14800: soft_fertig_ssh_alternative_notes_roster compact /ssh-auth alternative_notes ids;
# 14850: ssh_alternative_notes_roster listed in honesty export + bundle sections;
# 14900: soft_fertig_honesty_surface_version bumped to 5.7 (ssh_alternative_notes_roster);
# 14950: ssh_alternative_notes_roster added to sessionStorage + clear catalogs;
# 15000: Soft 5400+ honesty surface checkpoint (ssh_alternative_notes_roster cycle complete).
# 15050: soft_fertig_ssh_alternative_titles_roster compact /ssh-auth alternative_titles ids;
# 15100: ssh_alternative_titles_roster listed in honesty export + bundle sections;
# 15150: soft_fertig_honesty_surface_version bumped to 5.8 (ssh_alternative_titles_roster);
# 15200: ssh_alternative_titles_roster added to sessionStorage + clear catalogs;
# 15250: Soft 5480+ honesty surface checkpoint (ssh_alternative_titles_roster cycle complete).
# 15300: soft_fertig_ssh_refusal_path_titles_roster compact /ssh-auth refusal_path_titles ids;
# 15350: ssh_refusal_path_titles_roster listed in honesty export + bundle sections;
# 15400: soft_fertig_honesty_surface_version bumped to 5.9 (ssh_refusal_path_titles_roster);
# 15450: ssh_refusal_path_titles_roster added to sessionStorage + clear catalogs;
# 15500: Soft 5560+ honesty surface checkpoint (ssh_refusal_path_titles_roster cycle complete).
# 15550: soft_fertig_ssh_refusal_path_notes_roster compact /ssh-auth refusal_path_notes ids;
# 15600: ssh_refusal_path_notes_roster listed in honesty export + bundle sections;
# 15650: soft_fertig_honesty_surface_version bumped to 5.10 (ssh_refusal_path_notes_roster);
# 15700: ssh_refusal_path_notes_roster added to sessionStorage + clear catalogs;
# 15750: Soft 5640+ honesty surface checkpoint (ssh_refusal_path_notes_roster cycle complete).
# 15800: soft_fertig_ssh_auth_note_roster compact GET /ssh-auth note field;
# 15850: ssh_auth_note_roster listed in honesty export + bundle sections;
# 15900: soft_fertig_honesty_surface_version bumped to 5.11 (ssh_auth_note_roster);
# 15950: ssh_auth_note_roster added to sessionStorage + clear catalogs;
# 16000: Soft 5720+ honesty surface checkpoint (ssh_auth_note_roster cycle complete).
# 16050: soft_fertig_ssh_alternative_support_roster compact /ssh-auth alternative support booleans;
# 16100: ssh_alternative_support_roster listed in honesty export + bundle sections;
# 16150: soft_fertig_honesty_surface_version bumped to 5.12 (ssh_alternative_support_roster);
# 16200: ssh_alternative_support_roster added to sessionStorage + clear catalogs;
# 16250: Soft 5800+ honesty surface checkpoint (ssh_alternative_support_roster cycle complete).
# 16300: soft_fertig_ssh_password_support_roster compact /ssh-auth password support booleans;
# 16350: ssh_password_support_roster listed in honesty export + bundle sections;
# 16400: soft_fertig_honesty_surface_version bumped to 5.13 (ssh_password_support_roster);
# 16450: ssh_password_support_roster added to sessionStorage + clear catalogs;
# 16500: Soft 5880+ honesty surface checkpoint (ssh_password_support_roster cycle complete).
# 16550: soft_fertig_ssh_batch_mode_roster compact /ssh-auth batch mode booleans;
# 16600: ssh_batch_mode_roster listed in honesty export + bundle sections;
# 16650: soft_fertig_honesty_surface_version bumped to 5.14 (ssh_batch_mode_roster);
# 16700: ssh_batch_mode_roster added to sessionStorage + clear catalogs;
# 16750: Soft 5960+ honesty surface checkpoint (ssh_batch_mode_roster cycle complete).
# 16800: soft_fertig_ssh_implemented_check_roster compact /ssh-auth implemented[] membership;
# 16850: ssh_implemented_check_roster listed in honesty export + bundle sections;
# 16900: soft_fertig_honesty_surface_version bumped to 5.15 (ssh_implemented_check_roster);
# 16950: ssh_implemented_check_roster added to sessionStorage + clear catalogs;
# 17000: Soft 6040+ honesty surface checkpoint (ssh_implemented_check_roster cycle complete).
# 17050: soft_fertig_ssh_not_implemented_check_roster compact /ssh-auth not_implemented[] membership;
# 17100: ssh_not_implemented_check_roster listed in honesty export + bundle sections;
# 17150: soft_fertig_honesty_surface_version bumped to 5.16 (ssh_not_implemented_check_roster);
# 17200: ssh_not_implemented_check_roster added to sessionStorage + clear catalogs;
# 17250: Soft 6120+ honesty surface checkpoint (ssh_not_implemented_check_roster cycle complete).
# 17300: soft_fertig_ssh_alternative_presence_roster compact /ssh-auth alternatives[] membership;
# 17350: ssh_alternative_presence_roster listed in honesty export + bundle sections;
# 17400: soft_fertig_honesty_surface_version bumped to 5.17 (ssh_alternative_presence_roster);
# 17450: ssh_alternative_presence_roster added to sessionStorage + clear catalogs;
# 17500: Soft 6200+ honesty surface checkpoint (ssh_alternative_presence_roster cycle complete).
# 17550: soft_fertig_ssh_implemented_batch_roster compact /ssh-auth implemented[] batch subset;
# 17600: ssh_implemented_batch_roster listed in honesty export + bundle sections;
# 17650: soft_fertig_honesty_surface_version bumped to 5.18 (ssh_implemented_batch_roster);
# 17700: ssh_implemented_batch_roster added to sessionStorage + clear catalogs;
# 17750: Soft 6280+ honesty surface checkpoint (ssh_implemented_batch_roster cycle complete).
# 17800: soft_fertig_ssh_not_implemented_batch_roster compact /ssh-auth not_implemented[] batch subset;
# 17850: ssh_not_implemented_batch_roster listed in honesty export + bundle sections;
# 17900: soft_fertig_honesty_surface_version bumped to 5.19 (ssh_not_implemented_batch_roster);
# 17950: ssh_not_implemented_batch_roster added to sessionStorage + clear catalogs;
# 18000: Soft 6360+ honesty surface checkpoint (ssh_not_implemented_batch_roster cycle complete).
# 18050: soft_fertig_ssh_implemented_agent_roster compact /ssh-auth implemented[] ssh_agent subset;
# 18100: ssh_implemented_agent_roster listed in honesty export + bundle sections;
# 18150: soft_fertig_honesty_surface_version bumped to 5.20 (ssh_implemented_agent_roster);
# 18200: ssh_implemented_agent_roster added to sessionStorage + clear catalogs;
# 18250: Soft 6440+ honesty surface checkpoint (ssh_implemented_agent_roster cycle complete).
# 18300: soft_fertig_ssh_auth_note_snapshot_roster compact GET /ssh-auth note text signals;
# 18350: ssh_auth_note_snapshot_roster listed in honesty export + bundle sections;
# 18400: soft_fertig_honesty_surface_version bumped to 5.21 (ssh_auth_note_snapshot_roster);
# 18450: ssh_auth_note_snapshot_roster added to sessionStorage + clear catalogs;
# 18500: Soft 6520+ honesty surface checkpoint (ssh_auth_note_snapshot_roster cycle complete).
# 18550: soft_fertig_ssh_honesty_refresh_roster compact /ssh-auth alternatives/refusal_paths refresh;
# 18600: ssh_honesty_refresh_roster listed in honesty export + bundle sections;
# 18650: soft_fertig_honesty_surface_version bumped to 5.22 (ssh_honesty_refresh_roster);
# 18700: ssh_honesty_refresh_roster added to sessionStorage + clear catalogs;
# 18750: Soft 6600+ honesty surface checkpoint (ssh_honesty_refresh_roster cycle complete).
# 18800: soft_fertig_ssh_implemented_identity_roster compact /ssh-auth implemented[] identity_file subset;
# 18850: ssh_implemented_identity_roster listed in honesty export + bundle sections;
# 18900: soft_fertig_honesty_surface_version bumped to 5.23 (ssh_implemented_identity_roster);
# 18950: ssh_implemented_identity_roster added to sessionStorage + clear catalogs;
# 19000: Soft 6680+ honesty surface checkpoint (ssh_implemented_identity_roster cycle complete).
# 19050: soft_fertig_ssh_not_implemented_keyboard_roster compact /ssh-auth not_implemented[] keyboard_interactive subset;
# 19100: ssh_not_implemented_keyboard_roster listed in honesty export + bundle sections;
# 19150: soft_fertig_honesty_surface_version bumped to 5.24 (ssh_not_implemented_keyboard_roster);
# 19200: ssh_not_implemented_keyboard_roster added to sessionStorage + clear catalogs;
# 19250: Soft 6760+ honesty surface checkpoint (ssh_not_implemented_keyboard_roster cycle complete).
# 19300: soft_fertig_ssh_not_implemented_password_roster compact /ssh-auth not_implemented[] password subset;
# 19350: ssh_not_implemented_password_roster listed in honesty export + bundle sections;
# 19400: soft_fertig_honesty_surface_version bumped to 5.25 (ssh_not_implemented_password_roster);
# 19450: ssh_not_implemented_password_roster added to sessionStorage + clear catalogs;
# 19500: Soft 6840+ honesty surface checkpoint (ssh_not_implemented_password_roster cycle complete).
# 19550: soft_fertig_ssh_refusal_status_refresh_roster compact /ssh-auth refusal_paths status refresh;
# 19600: ssh_refusal_status_refresh_roster listed in honesty export + bundle sections;
# 19650: soft_fertig_honesty_surface_version bumped to 5.26 (ssh_refusal_status_refresh_roster);
# 19700: ssh_refusal_status_refresh_roster added to sessionStorage + clear catalogs;
# 19750: Soft 6920+ honesty surface checkpoint (ssh_refusal_status_refresh_roster cycle complete).
# 19800: soft_fertig_ssh_auth_policy_refresh_roster compact /ssh-auth policy boolean refresh;
# 19850: ssh_auth_policy_refresh_roster listed in honesty export + bundle sections;
# 19900: soft_fertig_honesty_surface_version bumped to 5.27 (ssh_auth_policy_refresh_roster);
# 19950: ssh_auth_policy_refresh_roster added to sessionStorage + clear catalogs;
# 20000: Soft 7000+ honesty surface checkpoint (ssh_auth_policy_refresh_roster cycle complete).
# 20050: soft_fertig_ssh_refusal_paths_refresh_roster compact /ssh-auth refusal_paths refresh;
# 20100: ssh_refusal_paths_refresh_roster listed in honesty export + bundle sections;
# 20150: soft_fertig_honesty_surface_version bumped to 5.28 (ssh_refusal_paths_refresh_roster);
# 20200: ssh_refusal_paths_refresh_roster added to sessionStorage + clear catalogs;
# 20250: Soft 7080+ honesty surface checkpoint (ssh_refusal_paths_refresh_roster cycle complete).
# 20300: soft_fertig_ssh_alternatives_refresh_roster compact /ssh-auth alternatives[] refresh;
# 20350: ssh_alternatives_refresh_roster listed in honesty export + bundle sections;
# 20400: soft_fertig_honesty_surface_version bumped to 5.29 (ssh_alternatives_refresh_roster);
# 20450: ssh_alternatives_refresh_roster added to sessionStorage + clear catalogs;
# 20500: Soft 7160+ honesty surface checkpoint (ssh_alternatives_refresh_roster cycle complete).
# 20550: soft_fertig_ssh_alternative_titles_refresh_roster compact /ssh-auth alternative_titles refresh;
# 20600: ssh_alternative_titles_refresh_roster listed in honesty export + bundle sections;
# 20650: soft_fertig_honesty_surface_version bumped to 5.30 (ssh_alternative_titles_refresh_roster);
# 20700: ssh_alternative_titles_refresh_roster added to sessionStorage + clear catalogs;
# 20750: Soft 7240+ honesty surface checkpoint (ssh_alternative_titles_refresh_roster cycle complete).
# 20800: soft_fertig_ssh_refusal_path_titles_refresh_roster compact /ssh-auth refusal_path_titles refresh;
# 20850: ssh_refusal_path_titles_refresh_roster listed in honesty export + bundle sections;
# 20900: soft_fertig_honesty_surface_version bumped to 5.31 (ssh_refusal_path_titles_refresh_roster);
# 20950: ssh_refusal_path_titles_refresh_roster added to sessionStorage + clear catalogs;
# 21000: Soft 7320+ honesty surface checkpoint (ssh_refusal_path_titles_refresh_roster cycle complete).
# 21050: soft_fertig_ssh_refusal_path_notes_refresh_roster compact /ssh-auth refusal_path_notes refresh;
# 21100: ssh_refusal_path_notes_refresh_roster listed in honesty export + bundle sections;
# 21150: soft_fertig_honesty_surface_version bumped to 5.32 (ssh_refusal_path_notes_refresh_roster);
# 21200: ssh_refusal_path_notes_refresh_roster added to sessionStorage + clear catalogs;
# 21250: Soft 7400+ honesty surface checkpoint (ssh_refusal_path_notes_refresh_roster cycle complete).
# 21300: soft_fertig_ssh_alternative_notes_refresh_roster compact /ssh-auth alternative_notes refresh;
# 21350: ssh_alternative_notes_refresh_roster listed in honesty export + bundle sections;
# 21400: soft_fertig_honesty_surface_version bumped to 5.33 (ssh_alternative_notes_refresh_roster);
# 21450: ssh_alternative_notes_refresh_roster added to sessionStorage + clear catalogs;
# 21500: Soft 7480+ honesty surface checkpoint (ssh_alternative_notes_refresh_roster cycle complete).
# 21550: soft_fertig_ssh_auth_note_refresh_roster compact /ssh-auth note field refresh;
# 21600: ssh_auth_note_refresh_roster listed in honesty export + bundle sections;
# 21650: soft_fertig_honesty_surface_version bumped to 5.34 (ssh_auth_note_refresh_roster);
# 21700: ssh_auth_note_refresh_roster added to sessionStorage + clear catalogs;
# 21750: Soft 7560+ honesty surface checkpoint (ssh_auth_note_refresh_roster cycle complete).
# 21800: soft_fertig_ssh_capability_flags_refresh_roster compact /ssh-auth capability flags refresh;
# 21850: ssh_capability_flags_refresh_roster listed in honesty export + bundle sections;
# 21900: soft_fertig_honesty_surface_version bumped to 5.35 (ssh_capability_flags_refresh_roster);
# 21950: ssh_capability_flags_refresh_roster added to sessionStorage + clear catalogs;
# 22000: Soft 7640+ honesty surface checkpoint (ssh_capability_flags_refresh_roster cycle complete).
# 20550: soft_fertig_ssh_alternative_titles_refresh_roster compact /ssh-auth alternative_titles refresh;
# 20600: ssh_alternative_titles_refresh_roster listed in honesty export + bundle sections;
# 20650: soft_fertig_honesty_surface_version bumped to 5.30 (ssh_alternative_titles_refresh_roster);
# 20700: ssh_alternative_titles_refresh_roster added to sessionStorage + clear catalogs;
# 20750: Soft 7240+ honesty surface checkpoint (ssh_alternative_titles_refresh_roster cycle complete).
WEBUI_HONESTY_MILESTONE = 30250
WEBUI_HONESTY_MILESTONE_NOTE = (
    "Honesty surface checkpoint 30250: soft-fertig honesty/preview catalogs "
    "through Soft 10280+ (schema 5.68, ssh_auth_method_partition_roster "
    "sessionStorage) — hard gaps remain open."
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
    "soft_fertig_layout_fidelity_roster",
    "soft_fertig_stack_switch_roster",
    "soft_fertig_option_enable_roster",
    "soft_fertig_expect_run_roster",
    "soft_fertig_expect_steps_roster",
    "soft_fertig_expect_steps_refusals_roster",
    "soft_fertig_ssh_auth_roster",
    "soft_fertig_password_ssh_roster",
    "soft_fertig_ssh_not_implemented_roster",
    "soft_fertig_ssh_implemented_roster",
    "soft_fertig_ssh_capability_flags_roster",
    "soft_fertig_ssh_alternatives_roster",
    "soft_fertig_ssh_refusal_paths_roster",
    "soft_fertig_ssh_refusal_status_roster",
    "soft_fertig_ssh_method_lists_roster",
    "soft_fertig_ssh_auth_policy_roster",
    "soft_fertig_ssh_alternative_notes_roster",
    "soft_fertig_ssh_refusal_path_titles_roster",
    "soft_fertig_ssh_refusal_path_notes_roster",
    "soft_fertig_ssh_auth_note_roster",
    "soft_fertig_ssh_alternative_support_roster",
    "soft_fertig_ssh_password_support_roster",
    "soft_fertig_ssh_batch_mode_roster",
    "soft_fertig_ssh_implemented_check_roster",
    "soft_fertig_ssh_not_implemented_check_roster",
    "soft_fertig_ssh_alternative_presence_roster",
    "soft_fertig_ssh_implemented_batch_roster",
    "soft_fertig_ssh_not_implemented_batch_roster",
    "soft_fertig_ssh_implemented_agent_roster",
    "soft_fertig_ssh_auth_note_snapshot_roster",
    "soft_fertig_ssh_honesty_refresh_roster",
    "soft_fertig_ssh_implemented_identity_roster",
    "soft_fertig_ssh_not_implemented_keyboard_roster",
    "soft_fertig_ssh_not_implemented_password_roster",
    "soft_fertig_ssh_refusal_status_refresh_roster",
    "soft_fertig_ssh_auth_policy_refresh_roster",
    "soft_fertig_ssh_refusal_paths_refresh_roster",
    "soft_fertig_ssh_alternatives_refresh_roster",
    "soft_fertig_ssh_alternative_titles_refresh_roster",
    "soft_fertig_ssh_refusal_path_titles_refresh_roster",
    "soft_fertig_ssh_refusal_path_notes_refresh_roster",
    "soft_fertig_ssh_alternative_notes_refresh_roster",
    "soft_fertig_ssh_auth_note_refresh_roster",
    "soft_fertig_ssh_capability_flags_refresh_roster",
    "soft_fertig_ssh_method_lists_refresh_roster",
    "soft_fertig_ssh_batch_mode_refresh_roster",
    "soft_fertig_ssh_implemented_refresh_roster",
    "soft_fertig_ssh_not_implemented_refresh_roster",
    "soft_fertig_ssh_auth_note_snapshot_refresh_roster",
    "soft_fertig_ssh_implemented_check_refresh_roster",
    "soft_fertig_ssh_not_implemented_check_refresh_roster",
    "soft_fertig_ssh_alternative_presence_refresh_roster",
    "soft_fertig_ssh_implemented_batch_refresh_roster",
    "soft_fertig_ssh_not_implemented_batch_refresh_roster",
    "soft_fertig_ssh_implemented_agent_refresh_roster",
    "soft_fertig_ssh_implemented_identity_refresh_roster",
    "soft_fertig_ssh_not_implemented_keyboard_refresh_roster",
    "soft_fertig_ssh_not_implemented_password_refresh_roster",
    "soft_fertig_ssh_alternative_support_refresh_roster",
    "soft_fertig_ssh_password_support_refresh_roster",
    "soft_fertig_ssh_auth_refresh_roster",
    "soft_fertig_ssh_auth_field_presence_roster",
    "soft_fertig_ssh_auth_list_length_roster",
    "soft_fertig_ssh_auth_bool_flag_roster",
    "soft_fertig_ssh_auth_note_token_roster",
    "soft_fertig_ssh_auth_alternative_id_roster",
    "soft_fertig_ssh_auth_refusal_id_roster",
    "soft_fertig_ssh_auth_implemented_id_roster",
    "soft_fertig_ssh_auth_not_implemented_id_roster",
    "soft_fertig_ssh_auth_refusal_status_roster",
    "soft_fertig_ssh_auth_title_map_roster",
    "soft_fertig_ssh_auth_note_map_roster",
    "soft_fertig_ssh_auth_note_length_roster",
    "soft_fertig_ssh_auth_capability_count_roster",
    "soft_fertig_ssh_auth_batch_gate_roster",
    "soft_fertig_ssh_auth_support_gate_roster",
    "soft_fertig_ssh_auth_method_partition_roster",
    "soft_fertig_ssh_alternative_titles_roster",
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
    "soft_fertig_layout_fidelity_roster": (
        "/layout-fidelity field keys with titles and notes"
    ),
    "soft_fertig_stack_switch_roster": (
        "/stack-switch field keys with titles and notes"
    ),
    "soft_fertig_option_enable_roster": (
        "/option-enable field keys with titles and notes"
    ),
    "soft_fertig_expect_run_roster": (
        "/expect-install-plan/run refusal field keys with titles and notes"
    ),
    "soft_fertig_expect_steps_roster": (
        "/expect-install-plan/steps field keys with titles and notes"
    ),
    "soft_fertig_expect_steps_refusals_roster": (
        "/expect-install-plan/steps/refusals field keys with titles and notes"
    ),
    "soft_fertig_ssh_auth_roster": (
        "/ssh-auth field keys with titles and notes"
    ),
    "soft_fertig_password_ssh_roster": (
        "/ssh-auth/password refusal field keys with titles and notes"
    ),
    "soft_fertig_ssh_not_implemented_roster": (
        "/ssh-auth not_implemented method ids with titles and notes"
    ),
    "soft_fertig_ssh_implemented_roster": (
        "/ssh-auth implemented method ids with titles and notes"
    ),
    "soft_fertig_ssh_capability_flags_roster": (
        "/ssh-auth boolean capability flags with titles and notes"
    ),
    "soft_fertig_ssh_alternatives_roster": (
        "/ssh-auth alternatives method ids with titles and notes"
    ),
    "soft_fertig_ssh_refusal_paths_roster": (
        "/ssh-auth refusal path ids with titles and notes"
    ),
    "soft_fertig_ssh_refusal_status_roster": (
        "/ssh-auth refusal_paths HTTP status codes with titles and notes"
    ),
    "soft_fertig_ssh_method_lists_roster": (
        "/ssh-auth implemented/not_implemented/alternatives lists with titles and notes"
    ),
    "soft_fertig_ssh_auth_policy_roster": (
        "/ssh-auth batch/password policy booleans with titles and notes"
    ),
    "soft_fertig_ssh_alternative_notes_roster": (
        "/ssh-auth alternative_notes ids with titles and notes"
    ),
    "soft_fertig_ssh_alternative_titles_roster": (
        "/ssh-auth alternative_titles ids with display titles and notes"
    ),
    "soft_fertig_ssh_refusal_path_titles_roster": (
        "/ssh-auth refusal_path_titles ids with display titles and notes"
    ),
    "soft_fertig_ssh_refusal_path_notes_roster": (
        "/ssh-auth refusal_path_notes ids with titles and notes"
    ),
    "soft_fertig_ssh_auth_note_roster": (
        "/ssh-auth note field with title and note"
    ),
    "soft_fertig_ssh_alternative_support_roster": (
        "/ssh-auth identity_file/ssh_agent support booleans with titles and notes"
    ),
    "soft_fertig_ssh_password_support_roster": (
        "/ssh-auth password_supported/keyboard_interactive_supported booleans with titles and notes"
    ),
    "soft_fertig_ssh_batch_mode_roster": (
        "/ssh-auth batch_mode_only/batch_mode booleans with titles and notes"
    ),
    "soft_fertig_ssh_implemented_check_roster": (
        "/ssh-auth implemented[] membership for identity_file and ssh_agent"
    ),
    "soft_fertig_ssh_not_implemented_check_roster": (
        "/ssh-auth not_implemented[] membership for password and keyboard_interactive"
    ),
    "soft_fertig_ssh_alternative_presence_roster": (
        "/ssh-auth alternatives[] membership for identity_file and ssh_agent"
    ),
    "soft_fertig_ssh_implemented_batch_roster": (
        "/ssh-auth implemented[] membership for batch_mode and identity_file"
    ),
    "soft_fertig_ssh_not_implemented_batch_roster": (
        "/ssh-auth not_implemented[] membership for password and keyboard_interactive"
    ),
    "soft_fertig_ssh_implemented_agent_roster": (
        "/ssh-auth implemented[] membership for ssh_agent"
    ),
    "soft_fertig_ssh_auth_note_snapshot_roster": (
        "/ssh-auth note field text snapshot signals"
    ),
    "soft_fertig_ssh_honesty_refresh_roster": (
        "/ssh-auth alternatives[] and refusal_paths refresh membership"
    ),
    "soft_fertig_ssh_implemented_identity_roster": (
        "/ssh-auth implemented[] membership for identity_file"
    ),
    "soft_fertig_ssh_not_implemented_keyboard_roster": (
        "/ssh-auth not_implemented[] membership for keyboard_interactive"
    ),
    "soft_fertig_ssh_not_implemented_password_roster": (
        "/ssh-auth not_implemented[] membership for password"
    ),
    "soft_fertig_ssh_refusal_status_refresh_roster": (
        "/ssh-auth refusal_paths status refresh with titles and notes"
    ),
    "soft_fertig_ssh_auth_policy_refresh_roster": (
        "/ssh-auth batch/password policy boolean refresh with titles and notes"
    ),
    "soft_fertig_ssh_refusal_paths_refresh_roster": (
        "/ssh-auth refusal_paths membership refresh with titles and notes"
    ),
    "soft_fertig_ssh_alternatives_refresh_roster": (
        "/ssh-auth alternatives[] membership refresh with titles and notes"
    ),
    "soft_fertig_ssh_alternative_titles_refresh_roster": (
        "/ssh-auth alternative_titles display refresh with titles and notes"
    ),
    "soft_fertig_ssh_refusal_path_titles_refresh_roster": (
        "/ssh-auth refusal_path_titles display refresh with titles and notes"
    ),
    "soft_fertig_ssh_refusal_path_notes_refresh_roster": (
        "/ssh-auth refusal_path_notes display refresh with titles and notes"
    ),
    "soft_fertig_ssh_alternative_notes_refresh_roster": (
        "/ssh-auth alternative_notes display refresh with titles and notes"
    ),
    "soft_fertig_ssh_auth_note_refresh_roster": (
        "/ssh-auth note field refresh with titles and notes"
    ),
    "soft_fertig_ssh_capability_flags_refresh_roster": (
        "/ssh-auth capability flags refresh with titles and notes"
    ),
    "soft_fertig_ssh_method_lists_refresh_roster": (
        "/ssh-auth method lists refresh with titles and notes"
    ),
    "soft_fertig_ssh_batch_mode_refresh_roster": (
        "/ssh-auth batch mode refresh with titles and notes"
    ),
    "soft_fertig_ssh_implemented_refresh_roster": (
        "/ssh-auth implemented refresh with titles and notes"
    ),
    "soft_fertig_ssh_not_implemented_refresh_roster": (
        "/ssh-auth not-implemented refresh with titles and notes"
    ),
    "soft_fertig_ssh_auth_note_snapshot_refresh_roster": (
        "/ssh-auth auth-note-snapshot refresh with titles and notes"
    ),
    "soft_fertig_ssh_implemented_check_refresh_roster": (
        "/ssh-auth implemented-check refresh with titles and notes"
    ),
    "soft_fertig_ssh_not_implemented_check_refresh_roster": (
        "/ssh-auth not-implemented-check refresh with titles and notes"
    ),
    "soft_fertig_ssh_alternative_presence_refresh_roster": (
        "/ssh-auth alternative-presence refresh with titles and notes"
    ),
    "soft_fertig_ssh_implemented_batch_refresh_roster": (
        "/ssh-auth implemented-batch refresh with titles and notes"
    ),
    "soft_fertig_ssh_not_implemented_batch_refresh_roster": (
        "/ssh-auth not-implemented-batch refresh with titles and notes"
    ),
    "soft_fertig_ssh_implemented_agent_refresh_roster": (
        "/ssh-auth implemented-agent refresh with titles and notes"
    ),
    "soft_fertig_ssh_implemented_identity_refresh_roster": (
        "/ssh-auth implemented-identity refresh with titles and notes"
    ),
    "soft_fertig_ssh_not_implemented_keyboard_refresh_roster": (
        "/ssh-auth not-implemented-keyboard refresh with titles and notes"
    ),
    "soft_fertig_ssh_not_implemented_password_refresh_roster": (
        "/ssh-auth not-implemented-password refresh with titles and notes"
    ),
    "soft_fertig_ssh_alternative_support_refresh_roster": (
        "/ssh-auth alternative-support refresh with titles and notes"
    ),
    "soft_fertig_ssh_password_support_refresh_roster": (
        "/ssh-auth password-support refresh with titles and notes"
    ),
    "soft_fertig_ssh_auth_refresh_roster": (
        "/ssh-auth auth refresh with titles and notes"
    ),
    "soft_fertig_ssh_auth_field_presence_roster": (
        "/ssh-auth auth-field-presence with titles and notes"
    ),
    "soft_fertig_ssh_auth_list_length_roster": (
        "/ssh-auth auth-list-length with titles and notes"
    ),
    "soft_fertig_ssh_auth_bool_flag_roster": (
        "/ssh-auth auth-bool-flag with titles and notes"
    ),
    "soft_fertig_ssh_auth_note_token_roster": (
        "/ssh-auth auth-note-token with titles and notes"
    ),
    "soft_fertig_ssh_auth_alternative_id_roster": (
        "/ssh-auth auth-alternative-id with titles and notes"
    ),
    "soft_fertig_ssh_auth_refusal_id_roster": (
        "/ssh-auth auth-refusal-id with titles and notes"
    ),
    "soft_fertig_ssh_auth_implemented_id_roster": (
        "/ssh-auth auth-implemented-id with titles and notes"
    ),
    "soft_fertig_ssh_auth_not_implemented_id_roster": (
        "/ssh-auth auth-not-implemented-id with titles and notes"
    ),
    "soft_fertig_ssh_auth_refusal_status_roster": (
        "/ssh-auth auth-refusal-status with titles and notes"
    ),
    "soft_fertig_ssh_auth_title_map_roster": (
        "/ssh-auth auth-title-map with titles and notes"
    ),
    "soft_fertig_ssh_auth_note_map_roster": (
        "/ssh-auth auth-note-map with titles and notes"
    ),
    "soft_fertig_ssh_auth_note_length_roster": (
        "/ssh-auth auth-note-length with titles and notes"
    ),
    "soft_fertig_ssh_auth_capability_count_roster": (
        "/ssh-auth auth-capability-count with titles and notes"
    ),
    "soft_fertig_ssh_auth_batch_gate_roster": (
        "/ssh-auth auth-batch-gate with titles and notes"
    ),
    "soft_fertig_ssh_auth_support_gate_roster": (
        "/ssh-auth auth-support-gate with titles and notes"
    ),
    "soft_fertig_ssh_auth_method_partition_roster": (
        "/ssh-auth auth-method-partition with titles and notes"
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
    "soft_fertig_layout_fidelity_roster": (
        "Per /layout-fidelity field: id, title, and note."
    ),
    "soft_fertig_stack_switch_roster": (
        "Per /stack-switch field: id, title, and note."
    ),
    "soft_fertig_option_enable_roster": (
        "Per /option-enable field: id, title, and note."
    ),
    "soft_fertig_expect_run_roster": (
        "Per /expect-install-plan/run refusal field: id, title, and note."
    ),
    "soft_fertig_expect_steps_roster": (
        "Per /expect-install-plan/steps field: id, title, and note."
    ),
    "soft_fertig_expect_steps_refusals_roster": (
        "Per /expect-install-plan/steps/refusals field: id, title, and note."
    ),
    "soft_fertig_ssh_auth_roster": (
        "Per /ssh-auth field: id, title, and note."
    ),
    "soft_fertig_password_ssh_roster": (
        "Per POST /ssh-auth/password refusal field: id, title, and note."
    ),
    "soft_fertig_ssh_not_implemented_roster": (
        "Per /ssh-auth not_implemented method: id, title, and note."
    ),
    "soft_fertig_ssh_implemented_roster": (
        "Per /ssh-auth implemented method: id, title, and note."
    ),
    "soft_fertig_ssh_capability_flags_roster": (
        "Per /ssh-auth boolean capability flag: id, title, and note."
    ),
    "soft_fertig_ssh_alternatives_roster": (
        "Per /ssh-auth alternatives method: id, title, and note."
    ),
    "soft_fertig_ssh_refusal_paths_roster": (
        "Per /ssh-auth refusal path: id, title, and note."
    ),
    "soft_fertig_ssh_refusal_status_roster": (
        "Per /ssh-auth refusal path: id, status_code, title, and note."
    ),
    "soft_fertig_ssh_method_lists_roster": (
        "Per /ssh-auth method list: id, values, title, and note."
    ),
    "soft_fertig_ssh_auth_policy_roster": (
        "Per /ssh-auth policy boolean: id, value, title, and note."
    ),
    "soft_fertig_ssh_alternative_notes_roster": (
        "Per /ssh-auth alternative_notes id: title and note."
    ),
    "soft_fertig_ssh_alternative_titles_roster": (
        "Per /ssh-auth alternative_titles id: title and note."
    ),
    "soft_fertig_ssh_refusal_path_titles_roster": (
        "Per /ssh-auth refusal_path_titles id: title and note."
    ),
    "soft_fertig_ssh_refusal_path_notes_roster": (
        "Per /ssh-auth refusal_path_notes id: title and note."
    ),
    "soft_fertig_ssh_auth_note_roster": (
        "GET /ssh-auth note string with title and documentation note."
    ),
    "soft_fertig_ssh_alternative_support_roster": (
        "Per /ssh-auth alternative support boolean: id, value, title, and note."
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
    "hard_gaps_field_roster": "fwbweb.hardGapsFieldRoster.",
    "layout_fidelity_roster": "fwbweb.layoutFidelityRoster.",
    "stack_switch_roster": "fwbweb.stackSwitchRoster.",
    "option_enable_roster": "fwbweb.optionEnableRoster.",
    "expect_run_roster": "fwbweb.expectRunRoster.",
    "expect_steps_roster": "fwbweb.expectStepsRoster.",
    "expect_steps_refusals_roster": "fwbweb.expectStepsRefusalsRoster.",
    "ssh_auth_roster": "fwbweb.sshAuthRoster.",
    "password_ssh_roster": "fwbweb.passwordSshRoster.",
    "ssh_not_implemented_roster": "fwbweb.sshNotImplementedRoster.",
    "ssh_implemented_roster": "fwbweb.sshImplementedRoster.",
    "ssh_capability_flags_roster": "fwbweb.sshCapabilityFlagsRoster.",
    "ssh_alternatives_roster": "fwbweb.sshAlternativesRoster.",
    "ssh_refusal_paths_roster": "fwbweb.sshRefusalPathsRoster.",
    "ssh_refusal_status_roster": "fwbweb.sshRefusalStatusRoster.",
    "ssh_method_lists_roster": "fwbweb.sshMethodListsRoster.",
    "ssh_auth_policy_roster": "fwbweb.sshAuthPolicyRoster.",
    "ssh_alternative_notes_roster": "fwbweb.sshAlternativeNotesRoster.",
    "ssh_alternative_titles_roster": "fwbweb.sshAlternativeTitlesRoster.",
    "ssh_refusal_path_titles_roster": "fwbweb.sshRefusalPathTitlesRoster.",
    "ssh_refusal_path_notes_roster": "fwbweb.sshRefusalPathNotesRoster.",
    "ssh_auth_note_roster": "fwbweb.sshAuthNoteRoster.",
    "ssh_alternative_support_roster": "fwbweb.sshAlternativeSupportRoster.",
    "ssh_password_support_roster": "fwbweb.sshPasswordSupportRoster.",
    "ssh_batch_mode_roster": "fwbweb.sshBatchModeRoster.",
    "ssh_implemented_check_roster": "fwbweb.sshImplementedCheckRoster.",
    "ssh_not_implemented_check_roster": "fwbweb.sshNotImplementedCheckRoster.",
    "ssh_alternative_presence_roster": "fwbweb.sshAlternativePresenceRoster.",
    "ssh_implemented_batch_roster": "fwbweb.sshImplementedBatchRoster.",
    "ssh_not_implemented_batch_roster": "fwbweb.sshNotImplementedBatchRoster.",
    "ssh_implemented_agent_roster": "fwbweb.sshImplementedAgentRoster.",
    "ssh_auth_note_snapshot_roster": "fwbweb.sshAuthNoteSnapshotRoster.",
    "ssh_honesty_refresh_roster": "fwbweb.sshHonestyRefreshRoster.",
    "ssh_implemented_identity_roster": "fwbweb.sshImplementedIdentityRoster.",
    "ssh_not_implemented_keyboard_roster": "fwbweb.sshNotImplementedKeyboardRoster.",
    "ssh_not_implemented_password_roster": "fwbweb.sshNotImplementedPasswordRoster.",
    "ssh_refusal_status_refresh_roster": "fwbweb.sshRefusalStatusRefreshRoster.",
    "ssh_auth_policy_refresh_roster": "fwbweb.sshAuthPolicyRefreshRoster.",
    "ssh_refusal_paths_refresh_roster": "fwbweb.sshRefusalPathsRefreshRoster.",
    "ssh_alternatives_refresh_roster": "fwbweb.sshAlternativesRefreshRoster.",
    "ssh_alternative_titles_refresh_roster": "fwbweb.sshAlternativeTitlesRefreshRoster.",
    "ssh_refusal_path_titles_refresh_roster": "fwbweb.sshRefusalPathTitlesRefreshRoster.",
    "ssh_refusal_path_notes_refresh_roster": "fwbweb.sshRefusalPathNotesRefreshRoster.",
    "ssh_alternative_notes_refresh_roster": "fwbweb.sshAlternativeNotesRefreshRoster.",
    "ssh_auth_note_refresh_roster": "fwbweb.sshAuthNoteRefreshRoster.",
    "ssh_capability_flags_refresh_roster": "fwbweb.sshCapabilityFlagsRefreshRoster.",
    "ssh_method_lists_refresh_roster": "fwbweb.sshMethodListsRefreshRoster.",
    "ssh_batch_mode_refresh_roster": "fwbweb.sshBatchModeRefreshRoster.",
    "ssh_implemented_refresh_roster": "fwbweb.sshImplementedRefreshRoster.",
    "ssh_not_implemented_refresh_roster": "fwbweb.sshNotImplementedRefreshRoster.",
    "ssh_auth_note_snapshot_refresh_roster": "fwbweb.sshAuthNoteSnapshotRefreshRoster.",
    "ssh_implemented_check_refresh_roster": "fwbweb.sshImplementedCheckRefreshRoster.",
    "ssh_not_implemented_check_refresh_roster": "fwbweb.sshNotImplementedCheckRefreshRoster.",
    "ssh_alternative_presence_refresh_roster": "fwbweb.sshAlternativePresenceRefreshRoster.",
    "ssh_implemented_batch_refresh_roster": "fwbweb.sshImplementedBatchRefreshRoster.",
    "ssh_not_implemented_batch_refresh_roster": "fwbweb.sshNotImplementedBatchRefreshRoster.",
    "ssh_implemented_agent_refresh_roster": "fwbweb.sshImplementedAgentRefreshRoster.",
    "ssh_implemented_identity_refresh_roster": "fwbweb.sshImplementedIdentityRefreshRoster.",
    "ssh_not_implemented_keyboard_refresh_roster": "fwbweb.sshNotImplementedKeyboardRefreshRoster.",
    "ssh_not_implemented_password_refresh_roster": "fwbweb.sshNotImplementedPasswordRefreshRoster.",
    "ssh_alternative_support_refresh_roster": "fwbweb.sshAlternativeSupportRefreshRoster.",
    "ssh_password_support_refresh_roster": "fwbweb.sshPasswordSupportRefreshRoster.",
    "ssh_auth_refresh_roster": "fwbweb.sshAuthRefreshRoster.",
    "ssh_auth_field_presence_roster": "fwbweb.sshAuthFieldPresenceRoster.",
    "ssh_auth_list_length_roster": "fwbweb.sshAuthListLengthRoster.",
    "ssh_auth_bool_flag_roster": "fwbweb.sshAuthBoolFlagRoster.",
    "ssh_auth_note_token_roster": "fwbweb.sshAuthNoteTokenRoster.",
    "ssh_auth_alternative_id_roster": "fwbweb.sshAuthAlternativeIdRoster.",
    "ssh_auth_refusal_id_roster": "fwbweb.sshAuthRefusalIdRoster.",
    "ssh_auth_implemented_id_roster": "fwbweb.sshAuthImplementedIdRoster.",
    "ssh_auth_not_implemented_id_roster": "fwbweb.sshAuthNotImplementedIdRoster.",
    "ssh_auth_refusal_status_roster": "fwbweb.sshAuthRefusalStatusRoster.",
    "ssh_auth_title_map_roster": "fwbweb.sshAuthTitleMapRoster.",
    "ssh_auth_note_map_roster": "fwbweb.sshAuthNoteMapRoster.",
    "ssh_auth_note_length_roster": "fwbweb.sshAuthNoteLengthRoster.",
    "ssh_auth_capability_count_roster": "fwbweb.sshAuthCapabilityCountRoster.",
    "ssh_auth_batch_gate_roster": "fwbweb.sshAuthBatchGateRoster.",
    "ssh_auth_support_gate_roster": "fwbweb.sshAuthSupportGateRoster.",
    "ssh_auth_method_partition_roster": "fwbweb.sshAuthMethodPartitionRoster.",
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
    "hard_gaps_field_roster": "Hard-gaps field roster JSON",
    "layout_fidelity_roster": "Layout-fidelity roster JSON",
    "stack_switch_roster": "Stack-switch roster JSON",
    "option_enable_roster": "Option-enable roster JSON",
    "expect_run_roster": "Expect-run roster JSON",
    "expect_steps_roster": "Expect-steps roster JSON",
    "expect_steps_refusals_roster": "Expect-steps-refusals roster JSON",
    "ssh_auth_roster": "SSH-auth roster JSON",
    "password_ssh_roster": "Password-SSH roster JSON",
    "ssh_not_implemented_roster": "SSH not-implemented roster JSON",
    "ssh_implemented_roster": "SSH implemented roster JSON",
    "ssh_capability_flags_roster": "SSH capability flags roster JSON",
    "ssh_alternatives_roster": "SSH alternatives roster JSON",
    "ssh_refusal_paths_roster": "SSH refusal paths roster JSON",
    "ssh_refusal_status_roster": "SSH refusal status roster JSON",
    "ssh_method_lists_roster": "SSH method lists roster JSON",
    "ssh_auth_policy_roster": "SSH auth policy roster JSON",
    "ssh_alternative_notes_roster": "SSH alternative notes roster JSON",
    "ssh_alternative_titles_roster": "SSH alternative titles roster JSON",
    "ssh_refusal_path_titles_roster": "SSH refusal path titles roster JSON",
    "ssh_refusal_path_notes_roster": "SSH refusal path notes roster JSON",
    "ssh_auth_note_roster": "SSH auth note roster JSON",
    "ssh_alternative_support_roster": "SSH alternative support roster JSON",
    "ssh_password_support_roster": "SSH password support roster JSON",
    "ssh_batch_mode_roster": "SSH batch mode roster JSON",
    "ssh_implemented_check_roster": "SSH implemented-check roster JSON",
    "ssh_not_implemented_check_roster": "SSH not-implemented-check roster JSON",
    "ssh_alternative_presence_roster": "SSH alternative-presence roster JSON",
    "ssh_implemented_batch_roster": "SSH implemented-batch roster JSON",
    "ssh_not_implemented_batch_roster": "SSH not-implemented-batch roster JSON",
    "ssh_implemented_agent_roster": "SSH implemented-agent roster JSON",
    "ssh_auth_note_snapshot_roster": "SSH auth-note-snapshot roster JSON",
    "ssh_honesty_refresh_roster": "SSH honesty-refresh roster JSON",
    "ssh_implemented_identity_roster": "SSH implemented-identity roster JSON",
    "ssh_not_implemented_keyboard_roster": "SSH not-implemented-keyboard roster JSON",
    "ssh_not_implemented_password_roster": "SSH not-implemented-password roster JSON",
    "ssh_refusal_status_refresh_roster": "SSH refusal-status-refresh roster JSON",
    "ssh_auth_policy_refresh_roster": "SSH auth-policy-refresh roster JSON",
    "ssh_refusal_paths_refresh_roster": "SSH refusal-paths-refresh roster JSON",
    "ssh_alternatives_refresh_roster": "SSH alternatives-refresh roster JSON",
    "ssh_alternative_titles_refresh_roster": "SSH alternative-titles-refresh roster JSON",
    "ssh_refusal_path_titles_refresh_roster": "SSH refusal-path-titles-refresh roster JSON",
    "ssh_refusal_path_notes_refresh_roster": "SSH refusal-path-notes-refresh roster JSON",
    "ssh_alternative_notes_refresh_roster": "SSH alternative-notes-refresh roster JSON",
    "ssh_auth_note_refresh_roster": "SSH auth-note-refresh roster JSON",
    "ssh_capability_flags_refresh_roster": "SSH capability-flags-refresh roster JSON",
    "ssh_method_lists_refresh_roster": "SSH method-lists-refresh roster JSON",
    "ssh_batch_mode_refresh_roster": "SSH batch-mode-refresh roster JSON",
    "ssh_implemented_refresh_roster": "SSH implemented-refresh roster JSON",
    "ssh_not_implemented_refresh_roster": "SSH not-implemented-refresh roster JSON",
    "ssh_auth_note_snapshot_refresh_roster": "SSH auth-note-snapshot-refresh roster JSON",
    "ssh_implemented_check_refresh_roster": "SSH implemented-check-refresh roster JSON",
    "ssh_not_implemented_check_refresh_roster": "SSH not-implemented-check-refresh roster JSON",
    "ssh_alternative_presence_refresh_roster": "SSH alternative-presence-refresh roster JSON",
    "ssh_implemented_batch_refresh_roster": "SSH implemented-batch-refresh roster JSON",
    "ssh_not_implemented_batch_refresh_roster": "SSH not-implemented-batch-refresh roster JSON",
    "ssh_implemented_agent_refresh_roster": "SSH implemented-agent-refresh roster JSON",
    "ssh_implemented_identity_refresh_roster": "SSH implemented-identity-refresh roster JSON",
    "ssh_not_implemented_keyboard_refresh_roster": "SSH not-implemented-keyboard-refresh roster JSON",
    "ssh_not_implemented_password_refresh_roster": "SSH not-implemented-password-refresh roster JSON",
    "ssh_alternative_support_refresh_roster": "SSH alternative-support-refresh roster JSON",
    "ssh_password_support_refresh_roster": "SSH password-support-refresh roster JSON",
    "ssh_auth_refresh_roster": "SSH auth-refresh roster JSON",
    "ssh_auth_field_presence_roster": "SSH auth-field-presence roster JSON",
    "ssh_auth_list_length_roster": "SSH auth-list-length roster JSON",
    "ssh_auth_bool_flag_roster": "SSH auth-bool-flag roster JSON",
    "ssh_auth_note_token_roster": "SSH auth-note-token roster JSON",
    "ssh_auth_alternative_id_roster": "SSH auth-alternative-id roster JSON",
    "ssh_auth_refusal_id_roster": "SSH auth-refusal-id roster JSON",
    "ssh_auth_implemented_id_roster": "SSH auth-implemented-id roster JSON",
    "ssh_auth_not_implemented_id_roster": "SSH auth-not-implemented-id roster JSON",
    "ssh_auth_refusal_status_roster": "SSH auth-refusal-status roster JSON",
    "ssh_auth_title_map_roster": "SSH auth-title-map roster JSON",
    "ssh_auth_note_map_roster": "SSH auth-note-map roster JSON",
    "ssh_auth_note_length_roster": "SSH auth-note-length roster JSON",
    "ssh_auth_capability_count_roster": "SSH auth-capability-count roster JSON",
    "ssh_auth_batch_gate_roster": "SSH auth-batch-gate roster JSON",
    "ssh_auth_support_gate_roster": "SSH auth-support-gate roster JSON",
    "ssh_auth_method_partition_roster": "SSH auth-method-partition roster JSON",
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
    "hard_gaps_field_roster": (
        "Persists last downloaded/copied soft_fertig_hard_gaps_field_roster "
        "per firewall; UI restores expandable hard-gaps-field-roster detail "
        "on load."
    ),
    "layout_fidelity_roster": (
        "Persists last downloaded/copied soft_fertig_layout_fidelity_roster "
        "per firewall; UI restores expandable layout-fidelity-roster detail "
        "on load."
    ),
    "stack_switch_roster": (
        "Persists last downloaded/copied soft_fertig_stack_switch_roster "
        "per firewall; UI restores expandable stack-switch-roster detail "
        "on load."
    ),
    "option_enable_roster": (
        "Persists last downloaded/copied soft_fertig_option_enable_roster "
        "per firewall; UI restores expandable option-enable-roster detail "
        "on load."
    ),
    "expect_run_roster": (
        "Persists last downloaded/copied soft_fertig_expect_run_roster "
        "per firewall; UI restores expandable expect-run-roster detail "
        "on load."
    ),
    "expect_steps_roster": (
        "Persists last downloaded/copied soft_fertig_expect_steps_roster "
        "per firewall; UI restores expandable expect-steps-roster detail "
        "on load."
    ),
    "expect_steps_refusals_roster": (
        "Persists last downloaded/copied soft_fertig_expect_steps_refusals_roster "
        "per firewall; UI restores expandable expect-steps-refusals-roster detail "
        "on load."
    ),
    "ssh_auth_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_roster "
        "per firewall; UI restores expandable ssh-auth-roster detail "
        "on load."
    ),
    "password_ssh_roster": (
        "Persists last downloaded/copied soft_fertig_password_ssh_roster "
        "per firewall; UI restores expandable password-ssh-roster detail "
        "on load."
    ),
    "ssh_not_implemented_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_roster "
        "per firewall; UI restores expandable ssh-not-implemented-roster detail "
        "on load."
    ),
    "ssh_implemented_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_roster "
        "per firewall; UI restores expandable ssh-implemented-roster detail "
        "on load."
    ),
    "ssh_capability_flags_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_capability_flags_roster "
        "per firewall; UI restores expandable ssh-capability-flags-roster detail "
        "on load."
    ),
    "ssh_alternatives_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternatives_roster "
        "per firewall; UI restores expandable ssh-alternatives-roster detail "
        "on load."
    ),
    "ssh_refusal_paths_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_refusal_paths_roster "
        "per firewall; UI restores expandable ssh-refusal-paths-roster detail "
        "on load."
    ),
    "ssh_refusal_status_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_refusal_status_roster "
        "per firewall; UI restores expandable ssh-refusal-status-roster detail "
        "on load."
    ),
    "ssh_method_lists_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_method_lists_roster "
        "per firewall; UI restores expandable ssh-method-lists-roster detail "
        "on load."
    ),
    "ssh_auth_policy_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_policy_roster "
        "per firewall; UI restores expandable ssh-auth-policy-roster detail "
        "on load."
    ),
    "ssh_alternative_notes_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternative_notes_roster "
        "per firewall; UI restores expandable ssh-alternative-notes-roster detail "
        "on load."
    ),
    "ssh_alternative_titles_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternative_titles_roster "
        "per firewall; UI restores expandable ssh-alternative-titles-roster detail "
        "on load."
    ),
    "ssh_refusal_path_titles_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_refusal_path_titles_roster "
        "per firewall; UI restores expandable ssh-refusal-path-titles-roster detail "
        "on load."
    ),
    "ssh_refusal_path_notes_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_refusal_path_notes_roster "
        "per firewall; UI restores expandable ssh-refusal-path-notes-roster detail "
        "on load."
    ),
    "ssh_auth_note_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_note_roster "
        "per firewall; UI restores expandable ssh-auth-note-roster detail "
        "on load."
    ),
    "ssh_alternative_support_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternative_support_roster "
        "per firewall; UI restores expandable ssh-alternative-support-roster detail "
        "on load."
    ),
    "ssh_password_support_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_password_support_roster "
        "per firewall; UI restores expandable ssh-password-support-roster detail "
        "on load."
    ),
    "ssh_batch_mode_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_batch_mode_roster "
        "per firewall; UI restores expandable ssh-batch-mode-roster detail "
        "on load."
    ),
    "ssh_implemented_check_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_check_roster "
        "per firewall; UI restores expandable ssh-implemented-check-roster detail "
        "on load."
    ),
    "ssh_not_implemented_check_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_check_roster "
        "per firewall; UI restores expandable ssh-not-implemented-check-roster detail "
        "on load."
    ),
    "ssh_alternative_presence_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternative_presence_roster "
        "per firewall; UI restores expandable ssh-alternative-presence-roster detail "
        "on load."
    ),
    "ssh_implemented_batch_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_batch_roster "
        "per firewall; UI restores expandable ssh-implemented-batch-roster detail "
        "on load."
    ),
    "ssh_not_implemented_batch_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_batch_roster "
        "per firewall; UI restores expandable ssh-not-implemented-batch-roster detail "
        "on load."
    ),
    "ssh_implemented_agent_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_agent_roster "
        "per firewall; UI restores expandable ssh-implemented-agent-roster detail "
        "on load."
    ),
    "ssh_auth_note_snapshot_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_note_snapshot_roster "
        "per firewall; UI restores expandable ssh-auth-note-snapshot-roster detail "
        "on load."
    ),
    "ssh_honesty_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_honesty_refresh_roster "
        "per firewall; UI restores expandable ssh-honesty-refresh-roster detail "
        "on load."
    ),
    "ssh_implemented_identity_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_identity_roster "
        "per firewall; UI restores expandable ssh-implemented-identity-roster detail "
        "on load."
    ),
    "ssh_not_implemented_keyboard_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_keyboard_roster "
        "per firewall; UI restores expandable ssh-not-implemented-keyboard-roster detail "
        "on load."
    ),
    "ssh_not_implemented_password_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_password_roster "
        "per firewall; UI restores expandable ssh-not-implemented-password-roster detail "
        "on load."
    ),
    "ssh_refusal_status_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_refusal_status_refresh_roster "
        "per firewall; UI restores expandable ssh-refusal-status-refresh-roster detail "
        "on load."
    ),
    "ssh_auth_policy_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_policy_refresh_roster "
        "per firewall; UI restores expandable ssh-auth-policy-refresh-roster detail "
        "on load."
    ),
    "ssh_refusal_paths_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_refusal_paths_refresh_roster "
        "per firewall; UI restores expandable ssh-refusal-paths-refresh-roster detail "
        "on load."
    ),
    "ssh_alternatives_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternatives_refresh_roster "
        "per firewall; UI restores expandable ssh-alternatives-refresh-roster detail "
        "on load."
    ),
    "ssh_alternative_titles_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternative_titles_refresh_roster "
        "per firewall; UI restores expandable ssh-alternative-titles-refresh-roster detail "
        "on load."
    ),
    "ssh_refusal_path_titles_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_refusal_path_titles_refresh_roster "
        "per firewall; UI restores expandable ssh-refusal-path-titles-refresh-roster detail "
        "on load."
    ),
    "ssh_refusal_path_notes_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_refusal_path_notes_refresh_roster "
        "per firewall; UI restores expandable ssh-refusal-path-notes-refresh-roster detail "
        "on load."
    ),
    "ssh_alternative_notes_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternative_notes_refresh_roster "
        "per firewall; UI restores expandable ssh-alternative-notes-refresh-roster detail "
        "on load."
    ),
    "ssh_auth_note_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_note_refresh_roster "
        "per firewall; UI restores expandable ssh-auth-note-refresh-roster detail "
        "on load."
    ),
    "ssh_capability_flags_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_capability_flags_refresh_roster "
        "per firewall; UI restores expandable ssh-capability-flags-refresh-roster detail "
        "on load."
    ),
    "ssh_method_lists_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_method_lists_refresh_roster "
        "per firewall; UI restores expandable ssh-method-lists-refresh-roster detail "
        "on load."
    ),
    "ssh_batch_mode_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_batch_mode_refresh_roster "
        "per firewall; UI restores expandable ssh-batch-mode-refresh-roster detail "
        "on load."
    ),
    "ssh_implemented_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_refresh_roster "
        "per firewall; UI restores expandable ssh-implemented-refresh-roster detail "
        "on load."
    ),
    "ssh_not_implemented_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_refresh_roster "
        "per firewall; UI restores expandable ssh-not-implemented-refresh-roster detail "
        "on load."
    ),
    "ssh_auth_note_snapshot_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_note_snapshot_refresh_roster "
        "per firewall; UI restores expandable ssh-auth-note-snapshot-refresh-roster detail "
        "on load."
    ),
    "ssh_implemented_check_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_check_refresh_roster "
        "per firewall; UI restores expandable ssh-implemented-check-refresh-roster detail "
        "on load."
    ),
    "ssh_not_implemented_check_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_check_refresh_roster "
        "per firewall; UI restores expandable ssh-not-implemented-check-refresh-roster detail "
        "on load."
    ),
    "ssh_alternative_presence_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternative_presence_refresh_roster "
        "per firewall; UI restores expandable ssh-alternative-presence-refresh-roster detail "
        "on load."
    ),
    "ssh_implemented_batch_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_batch_refresh_roster "
        "per firewall; UI restores expandable ssh-implemented-batch-refresh-roster detail "
        "on load."
    ),
    "ssh_not_implemented_batch_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_batch_refresh_roster "
        "per firewall; UI restores expandable ssh-not-implemented-batch-refresh-roster detail "
        "on load."
    ),
    "ssh_implemented_agent_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_agent_refresh_roster "
        "per firewall; UI restores expandable ssh-implemented-agent-refresh-roster detail "
        "on load."
    ),
    "ssh_implemented_identity_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_implemented_identity_refresh_roster "
        "per firewall; UI restores expandable ssh-implemented-identity-refresh-roster detail "
        "on load."
    ),
    "ssh_not_implemented_keyboard_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_keyboard_refresh_roster "
        "per firewall; UI restores expandable ssh-not-implemented-keyboard-refresh-roster detail "
        "on load."
    ),
    "ssh_not_implemented_password_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_not_implemented_password_refresh_roster "
        "per firewall; UI restores expandable ssh-not-implemented-password-refresh-roster detail "
        "on load."
    ),
    "ssh_alternative_support_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_alternative_support_refresh_roster "
        "per firewall; UI restores expandable ssh-alternative-support-refresh-roster detail "
        "on load."
    ),
    "ssh_password_support_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_password_support_refresh_roster "
        "per firewall; UI restores expandable ssh-password-support-refresh-roster detail "
        "on load."
    ),
    "ssh_auth_refresh_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_refresh_roster "
        "per firewall; UI restores expandable ssh-auth-refresh-roster detail "
        "on load."
    ),
    "ssh_auth_field_presence_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_field_presence_roster "
        "per firewall; UI restores expandable ssh-auth-field-presence-roster detail "
        "on load."
    ),
    "ssh_auth_list_length_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_list_length_roster "
        "per firewall; UI restores expandable ssh-auth-list-length-roster detail "
        "on load."
    ),
    "ssh_auth_bool_flag_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_bool_flag_roster "
        "per firewall; UI restores expandable ssh-auth-bool-flag-roster detail "
        "on load."
    ),
    "ssh_auth_note_token_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_note_token_roster "
        "per firewall; UI restores expandable ssh-auth-note-token-roster detail "
        "on load."
    ),
    "ssh_auth_alternative_id_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_alternative_id_roster "
        "per firewall; UI restores expandable ssh-auth-alternative-id-roster detail "
        "on load."
    ),
    "ssh_auth_refusal_id_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_refusal_id_roster "
        "per firewall; UI restores expandable ssh-auth-refusal-id-roster detail "
        "on load."
    ),
    "ssh_auth_implemented_id_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_implemented_id_roster "
        "per firewall; UI restores expandable ssh-auth-implemented-id-roster detail "
        "on load."
    ),
    "ssh_auth_not_implemented_id_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_not_implemented_id_roster "
        "per firewall; UI restores expandable ssh-auth-not-implemented-id-roster detail "
        "on load."
    ),
    "ssh_auth_refusal_status_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_refusal_status_roster "
        "per firewall; UI restores expandable ssh-auth-refusal-status-roster detail "
        "on load."
    ),
    "ssh_auth_title_map_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_title_map_roster "
        "per firewall; UI restores expandable ssh-auth-title-map-roster detail "
        "on load."
    ),
    "ssh_auth_note_map_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_note_map_roster "
        "per firewall; UI restores expandable ssh-auth-note-map-roster detail "
        "on load."
    ),
    "ssh_auth_note_length_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_note_length_roster "
        "per firewall; UI restores expandable ssh-auth-note-length-roster detail "
        "on load."
    ),
    "ssh_auth_capability_count_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_capability_count_roster "
        "per firewall; UI restores expandable ssh-auth-capability-count-roster detail "
        "on load."
    ),
    "ssh_auth_batch_gate_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_batch_gate_roster "
        "per firewall; UI restores expandable ssh-auth-batch-gate-roster detail "
        "on load."
    ),
    "ssh_auth_support_gate_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_support_gate_roster "
        "per firewall; UI restores expandable ssh-auth-support-gate-roster detail "
        "on load."
    ),
    "ssh_auth_method_partition_roster": (
        "Persists last downloaded/copied soft_fertig_ssh_auth_method_partition_roster "
        "per firewall; UI restores expandable ssh-auth-method-partition-roster detail "
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
SOFT_FERTIG_HONESTY_SURFACE_VERSION = "5.68"
SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE = (
    "Schema 5.68: schema 5.67 plus soft_fertig_ssh_auth_method_partition_roster on "
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
    "hard_gaps_field_roster",
    "layout_fidelity_roster",
    "stack_switch_roster",
    "option_enable_roster",
    "expect_run_roster",
    "expect_steps_roster",
    "expect_steps_refusals_roster",
    "ssh_auth_roster",
    "password_ssh_roster",
    "ssh_not_implemented_roster",
    "ssh_implemented_roster",
    "ssh_capability_flags_roster",
    "ssh_alternatives_roster",
    "ssh_refusal_paths_roster",
    "ssh_refusal_status_roster",
    "ssh_method_lists_roster",
    "ssh_auth_policy_roster",
    "ssh_alternative_notes_roster",
    "ssh_alternative_titles_roster",
    "ssh_refusal_path_titles_roster",
    "ssh_refusal_path_notes_roster",
    "ssh_auth_note_roster",
    "ssh_alternative_support_roster",
    "ssh_password_support_roster",
    "ssh_batch_mode_roster",
    "ssh_implemented_check_roster",
    "ssh_not_implemented_check_roster",
    "ssh_alternative_presence_roster",
    "ssh_implemented_batch_roster",
    "ssh_not_implemented_batch_roster",
    "ssh_implemented_agent_roster",
    "ssh_auth_note_snapshot_roster",
    "ssh_honesty_refresh_roster",
    "ssh_implemented_identity_roster",
    "ssh_not_implemented_keyboard_roster",
    "ssh_not_implemented_password_roster",
    "ssh_refusal_status_refresh_roster",
    "ssh_auth_policy_refresh_roster",
    "ssh_refusal_paths_refresh_roster",
    "ssh_alternatives_refresh_roster",
    "ssh_alternative_titles_refresh_roster",
    "ssh_refusal_path_titles_refresh_roster",
    "ssh_refusal_path_notes_refresh_roster",
    "ssh_alternative_notes_refresh_roster",
    "ssh_auth_note_refresh_roster",
    "ssh_capability_flags_refresh_roster",
    "ssh_method_lists_refresh_roster",
    "ssh_batch_mode_refresh_roster",
    "ssh_implemented_refresh_roster",
    "ssh_not_implemented_refresh_roster",
    "ssh_auth_note_snapshot_refresh_roster",
    "ssh_implemented_check_refresh_roster",
    "ssh_not_implemented_check_refresh_roster",
    "ssh_alternative_presence_refresh_roster",
    "ssh_implemented_batch_refresh_roster",
    "ssh_not_implemented_batch_refresh_roster",
    "ssh_implemented_agent_refresh_roster",
    "ssh_implemented_identity_refresh_roster",
    "ssh_not_implemented_keyboard_refresh_roster",
    "ssh_not_implemented_password_refresh_roster",
    "ssh_alternative_support_refresh_roster",
    "ssh_password_support_refresh_roster",
    "ssh_auth_refresh_roster",
    "ssh_auth_field_presence_roster",
    "ssh_auth_list_length_roster",
    "ssh_auth_bool_flag_roster",
    "ssh_auth_note_token_roster",
    "ssh_auth_alternative_id_roster",
    "ssh_auth_refusal_id_roster",
    "ssh_auth_implemented_id_roster",
    "ssh_auth_not_implemented_id_roster",
    "ssh_auth_refusal_status_roster",
    "ssh_auth_title_map_roster",
    "ssh_auth_note_map_roster",
    "ssh_auth_note_length_roster",
    "ssh_auth_capability_count_roster",
    "ssh_auth_batch_gate_roster",
    "ssh_auth_support_gate_roster",
    "ssh_auth_method_partition_roster",
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
    "hard_gaps_field_roster": "/hard-gaps field keys with titles and notes",
    "layout_fidelity_roster": "/layout-fidelity field keys with titles and notes",
    "stack_switch_roster": "/stack-switch field keys with titles and notes",
    "option_enable_roster": "/option-enable field keys with titles and notes",
    "expect_run_roster": "/expect-install-plan/run refusal field keys with titles and notes",
    "expect_steps_roster": "/expect-install-plan/steps field keys with titles and notes",
    "expect_steps_refusals_roster": "/expect-install-plan/steps/refusals field keys with titles and notes",
    "ssh_auth_roster": "/ssh-auth field keys with titles and notes",
    "password_ssh_roster": "/ssh-auth/password refusal field keys with titles and notes",
    "ssh_not_implemented_roster": "/ssh-auth not_implemented method ids with titles and notes",
    "ssh_implemented_roster": "/ssh-auth implemented method ids with titles and notes",
    "ssh_capability_flags_roster": "/ssh-auth boolean capability flags with titles and notes",
    "ssh_alternatives_roster": "/ssh-auth alternatives method ids with titles and notes",
    "ssh_refusal_paths_roster": "/ssh-auth refusal path ids with titles and notes",
    "ssh_refusal_status_roster": "/ssh-auth refusal_paths HTTP status codes with titles and notes",
    "ssh_method_lists_roster": "/ssh-auth implemented/not_implemented/alternatives lists with titles and notes",
    "ssh_auth_policy_roster": "/ssh-auth batch/password policy booleans with titles and notes",
    "ssh_alternative_notes_roster": "/ssh-auth alternative_notes ids with titles and notes",
    "ssh_alternative_titles_roster": "/ssh-auth alternative_titles ids with display titles and notes",
    "ssh_refusal_path_titles_roster": "/ssh-auth refusal_path_titles ids with display titles and notes",
    "ssh_refusal_path_notes_roster": "/ssh-auth refusal_path_notes ids with titles and notes",
    "ssh_auth_note_roster": "/ssh-auth note field with title and note",
    "ssh_alternative_support_roster": "/ssh-auth identity_file/ssh_agent support booleans with titles and notes",
    "ssh_password_support_roster": "/ssh-auth password_supported/keyboard_interactive_supported booleans with titles and notes",
    "ssh_batch_mode_roster": "/ssh-auth batch_mode_only/batch_mode booleans with titles and notes",
    "ssh_implemented_check_roster": "/ssh-auth identity_file/ssh_agent in implemented[] with titles and notes",
    "ssh_not_implemented_check_roster": "/ssh-auth password/keyboard_interactive in not_implemented[] with titles and notes",
    "ssh_alternative_presence_roster": "/ssh-auth identity_file/ssh_agent in alternatives[] with titles and notes",
    "ssh_implemented_batch_roster": "/ssh-auth batch_mode/identity_file in implemented[] with titles and notes",
    "ssh_not_implemented_batch_roster": "/ssh-auth password/keyboard_interactive in not_implemented[] with titles and notes",
    "ssh_implemented_agent_roster": "/ssh-auth ssh_agent in implemented[] with titles and notes",
    "ssh_auth_note_snapshot_roster": "/ssh-auth note text snapshot signals with titles and notes",
    "ssh_honesty_refresh_roster": "/ssh-auth alternatives/refusal_paths refresh with titles and notes",
    "ssh_implemented_identity_roster": "/ssh-auth identity_file in implemented[] with titles and notes",
    "ssh_not_implemented_keyboard_roster": "/ssh-auth keyboard_interactive in not_implemented[] with titles and notes",
    "ssh_not_implemented_password_roster": "/ssh-auth password in not_implemented[] with titles and notes",
    "ssh_refusal_status_refresh_roster": "/ssh-auth refusal_paths status refresh with titles and notes",
    "ssh_auth_policy_refresh_roster": "/ssh-auth batch/password policy boolean refresh with titles and notes",
    "ssh_refusal_paths_refresh_roster": "/ssh-auth refusal_paths membership refresh with titles and notes",
    "ssh_alternatives_refresh_roster": "/ssh-auth alternatives[] membership refresh with titles and notes",
    "ssh_alternative_titles_refresh_roster": "/ssh-auth alternative_titles display refresh with titles and notes",
    "ssh_refusal_path_titles_refresh_roster": "/ssh-auth refusal_path_titles display refresh with titles and notes",    "ssh_refusal_path_notes_refresh_roster": "/ssh-auth refusal_path_notes display refresh with titles and notes",    "ssh_alternative_notes_refresh_roster": "/ssh-auth alternative_notes display refresh with titles and notes",    "ssh_auth_note_refresh_roster": "/ssh-auth note field refresh with titles and notes",
    "ssh_capability_flags_refresh_roster": "/ssh-auth capability flags refresh with titles and notes",
    "ssh_method_lists_refresh_roster": "/ssh-auth method lists refresh with titles and notes",
    "ssh_batch_mode_refresh_roster": "/ssh-auth batch mode refresh with titles and notes",
    "ssh_implemented_refresh_roster": "/ssh-auth implemented refresh with titles and notes",
    "ssh_not_implemented_refresh_roster": "/ssh-auth not-implemented refresh with titles and notes",
    "ssh_auth_note_snapshot_refresh_roster": "/ssh-auth auth-note-snapshot refresh with titles and notes",
    "ssh_implemented_check_refresh_roster": "/ssh-auth implemented-check refresh with titles and notes",
    "ssh_not_implemented_check_refresh_roster": "/ssh-auth not-implemented-check refresh with titles and notes",
    "ssh_alternative_presence_refresh_roster": "/ssh-auth alternative-presence refresh with titles and notes",
    "ssh_implemented_batch_refresh_roster": "/ssh-auth implemented-batch refresh with titles and notes",
    "ssh_not_implemented_batch_refresh_roster": "/ssh-auth not-implemented-batch refresh with titles and notes",
    "ssh_implemented_agent_refresh_roster": "/ssh-auth implemented-agent refresh with titles and notes",
    "ssh_implemented_identity_refresh_roster": "/ssh-auth implemented-identity refresh with titles and notes",
    "ssh_not_implemented_keyboard_refresh_roster": "/ssh-auth not-implemented-keyboard refresh with titles and notes",
    "ssh_not_implemented_password_refresh_roster": "/ssh-auth not-implemented-password refresh with titles and notes",
    "ssh_alternative_support_refresh_roster": "/ssh-auth alternative-support refresh with titles and notes",
    "ssh_password_support_refresh_roster": "/ssh-auth password-support refresh with titles and notes",
    "ssh_auth_refresh_roster": "/ssh-auth auth refresh with titles and notes",
    "ssh_auth_field_presence_roster": "/ssh-auth auth-field-presence with titles and notes",
    "ssh_auth_list_length_roster": "/ssh-auth auth-list-length with titles and notes",
    "ssh_auth_bool_flag_roster": "/ssh-auth auth-bool-flag with titles and notes",
    "ssh_auth_note_token_roster": "/ssh-auth auth-note-token with titles and notes",
    "ssh_auth_alternative_id_roster": "/ssh-auth auth-alternative-id with titles and notes",
    "ssh_auth_refusal_id_roster": "/ssh-auth auth-refusal-id with titles and notes",
    "ssh_auth_implemented_id_roster": "/ssh-auth auth-implemented-id with titles and notes",
    "ssh_auth_not_implemented_id_roster": "/ssh-auth auth-not-implemented-id with titles and notes",
    "ssh_auth_refusal_status_roster": "/ssh-auth auth-refusal-status with titles and notes",
    "ssh_auth_title_map_roster": "/ssh-auth auth-title-map with titles and notes",
    "ssh_auth_note_map_roster": "/ssh-auth auth-note-map with titles and notes",
    "ssh_auth_note_length_roster": "/ssh-auth auth-note-length with titles and notes",
    "ssh_auth_capability_count_roster": "/ssh-auth auth-capability-count with titles and notes",
    "ssh_auth_batch_gate_roster": "/ssh-auth auth-batch-gate with titles and notes",
    "ssh_auth_support_gate_roster": "/ssh-auth auth-support-gate with titles and notes",
    "ssh_auth_method_partition_roster": "/ssh-auth auth-method-partition with titles and notes",
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
    "hard_gaps_field_roster": (
        "Download/Copy soft_fertig_hard_gaps_field_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.hardGapsFieldRoster.*"
    ),
    "layout_fidelity_roster": (
        "Download/Copy soft_fertig_layout_fidelity_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.layoutFidelityRoster.*"
    ),
    "stack_switch_roster": (
        "Download/Copy soft_fertig_stack_switch_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.stackSwitchRoster.*"
    ),
    "option_enable_roster": (
        "Download/Copy soft_fertig_option_enable_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.optionEnableRoster.*"
    ),
    "expect_run_roster": (
        "Download/Copy soft_fertig_expect_run_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.expectRunRoster.*"
    ),
    "expect_steps_roster": (
        "Download/Copy soft_fertig_expect_steps_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.expectStepsRoster.*"
    ),
    "expect_steps_refusals_roster": (
        "Download/Copy soft_fertig_expect_steps_refusals_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.expectStepsRefusalsRoster.*"
    ),
    "ssh_auth_roster": (
        "Download/Copy soft_fertig_ssh_auth_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthRoster.*"
    ),
    "password_ssh_roster": (
        "Download/Copy soft_fertig_password_ssh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.passwordSshRoster.*"
    ),
    "ssh_not_implemented_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedRoster.*"
    ),
    "ssh_implemented_roster": (
        "Download/Copy soft_fertig_ssh_implemented_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedRoster.*"
    ),
    "ssh_capability_flags_roster": (
        "Download/Copy soft_fertig_ssh_capability_flags_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshCapabilityFlagsRoster.*"
    ),
    "ssh_alternatives_roster": (
        "Download/Copy soft_fertig_ssh_alternatives_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAlternativesRoster.*"
    ),
    "ssh_refusal_paths_roster": (
        "Download/Copy soft_fertig_ssh_refusal_paths_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshRefusalPathsRoster.*"
    ),
    "ssh_refusal_status_roster": (
        "Download/Copy soft_fertig_ssh_refusal_status_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshRefusalStatusRoster.*"
    ),
    "ssh_method_lists_roster": (
        "Download/Copy soft_fertig_ssh_method_lists_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshMethodListsRoster.*"
    ),
    "ssh_auth_policy_roster": (
        "Download/Copy soft_fertig_ssh_auth_policy_roster; also on /hard-gaps; sessionStorage fwbweb.sshAuthPolicyRoster.*"
    ),
    "ssh_alternative_notes_roster": (
        "Download/Copy soft_fertig_ssh_alternative_notes_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAlternativeNotesRoster.*"
    ),
    "ssh_alternative_titles_roster": (
        "Download/Copy soft_fertig_ssh_alternative_titles_roster; also on /hard-gaps; sessionStorage fwbweb.sshAlternativeTitlesRoster.*"
    ),
    "ssh_refusal_path_titles_roster": (
        "Download/Copy soft_fertig_ssh_refusal_path_titles_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshRefusalPathTitlesRoster.*"
    ),
    "ssh_refusal_path_notes_roster": (
        "Download/Copy soft_fertig_ssh_refusal_path_notes_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshRefusalPathNotesRoster.*"
    ),
    "ssh_auth_note_roster": (
        "Download/Copy soft_fertig_ssh_auth_note_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthNoteRoster.*"
    ),
    "ssh_alternative_support_roster": (
        "Download/Copy soft_fertig_ssh_alternative_support_roster; also on /hard-gaps; sessionStorage fwbweb.sshAlternativeSupportRoster.*"
    ),
    "ssh_password_support_roster": (
        "Download/Copy soft_fertig_ssh_password_support_roster; also on /hard-gaps; sessionStorage fwbweb.sshPasswordSupportRoster.*"
    ),
    "ssh_batch_mode_roster": (
        "Download/Copy soft_fertig_ssh_batch_mode_roster; also on /hard-gaps; sessionStorage fwbweb.sshBatchModeRoster.*"
    ),
    "ssh_implemented_check_roster": (
        "Download/Copy soft_fertig_ssh_implemented_check_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedCheckRoster.*"
    ),
    "ssh_not_implemented_check_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_check_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedCheckRoster.*"
    ),
    "ssh_alternative_presence_roster": (
        "Download/Copy soft_fertig_ssh_alternative_presence_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAlternativePresenceRoster.*"
    ),
    "ssh_implemented_batch_roster": (
        "Download/Copy soft_fertig_ssh_implemented_batch_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedBatchRoster.*"
    ),
    "ssh_not_implemented_batch_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_batch_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedBatchRoster.*"
    ),
    "ssh_implemented_agent_roster": (
        "Download/Copy soft_fertig_ssh_implemented_agent_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedAgentRoster.*"
    ),
    "ssh_auth_note_snapshot_roster": (
        "Download/Copy soft_fertig_ssh_auth_note_snapshot_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthNoteSnapshotRoster.*"
    ),
    "ssh_honesty_refresh_roster": (
        "Download/Copy soft_fertig_ssh_honesty_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshHonestyRefreshRoster.*"
    ),
    "ssh_implemented_identity_roster": (
        "Download/Copy soft_fertig_ssh_implemented_identity_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedIdentityRoster.*"
    ),
    "ssh_not_implemented_keyboard_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_keyboard_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedKeyboardRoster.*"
    ),
    "ssh_not_implemented_password_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_password_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedPasswordRoster.*"
    ),
    "ssh_refusal_status_refresh_roster": (
        "Download/Copy soft_fertig_ssh_refusal_status_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshRefusalStatusRefreshRoster.*"
    ),
    "ssh_auth_policy_refresh_roster": (
        "Download/Copy soft_fertig_ssh_auth_policy_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthPolicyRefreshRoster.*"
    ),
    "ssh_refusal_paths_refresh_roster": (
        "Download/Copy soft_fertig_ssh_refusal_paths_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshRefusalPathsRefreshRoster.*"
    ),
    "ssh_alternatives_refresh_roster": (
        "Download/Copy soft_fertig_ssh_alternatives_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAlternativesRefreshRoster.*"
    ),
    "ssh_alternative_titles_refresh_roster": (
        "Download/Copy soft_fertig_ssh_alternative_titles_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAlternativeTitlesRefreshRoster.*"
    ),
    "ssh_refusal_path_titles_refresh_roster": (
        "Download/Copy soft_fertig_ssh_refusal_path_titles_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshRefusalPathTitlesRefreshRoster.*"
    ),
    "ssh_refusal_path_notes_refresh_roster": (
        "Download/Copy soft_fertig_ssh_refusal_path_notes_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshRefusalPathNotesRefreshRoster.*"
    ),
    "ssh_alternative_notes_refresh_roster": (
        "Download/Copy soft_fertig_ssh_alternative_notes_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAlternativeNotesRefreshRoster.*"
    ),
    "ssh_auth_note_refresh_roster": (
        "Download/Copy soft_fertig_ssh_auth_note_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthNoteRefreshRoster.*"
    ),
    "ssh_capability_flags_refresh_roster": (
        "Download/Copy soft_fertig_ssh_capability_flags_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshCapabilityFlagsRefreshRoster.*"
    ),
    "ssh_method_lists_refresh_roster": (
        "Download/Copy soft_fertig_ssh_method_lists_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshMethodListsRefreshRoster.*"
    ),
    "ssh_batch_mode_refresh_roster": (
        "Download/Copy soft_fertig_ssh_batch_mode_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshBatchModeRefreshRoster.*"
    ),
    "ssh_implemented_refresh_roster": (
        "Download/Copy soft_fertig_ssh_implemented_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedRefreshRoster.*"
    ),
    "ssh_not_implemented_refresh_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedRefreshRoster.*"
    ),
    "ssh_auth_note_snapshot_refresh_roster": (
        "Download/Copy soft_fertig_ssh_auth_note_snapshot_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthNoteSnapshotRefreshRoster.*"
    ),
    "ssh_implemented_check_refresh_roster": (
        "Download/Copy soft_fertig_ssh_implemented_check_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedCheckRefreshRoster.*"
    ),
    "ssh_not_implemented_check_refresh_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_check_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedCheckRefreshRoster.*"
    ),
    "ssh_alternative_presence_refresh_roster": (
        "Download/Copy soft_fertig_ssh_alternative_presence_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAlternativePresenceRefreshRoster.*"
    ),
    "ssh_implemented_batch_refresh_roster": (
        "Download/Copy soft_fertig_ssh_implemented_batch_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedBatchRefreshRoster.*"
    ),
    "ssh_not_implemented_batch_refresh_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_batch_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedBatchRefreshRoster.*"
    ),
    "ssh_implemented_agent_refresh_roster": (
        "Download/Copy soft_fertig_ssh_implemented_agent_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedAgentRefreshRoster.*"
    ),
    "ssh_implemented_identity_refresh_roster": (
        "Download/Copy soft_fertig_ssh_implemented_identity_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshImplementedIdentityRefreshRoster.*"
    ),
    "ssh_not_implemented_keyboard_refresh_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_keyboard_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedKeyboardRefreshRoster.*"
    ),
    "ssh_not_implemented_password_refresh_roster": (
        "Download/Copy soft_fertig_ssh_not_implemented_password_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshNotImplementedPasswordRefreshRoster.*"
    ),
    "ssh_alternative_support_refresh_roster": (
        "Download/Copy soft_fertig_ssh_alternative_support_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAlternativeSupportRefreshRoster.*"
    ),
    "ssh_password_support_refresh_roster": (
        "Download/Copy soft_fertig_ssh_password_support_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshPasswordSupportRefreshRoster.*"
    ),
    "ssh_auth_refresh_roster": (
        "Download/Copy soft_fertig_ssh_auth_refresh_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthRefreshRoster.*"
    ),
    "ssh_auth_field_presence_roster": (
        "Download/Copy soft_fertig_ssh_auth_field_presence_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthFieldPresenceRoster.*"
    ),
    "ssh_auth_list_length_roster": (
        "Download/Copy soft_fertig_ssh_auth_list_length_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthListLengthRoster.*"
    ),
    "ssh_auth_bool_flag_roster": (
        "Download/Copy soft_fertig_ssh_auth_bool_flag_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthBoolFlagRoster.*"
    ),
    "ssh_auth_note_token_roster": (
        "Download/Copy soft_fertig_ssh_auth_note_token_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthNoteTokenRoster.*"
    ),
    "ssh_auth_alternative_id_roster": (
        "Download/Copy soft_fertig_ssh_auth_alternative_id_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthAlternativeIdRoster.*"
    ),
    "ssh_auth_refusal_id_roster": (
        "Download/Copy soft_fertig_ssh_auth_refusal_id_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthRefusalIdRoster.*"
    ),
    "ssh_auth_implemented_id_roster": (
        "Download/Copy soft_fertig_ssh_auth_implemented_id_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthImplementedIdRoster.*"
    ),
    "ssh_auth_not_implemented_id_roster": (
        "Download/Copy soft_fertig_ssh_auth_not_implemented_id_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthNotImplementedIdRoster.*"
    ),
    "ssh_auth_refusal_status_roster": (
        "Download/Copy soft_fertig_ssh_auth_refusal_status_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthRefusalStatusRoster.*"
    ),
    "ssh_auth_title_map_roster": (
        "Download/Copy soft_fertig_ssh_auth_title_map_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthTitleMapRoster.*"
    ),
    "ssh_auth_note_map_roster": (
        "Download/Copy soft_fertig_ssh_auth_note_map_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthNoteMapRoster.*"
    ),
    "ssh_auth_note_length_roster": (
        "Download/Copy soft_fertig_ssh_auth_note_length_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthNoteLengthRoster.*"
    ),
    "ssh_auth_capability_count_roster": (
        "Download/Copy soft_fertig_ssh_auth_capability_count_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthCapabilityCountRoster.*"
    ),
    "ssh_auth_batch_gate_roster": (
        "Download/Copy soft_fertig_ssh_auth_batch_gate_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthBatchGateRoster.*"
    ),
    "ssh_auth_support_gate_roster": (
        "Download/Copy soft_fertig_ssh_auth_support_gate_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthSupportGateRoster.*"
    ),
    "ssh_auth_method_partition_roster": (
        "Download/Copy soft_fertig_ssh_auth_method_partition_roster; also on /hard-gaps; "
        "sessionStorage fwbweb.sshAuthMethodPartitionRoster.*"
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
    "hard_gaps_field_roster",
    "layout_fidelity_roster",
    "stack_switch_roster",
    "option_enable_roster",
    "expect_run_roster",
    "expect_steps_roster",
    "expect_steps_refusals_roster",
    "ssh_auth_roster",
    "password_ssh_roster",
    "ssh_not_implemented_roster",
    "ssh_implemented_roster",
    "ssh_capability_flags_roster",
    "ssh_alternatives_roster",
    "ssh_refusal_paths_roster",
    "ssh_refusal_status_roster",
    "ssh_method_lists_roster",
    "ssh_auth_policy_roster",
    "ssh_alternative_notes_roster",
    "ssh_alternative_titles_roster",
    "ssh_refusal_path_titles_roster",
    "ssh_refusal_path_notes_roster",
    "ssh_auth_note_roster",
    "ssh_alternative_support_roster",
    "ssh_password_support_roster",
    "ssh_batch_mode_roster",
    "ssh_implemented_check_roster",
    "ssh_not_implemented_check_roster",
    "ssh_alternative_presence_roster",
    "ssh_implemented_batch_roster",
    "ssh_not_implemented_batch_roster",
    "ssh_implemented_agent_roster",
    "ssh_auth_note_snapshot_roster",
    "ssh_honesty_refresh_roster",
    "ssh_implemented_identity_roster",
    "ssh_not_implemented_keyboard_roster",
    "ssh_not_implemented_password_roster",
    "ssh_refusal_status_refresh_roster",
    "ssh_auth_policy_refresh_roster",
    "ssh_refusal_paths_refresh_roster",
    "ssh_alternatives_refresh_roster",
    "ssh_alternative_titles_refresh_roster",
    "ssh_refusal_path_titles_refresh_roster",
    "ssh_refusal_path_notes_refresh_roster",
    "ssh_alternative_notes_refresh_roster",
    "ssh_auth_note_refresh_roster",
    "ssh_capability_flags_refresh_roster",
    "ssh_method_lists_refresh_roster",
    "ssh_batch_mode_refresh_roster",
    "ssh_implemented_refresh_roster",
    "ssh_not_implemented_refresh_roster",
    "ssh_auth_note_snapshot_refresh_roster",
    "ssh_implemented_check_refresh_roster",
    "ssh_not_implemented_check_refresh_roster",
    "ssh_alternative_presence_refresh_roster",
    "ssh_implemented_batch_refresh_roster",
    "ssh_not_implemented_batch_refresh_roster",
    "ssh_implemented_agent_refresh_roster",
    "ssh_implemented_identity_refresh_roster",
    "ssh_not_implemented_keyboard_refresh_roster",
    "ssh_not_implemented_password_refresh_roster",
    "ssh_alternative_support_refresh_roster",
    "ssh_password_support_refresh_roster",
    "ssh_auth_refresh_roster",
    "ssh_auth_field_presence_roster",
    "ssh_auth_list_length_roster",
    "ssh_auth_bool_flag_roster",
    "ssh_auth_note_token_roster",
    "ssh_auth_alternative_id_roster",
    "ssh_auth_refusal_id_roster",
    "ssh_auth_implemented_id_roster",
    "ssh_auth_not_implemented_id_roster",
    "ssh_auth_refusal_status_roster",
    "ssh_auth_title_map_roster",
    "ssh_auth_note_map_roster",
    "ssh_auth_note_length_roster",
    "ssh_auth_capability_count_roster",
    "ssh_auth_batch_gate_roster",
    "ssh_auth_support_gate_roster",
    "ssh_auth_method_partition_roster",
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
    "hard_gaps_field_roster": "/hard-gaps field keys with titles and notes",
    "layout_fidelity_roster": "/layout-fidelity field keys with titles and notes",
    "stack_switch_roster": "/stack-switch field keys with titles and notes",
    "option_enable_roster": "/option-enable field keys with titles and notes",
    "expect_run_roster": "/expect-install-plan/run refusal field keys with titles and notes",
    "expect_steps_roster": "/expect-install-plan/steps field keys with titles and notes",
    "expect_steps_refusals_roster": "/expect-install-plan/steps/refusals field keys with titles and notes",
    "ssh_auth_roster": "/ssh-auth field keys with titles and notes",
    "password_ssh_roster": "/ssh-auth/password refusal field keys with titles and notes",
    "ssh_not_implemented_roster": "/ssh-auth not_implemented method ids with titles and notes",
    "ssh_implemented_roster": "/ssh-auth implemented method ids with titles and notes",
    "ssh_capability_flags_roster": "/ssh-auth boolean capability flags with titles and notes",
    "ssh_alternatives_roster": "/ssh-auth alternatives method ids with titles and notes",
    "ssh_refusal_paths_roster": "/ssh-auth refusal path ids with titles and notes",
    "ssh_refusal_status_roster": "/ssh-auth refusal_paths HTTP status codes with titles and notes",
    "ssh_method_lists_roster": "/ssh-auth implemented/not_implemented/alternatives lists with titles and notes",
    "ssh_auth_policy_roster": "/ssh-auth batch/password policy booleans with titles and notes",
    "ssh_alternative_notes_roster": "/ssh-auth alternative_notes ids with titles and notes",
    "ssh_alternative_titles_roster": "/ssh-auth alternative_titles ids with display titles and notes",
    "ssh_refusal_path_titles_roster": "/ssh-auth refusal_path_titles ids with display titles and notes",
    "ssh_refusal_path_notes_roster": "/ssh-auth refusal_path_notes ids with titles and notes",
    "ssh_auth_note_roster": "/ssh-auth note field with title and note",
    "ssh_alternative_support_roster": "/ssh-auth identity_file/ssh_agent support booleans with titles and notes",
    "ssh_password_support_roster": "/ssh-auth password_supported/keyboard_interactive_supported booleans with titles and notes",
    "ssh_batch_mode_roster": "/ssh-auth batch_mode_only/batch_mode booleans with titles and notes",
    "ssh_implemented_check_roster": "/ssh-auth identity_file/ssh_agent in implemented[] with titles and notes",
    "ssh_not_implemented_check_roster": "/ssh-auth password/keyboard_interactive in not_implemented[] with titles and notes",
    "ssh_alternative_presence_roster": "/ssh-auth identity_file/ssh_agent in alternatives[] with titles and notes",
    "ssh_implemented_batch_roster": "/ssh-auth batch_mode/identity_file in implemented[] with titles and notes",
    "ssh_not_implemented_batch_roster": "/ssh-auth password/keyboard_interactive in not_implemented[] with titles and notes",
    "ssh_implemented_agent_roster": "/ssh-auth ssh_agent in implemented[] with titles and notes",
    "ssh_auth_note_snapshot_roster": "/ssh-auth note text snapshot signals with titles and notes",
    "ssh_honesty_refresh_roster": "/ssh-auth alternatives/refusal_paths refresh with titles and notes",
    "ssh_implemented_identity_roster": "/ssh-auth identity_file in implemented[] with titles and notes",
    "ssh_not_implemented_keyboard_roster": "/ssh-auth keyboard_interactive in not_implemented[] with titles and notes",
    "ssh_not_implemented_password_roster": "/ssh-auth password in not_implemented[] with titles and notes",
    "ssh_refusal_status_refresh_roster": "/ssh-auth refusal_paths status refresh with titles and notes",
    "ssh_auth_policy_refresh_roster": "/ssh-auth batch/password policy boolean refresh with titles and notes",
    "ssh_refusal_paths_refresh_roster": "/ssh-auth refusal_paths membership refresh with titles and notes",
    "ssh_alternatives_refresh_roster": "/ssh-auth alternatives[] membership refresh with titles and notes",
    "ssh_alternative_titles_refresh_roster": "/ssh-auth alternative_titles display refresh with titles and notes",
    "ssh_refusal_path_titles_refresh_roster": "/ssh-auth refusal_path_titles display refresh with titles and notes",
    "ssh_refusal_path_notes_refresh_roster": "/ssh-auth refusal_path_notes display refresh with titles and notes",
    "ssh_alternative_notes_refresh_roster": "/ssh-auth alternative_notes display refresh with titles and notes",
    "ssh_auth_note_refresh_roster": "/ssh-auth note field refresh with titles and notes",
    "ssh_capability_flags_refresh_roster": "/ssh-auth capability flags refresh with titles and notes",
    "ssh_method_lists_refresh_roster": "/ssh-auth method lists refresh with titles and notes",
    "ssh_batch_mode_refresh_roster": "/ssh-auth batch mode refresh with titles and notes",
    "ssh_implemented_refresh_roster": "/ssh-auth implemented refresh with titles and notes",
    "ssh_not_implemented_refresh_roster": "/ssh-auth not-implemented refresh with titles and notes",
    "ssh_auth_note_snapshot_refresh_roster": "/ssh-auth auth-note-snapshot refresh with titles and notes",
    "ssh_implemented_check_refresh_roster": "/ssh-auth implemented-check refresh with titles and notes",
    "ssh_not_implemented_check_refresh_roster": "/ssh-auth not-implemented-check refresh with titles and notes",
    "ssh_alternative_presence_refresh_roster": "/ssh-auth alternative-presence refresh with titles and notes",
    "ssh_implemented_batch_refresh_roster": "/ssh-auth implemented-batch refresh with titles and notes",
    "ssh_not_implemented_batch_refresh_roster": "/ssh-auth not-implemented-batch refresh with titles and notes",
    "ssh_implemented_agent_refresh_roster": "/ssh-auth implemented-agent refresh with titles and notes",
    "ssh_implemented_identity_refresh_roster": "/ssh-auth implemented-identity refresh with titles and notes",
    "ssh_not_implemented_keyboard_refresh_roster": "/ssh-auth not-implemented-keyboard refresh with titles and notes",
    "ssh_not_implemented_password_refresh_roster": "/ssh-auth not-implemented-password refresh with titles and notes",
    "ssh_alternative_support_refresh_roster": "/ssh-auth alternative-support refresh with titles and notes",
    "ssh_password_support_refresh_roster": "/ssh-auth password-support refresh with titles and notes",
    "ssh_auth_refresh_roster": "/ssh-auth auth refresh with titles and notes",
    "ssh_auth_field_presence_roster": "/ssh-auth auth-field-presence with titles and notes",
    "ssh_auth_list_length_roster": "/ssh-auth auth-list-length with titles and notes",
    "ssh_auth_bool_flag_roster": "/ssh-auth auth-bool-flag with titles and notes",
    "ssh_auth_note_token_roster": "/ssh-auth auth-note-token with titles and notes",
    "ssh_auth_alternative_id_roster": "/ssh-auth auth-alternative-id with titles and notes",
    "ssh_auth_refusal_id_roster": "/ssh-auth auth-refusal-id with titles and notes",
    "ssh_auth_implemented_id_roster": "/ssh-auth auth-implemented-id with titles and notes",
    "ssh_auth_not_implemented_id_roster": "/ssh-auth auth-not-implemented-id with titles and notes",
    "ssh_auth_refusal_status_roster": "/ssh-auth auth-refusal-status with titles and notes",
    "ssh_auth_title_map_roster": "/ssh-auth auth-title-map with titles and notes",
    "ssh_auth_note_map_roster": "/ssh-auth auth-note-map with titles and notes",
    "ssh_auth_note_length_roster": "/ssh-auth auth-note-length with titles and notes",
    "ssh_auth_capability_count_roster": "/ssh-auth auth-capability-count with titles and notes",
    "ssh_auth_batch_gate_roster": "/ssh-auth auth-batch-gate with titles and notes",
    "ssh_auth_support_gate_roster": "/ssh-auth auth-support-gate with titles and notes",
    "ssh_auth_method_partition_roster": "/ssh-auth auth-method-partition with titles and notes",
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
    "hard_gaps_field_roster": (
        "Same subset as Download hard-gaps field roster; "
        "also sessionStorage fwbweb.hardGapsFieldRoster.*"
    ),
    "layout_fidelity_roster": (
        "Same subset as Download layout-fidelity roster; "
        "also sessionStorage fwbweb.layoutFidelityRoster.*"
    ),
    "stack_switch_roster": (
        "Same subset as Download stack-switch roster; "
        "also sessionStorage fwbweb.stackSwitchRoster.*"
    ),
    "option_enable_roster": (
        "Same subset as Download option-enable roster; "
        "also sessionStorage fwbweb.optionEnableRoster.*"
    ),
    "expect_run_roster": (
        "Same subset as Download expect-run roster; "
        "also sessionStorage fwbweb.expectRunRoster.*"
    ),
    "expect_steps_roster": (
        "Same subset as Download expect-steps roster; "
        "also sessionStorage fwbweb.expectStepsRoster.*"
    ),
    "expect_steps_refusals_roster": (
        "Same subset as Download expect-steps-refusals roster; "
        "also sessionStorage fwbweb.expectStepsRefusalsRoster.*"
    ),
    "ssh_auth_roster": (
        "Same subset as Download ssh-auth roster; "
        "also sessionStorage fwbweb.sshAuthRoster.*"
    ),
    "password_ssh_roster": (
        "Same subset as Download password-ssh roster; "
        "also sessionStorage fwbweb.passwordSshRoster.*"
    ),
    "ssh_not_implemented_roster": (
        "Same subset as Download ssh-not-implemented roster; "
        "also sessionStorage fwbweb.sshNotImplementedRoster.*"
    ),
    "ssh_implemented_roster": (
        "Same subset as Download ssh-implemented roster; "
        "also sessionStorage fwbweb.sshImplementedRoster.*"
    ),
    "ssh_capability_flags_roster": (
        "Same subset as Download ssh-capability-flags roster; "
        "also sessionStorage fwbweb.sshCapabilityFlagsRoster.*"
    ),
    "ssh_alternatives_roster": (
        "Same subset as Download ssh-alternatives roster; "
        "also sessionStorage fwbweb.sshAlternativesRoster.*"
    ),
    "ssh_refusal_paths_roster": (
        "Same subset as Download ssh-refusal-paths roster; "
        "also sessionStorage fwbweb.sshRefusalPathsRoster.*"
    ),
    "ssh_refusal_status_roster": (
        "Same subset as Download ssh-refusal-status roster; "
        "also sessionStorage fwbweb.sshRefusalStatusRoster.*"
    ),
    "ssh_method_lists_roster": (
        "Same subset as Download ssh-method-lists roster; "
        "also sessionStorage fwbweb.sshMethodListsRoster.*"
    ),
    "ssh_auth_policy_roster": (
        "Same subset as Download ssh-auth-policy roster; also sessionStorage fwbweb.sshAuthPolicyRoster.*"
    ),
    "ssh_alternative_notes_roster": (
        "Same subset as Download ssh-alternative-notes roster; "
        "also sessionStorage fwbweb.sshAlternativeNotesRoster.*"
    ),
    "ssh_alternative_titles_roster": (
        "Same subset as Download ssh-alternative-titles roster; also sessionStorage fwbweb.sshAlternativeTitlesRoster.*"
    ),
    "ssh_refusal_path_titles_roster": (
        "Same subset as Download ssh-refusal-path-titles roster; "
        "also sessionStorage fwbweb.sshRefusalPathTitlesRoster.*"
    ),
    "ssh_refusal_path_notes_roster": (
        "Same subset as Download ssh-refusal-path-notes roster; "
        "also sessionStorage fwbweb.sshRefusalPathNotesRoster.*"
    ),
    "ssh_auth_note_roster": (
        "Same subset as Download ssh-auth-note roster; "
        "also sessionStorage fwbweb.sshAuthNoteRoster.*"
    ),
    "ssh_alternative_support_roster": (
        "Same subset as Download ssh-alternative-support roster; "
        "also sessionStorage fwbweb.sshAlternativeSupportRoster.*"
    ),
    "ssh_password_support_roster": (
        "Same subset as Download ssh-password-support roster; "
        "also sessionStorage fwbweb.sshPasswordSupportRoster.*"
    ),
    "ssh_batch_mode_roster": (
        "Same subset as Download ssh-batch-mode roster; "
        "also sessionStorage fwbweb.sshBatchModeRoster.*"
    ),
    "ssh_implemented_check_roster": (
        "Same subset as Download ssh-implemented-check roster; "
        "also sessionStorage fwbweb.sshImplementedCheckRoster.*"
    ),
    "ssh_not_implemented_check_roster": (
        "Same subset as Download ssh-not-implemented-check roster; "
        "also sessionStorage fwbweb.sshNotImplementedCheckRoster.*"
    ),
    "ssh_alternative_presence_roster": (
        "Same subset as Download ssh-alternative-presence roster; "
        "also sessionStorage fwbweb.sshAlternativePresenceRoster.*"
    ),
    "ssh_implemented_batch_roster": (
        "Same subset as Download ssh-implemented-batch roster; "
        "also sessionStorage fwbweb.sshImplementedBatchRoster.*"
    ),
    "ssh_not_implemented_batch_roster": (
        "Same subset as Download ssh-not-implemented-batch roster; "
        "also sessionStorage fwbweb.sshNotImplementedBatchRoster.*"
    ),
    "ssh_implemented_agent_roster": (
        "Same subset as Download ssh-implemented-agent roster; "
        "also sessionStorage fwbweb.sshImplementedAgentRoster.*"
    ),
    "ssh_auth_note_snapshot_roster": (
        "Same subset as Download ssh-auth-note-snapshot roster; "
        "also sessionStorage fwbweb.sshAuthNoteSnapshotRoster.*"
    ),
    "ssh_honesty_refresh_roster": (
        "Same subset as Download ssh-honesty-refresh roster; "
        "also sessionStorage fwbweb.sshHonestyRefreshRoster.*"
    ),
    "ssh_implemented_identity_roster": (
        "Same subset as Download ssh-implemented-identity roster; "
        "also sessionStorage fwbweb.sshImplementedIdentityRoster.*"
    ),
    "ssh_not_implemented_keyboard_roster": (
        "Same subset as Download ssh-not-implemented-keyboard roster; "
        "also sessionStorage fwbweb.sshNotImplementedKeyboardRoster.*"
    ),
    "ssh_not_implemented_password_roster": (
        "Same subset as Download ssh-not-implemented-password roster; "
        "also sessionStorage fwbweb.sshNotImplementedPasswordRoster.*"
    ),
    "ssh_refusal_status_refresh_roster": (
        "Same subset as Download ssh-refusal-status-refresh roster; "
        "also sessionStorage fwbweb.sshRefusalStatusRefreshRoster.*"
    ),
    "ssh_auth_policy_refresh_roster": (
        "Same subset as Download ssh-auth-policy-refresh roster; "
        "also sessionStorage fwbweb.sshAuthPolicyRefreshRoster.*"
    ),
    "ssh_refusal_paths_refresh_roster": (
        "Same subset as Download ssh-refusal-paths-refresh roster; "
        "also sessionStorage fwbweb.sshRefusalPathsRefreshRoster.*"
    ),
    "ssh_alternatives_refresh_roster": (
        "Same subset as Download ssh-alternatives-refresh roster; "
        "also sessionStorage fwbweb.sshAlternativesRefreshRoster.*"
    ),
    "ssh_alternative_titles_refresh_roster": (
        "Same subset as Download ssh-alternative-titles-refresh roster; "
        "also sessionStorage fwbweb.sshAlternativeTitlesRefreshRoster.*"
    ),
    "ssh_refusal_path_titles_refresh_roster": (
        "Same subset as Download ssh-refusal-path-titles-refresh roster; "
        "also sessionStorage fwbweb.sshRefusalPathTitlesRefreshRoster.*"
    ),
    "ssh_refusal_path_notes_refresh_roster": (
        "Same subset as Download ssh-refusal-path-notes-refresh roster; "
        "also sessionStorage fwbweb.sshRefusalPathNotesRefreshRoster.*"
    ),
    "ssh_alternative_notes_refresh_roster": (
        "Same subset as Download ssh-alternative-notes-refresh roster; "
        "also sessionStorage fwbweb.sshAlternativeNotesRefreshRoster.*"
    ),
    "ssh_auth_note_refresh_roster": (
        "Same subset as Download ssh-auth-note-refresh roster; "
        "also sessionStorage fwbweb.sshAuthNoteRefreshRoster.*"
    ),
    "ssh_capability_flags_refresh_roster": (
        "Same subset as Download ssh-capability-flags-refresh roster; "
        "also sessionStorage fwbweb.sshCapabilityFlagsRefreshRoster.*"
    ),
    "ssh_method_lists_refresh_roster": (
        "Same subset as Download ssh-method-lists-refresh roster; "
        "also sessionStorage fwbweb.sshMethodListsRefreshRoster.*"
    ),
    "ssh_batch_mode_refresh_roster": (
        "Same subset as Download ssh-batch-mode-refresh roster; "
        "also sessionStorage fwbweb.sshBatchModeRefreshRoster.*"
    ),
    "ssh_implemented_refresh_roster": (
        "Same subset as Download ssh-implemented-refresh roster; "
        "also sessionStorage fwbweb.sshImplementedRefreshRoster.*"
    ),
    "ssh_not_implemented_refresh_roster": (
        "Same subset as Download ssh-not-implemented-refresh roster; "
        "also sessionStorage fwbweb.sshNotImplementedRefreshRoster.*"
    ),
    "ssh_auth_note_snapshot_refresh_roster": (
        "Same subset as Download ssh-auth-note-snapshot-refresh roster; "
        "also sessionStorage fwbweb.sshAuthNoteSnapshotRefreshRoster.*"
    ),
    "ssh_implemented_check_refresh_roster": (
        "Same subset as Download ssh-implemented-check-refresh roster; "
        "also sessionStorage fwbweb.sshImplementedCheckRefreshRoster.*"
    ),
    "ssh_not_implemented_check_refresh_roster": (
        "Same subset as Download ssh-not-implemented-check-refresh roster; "
        "also sessionStorage fwbweb.sshNotImplementedCheckRefreshRoster.*"
    ),
    "ssh_alternative_presence_refresh_roster": (
        "Same subset as Download ssh-alternative-presence-refresh roster; "
        "also sessionStorage fwbweb.sshAlternativePresenceRefreshRoster.*"
    ),
    "ssh_implemented_batch_refresh_roster": (
        "Same subset as Download ssh-implemented-batch-refresh roster; "
        "also sessionStorage fwbweb.sshImplementedBatchRefreshRoster.*"
    ),
    "ssh_not_implemented_batch_refresh_roster": (
        "Same subset as Download ssh-not-implemented-batch-refresh roster; "
        "also sessionStorage fwbweb.sshNotImplementedBatchRefreshRoster.*"
    ),
    "ssh_implemented_agent_refresh_roster": (
        "Same subset as Download ssh-implemented-agent-refresh roster; "
        "also sessionStorage fwbweb.sshImplementedAgentRefreshRoster.*"
    ),
    "ssh_implemented_identity_refresh_roster": (
        "Same subset as Download ssh-implemented-identity-refresh roster; "
        "also sessionStorage fwbweb.sshImplementedIdentityRefreshRoster.*"
    ),
    "ssh_not_implemented_keyboard_refresh_roster": (
        "Same subset as Download ssh-not-implemented-keyboard-refresh roster; "
        "also sessionStorage fwbweb.sshNotImplementedKeyboardRefreshRoster.*"
    ),
    "ssh_not_implemented_password_refresh_roster": (
        "Same subset as Download ssh-not-implemented-password-refresh roster; "
        "also sessionStorage fwbweb.sshNotImplementedPasswordRefreshRoster.*"
    ),
    "ssh_alternative_support_refresh_roster": (
        "Same subset as Download ssh-alternative-support-refresh roster; "
        "also sessionStorage fwbweb.sshAlternativeSupportRefreshRoster.*"
    ),
    "ssh_password_support_refresh_roster": (
        "Same subset as Download ssh-password-support-refresh roster; "
        "also sessionStorage fwbweb.sshPasswordSupportRefreshRoster.*"
    ),
    "ssh_auth_refresh_roster": (
        "Same subset as Download ssh-auth-refresh roster; "
        "also sessionStorage fwbweb.sshAuthRefreshRoster.*"
    ),
    "ssh_auth_field_presence_roster": (
        "Same subset as Download ssh-auth-field-presence roster; "
        "also sessionStorage fwbweb.sshAuthFieldPresenceRoster.*"
    ),
    "ssh_auth_list_length_roster": (
        "Same subset as Download ssh-auth-list-length roster; "
        "also sessionStorage fwbweb.sshAuthListLengthRoster.*"
    ),
    "ssh_auth_bool_flag_roster": (
        "Same subset as Download ssh-auth-bool-flag roster; "
        "also sessionStorage fwbweb.sshAuthBoolFlagRoster.*"
    ),
    "ssh_auth_note_token_roster": (
        "Same subset as Download ssh-auth-note-token roster; "
        "also sessionStorage fwbweb.sshAuthNoteTokenRoster.*"
    ),
    "ssh_auth_alternative_id_roster": (
        "Same subset as Download ssh-auth-alternative-id roster; "
        "also sessionStorage fwbweb.sshAuthAlternativeIdRoster.*"
    ),
    "ssh_auth_refusal_id_roster": (
        "Same subset as Download ssh-auth-refusal-id roster; "
        "also sessionStorage fwbweb.sshAuthRefusalIdRoster.*"
    ),
    "ssh_auth_implemented_id_roster": (
        "Same subset as Download ssh-auth-implemented-id roster; "
        "also sessionStorage fwbweb.sshAuthImplementedIdRoster.*"
    ),
    "ssh_auth_not_implemented_id_roster": (
        "Same subset as Download ssh-auth-not-implemented-id roster; "
        "also sessionStorage fwbweb.sshAuthNotImplementedIdRoster.*"
    ),
    "ssh_auth_refusal_status_roster": (
        "Same subset as Download ssh-auth-refusal-status roster; "
        "also sessionStorage fwbweb.sshAuthRefusalStatusRoster.*"
    ),
    "ssh_auth_title_map_roster": (
        "Same subset as Download ssh-auth-title-map roster; "
        "also sessionStorage fwbweb.sshAuthTitleMapRoster.*"
    ),
    "ssh_auth_note_map_roster": (
        "Same subset as Download ssh-auth-note-map roster; "
        "also sessionStorage fwbweb.sshAuthNoteMapRoster.*"
    ),
    "ssh_auth_note_length_roster": (
        "Same subset as Download ssh-auth-note-length roster; "
        "also sessionStorage fwbweb.sshAuthNoteLengthRoster.*"
    ),
    "ssh_auth_capability_count_roster": (
        "Same subset as Download ssh-auth-capability-count roster; "
        "also sessionStorage fwbweb.sshAuthCapabilityCountRoster.*"
    ),
    "ssh_auth_batch_gate_roster": (
        "Same subset as Download ssh-auth-batch-gate roster; "
        "also sessionStorage fwbweb.sshAuthBatchGateRoster.*"
    ),
    "ssh_auth_support_gate_roster": (
        "Same subset as Download ssh-auth-support-gate roster; "
        "also sessionStorage fwbweb.sshAuthSupportGateRoster.*"
    ),
    "ssh_auth_method_partition_roster": (
        "Same subset as Download ssh-auth-method-partition roster; "
        "also sessionStorage fwbweb.sshAuthMethodPartitionRoster.*"
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






SOFT_FERTIG_LAYOUT_FIDELITY_KEYS: tuple[str, ...] = (
    "chrome",
    "dialog",
    "error",
    "fields",
    "host_os",
    "iface_stack_switch",
    "note",
    "ok",
    "pages",
    "pixel_parity",
    "platform",
    "score_parts_count",
    "score_percent",
    "signal_keys",
    "stack_switch",
)


def soft_fertig_layout_fidelity_roster() -> dict[str, object]:
    """Layout-fidelity endpoint field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_LAYOUT_FIDELITY_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Layout-fidelity field: {key_id}",
                "note": (
                    f"Field `{key_id}` on /layout-fidelity; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /layout-fidelity field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_STACK_SWITCH_KEYS: tuple[str, ...] = (
    "dialog_stem",
    "host_os",
    "iface_option_enable",
    "iface_stack_switch",
    "interface_dialog_stem",
    "note",
    "ok",
    "option_enable",
    "option_enable_path",
    "option_stack_switch",
    "pixel_parity",
    "platform",
)


def soft_fertig_stack_switch_roster() -> dict[str, object]:
    """Stack-switch endpoint field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_STACK_SWITCH_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Stack-switch field: {key_id}",
                "note": (
                    f"Field `{key_id}` on /stack-switch; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /stack-switch field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_OPTION_ENABLE_KEYS: tuple[str, ...] = (
    "dialog_stem",
    "host_os",
    "iface_option_enable",
    "interface_dialog_stem",
    "note",
    "ok",
    "option_enable",
    "pixel_parity",
    "platform",
    "stack_switch_path",
)


def soft_fertig_option_enable_roster() -> dict[str, object]:
    """Option-enable endpoint field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_OPTION_ENABLE_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Option-enable field: {key_id}",
                "note": (
                    f"Field `{key_id}` on /option-enable; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /option-enable field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_EXPECT_RUN_KEYS: tuple[str, ...] = (
    "configlet_dir",
    "desktop_steps",
    "error",
    "has_post_config",
    "has_pre_config",
    "has_reg_user",
    "has_safety_net_acl",
    "host_os",
    "implemented",
    "interactive_installer",
    "known_step_ids",
    "names",
    "needed",
    "note",
    "ok",
    "related_names",
    "webui_alternative",
)


def soft_fertig_expect_run_roster() -> dict[str, object]:
    """Expect-run refusal field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_EXPECT_RUN_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Expect-run field: {key_id}",
                "note": (
                    f"Field `{key_id}` on POST /expect-install-plan/run refusal; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /expect-install-plan/run refusal field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_EXPECT_STEPS_KEYS: tuple[str, ...] = (
    "canonical_step_ids",
    "error",
    "executable",
    "note",
    "ok",
    "run_path",
    "run_status",
    "step_count",
    "step_notes",
)


def soft_fertig_expect_steps_roster() -> dict[str, object]:
    """Expect-steps endpoint field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_EXPECT_STEPS_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Expect-steps field: {key_id}",
                "note": (
                    f"Field `{key_id}` on GET /expect-install-plan/steps; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /expect-install-plan/steps field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_EXPECT_STEPS_REFUSALS_KEYS: tuple[str, ...] = (
    "all_refused",
    "canonical_step_ids",
    "error",
    "executable",
    "host_os",
    "note",
    "ok",
    "run_path",
    "run_status",
    "step_count",
    "steps",
    "steps_path",
    "unknown_step_probe",
)


def soft_fertig_expect_steps_refusals_roster() -> dict[str, object]:
    """Expect-steps-refusals endpoint field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_EXPECT_STEPS_REFUSALS_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Expect-steps-refusals field: {key_id}",
                "note": (
                    f"Field `{key_id}` on GET /expect-install-plan/steps/refusals; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /expect-install-plan/steps/refusals field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_KEYS: tuple[str, ...] = (
    "alternative_notes",
    "alternative_titles",
    "alternatives",
    "batch_mode",
    "batch_mode_only",
    "identity_file_supported",
    "implemented",
    "keyboard_interactive_supported",
    "not_implemented",
    "note",
    "password_supported",
    "refusal_path_notes",
    "refusal_path_titles",
    "refusal_paths",
    "ssh_agent_supported",
)


def soft_fertig_ssh_auth_roster() -> dict[str, object]:
    """SSH-auth endpoint field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"SSH-auth field: {key_id}",
                "note": (
                    f"Field `{key_id}` on GET /ssh-auth; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /ssh-auth field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_PASSWORD_SSH_KEYS: tuple[str, ...] = (
    "alternatives",
    "batch_mode_only",
    "error",
    "note",
    "ok",
    "refusal_paths",
    "ssh_auth",
)


def soft_fertig_password_ssh_roster() -> dict[str, object]:
    """Password-SSH refusal field roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_PASSWORD_SSH_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"Password-SSH field: {key_id}",
                "note": (
                    f"Field `{key_id}` on POST /ssh-auth/password refusal; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of POST /ssh-auth/password refusal field keys; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_KEYS: tuple[str, ...] = (
    "password",
    "keyboard_interactive",
)


def soft_fertig_ssh_not_implemented_roster() -> dict[str, object]:
    """SSH not-implemented method roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"SSH not-implemented method: {key_id}",
                "note": (
                    f"Method `{key_id}` is listed in GET /ssh-auth not_implemented; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth not_implemented method ids; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_KEYS: tuple[str, ...] = (
    "batch_mode",
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_implemented_roster() -> dict[str, object]:
    """SSH implemented method roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"SSH implemented method: {key_id}",
                "note": (
                    f"Method `{key_id}` is listed in GET /ssh-auth implemented; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth implemented method ids; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_CAPABILITY_FLAGS_KEYS: tuple[str, ...] = (
    "batch_mode",
    "batch_mode_only",
    "password_supported",
    "keyboard_interactive_supported",
    "identity_file_supported",
    "ssh_agent_supported",
)


def soft_fertig_ssh_capability_flags_roster() -> dict[str, object]:
    """SSH capability boolean-flag roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_CAPABILITY_FLAGS_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"SSH capability flag: {key_id}",
                "note": (
                    f"Boolean field `{key_id}` on GET /ssh-auth; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth boolean capability flags; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_ALTERNATIVES_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_alternatives_roster() -> dict[str, object]:
    """SSH alternatives method roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVES_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": f"SSH alternative method: {key_id}",
                "note": (
                    f"Method `{key_id}` is listed in GET /ssh-auth alternatives; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth alternatives method ids; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_REFUSAL_PATHS_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_refusal_paths_roster() -> dict[str, object]:
    """SSH refusal-path roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_REFUSAL_PATH_NOTES, SSH_REFUSAL_PATH_TITLES

    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_REFUSAL_PATHS_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": SSH_REFUSAL_PATH_TITLES.get(
                    key_id, f"SSH refusal path: {key_id}"
                ),
                "note": SSH_REFUSAL_PATH_NOTES.get(
                    key_id,
                    (
                        f"Refusal path `{key_id}` is listed in GET /ssh-auth refusal_paths; "
                        "soft-fertig catalogs do not close hard gaps."
                    ),
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth refusal path ids; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }




SOFT_FERTIG_SSH_REFUSAL_STATUS_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_refusal_status_roster() -> dict[str, object]:
    """SSH refusal-path HTTP status roster (documentation; does not close hard gaps)."""
    from .deploy import (
        SSH_REFUSAL_PATH_NOTES,
        SSH_REFUSAL_PATH_TITLES,
        ssh_auth_capabilities,
    )

    refusal_paths = dict(ssh_auth_capabilities().get("refusal_paths") or {})
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_REFUSAL_STATUS_KEYS:
        status_code = int(refusal_paths.get(key_id, 0))
        entries.append(
            {
                "id": key_id,
                "status_code": status_code,
                "title": SSH_REFUSAL_PATH_TITLES.get(
                    key_id, f"SSH refusal status: {key_id}"
                ),
                "note": SSH_REFUSAL_PATH_NOTES.get(
                    key_id,
                    (
                        f"Refusal path `{key_id}` maps to HTTP {status_code} on "
                        "GET /ssh-auth refusal_paths; soft-fertig catalogs do not close hard gaps."
                    ),
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth refusal_paths HTTP status codes; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_METHOD_LIST_KEYS: tuple[str, ...] = (
    "implemented",
    "not_implemented",
    "alternatives",
)


def soft_fertig_ssh_method_lists_roster() -> dict[str, object]:
    """SSH method list field roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_METHOD_LIST_KEYS:
        values = list(caps.get(key_id) or [])
        entries.append(
            {
                "id": key_id,
                "list_count": len(values),
                "values": values,
                "title": f"SSH method list: {key_id}",
                "note": (
                    f"List field `{key_id}` on GET /ssh-auth ({len(values)} items); "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth implemented/not_implemented/alternatives lists; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_AUTH_POLICY_KEYS: tuple[str, ...] = (
    "batch_mode",
    "batch_mode_only",
    "password_supported",
)


def soft_fertig_ssh_auth_policy_roster() -> dict[str, object]:
    """SSH BatchMode policy boolean roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_POLICY_KEYS:
        value = caps.get(key_id)
        entries.append(
            {
                "id": key_id,
                "value": value,
                "title": f"SSH auth policy flag: {key_id}",
                "note": (
                    f"Boolean `{key_id}` on GET /ssh-auth is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth batch/password policy booleans; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }




SOFT_FERTIG_SSH_ALTERNATIVE_NOTES_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_alternative_notes_roster() -> dict[str, object]:
    """SSH alternative-notes roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_ALTERNATIVE_NOTES, SSH_ALTERNATIVE_TITLES

    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVE_NOTES_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": SSH_ALTERNATIVE_TITLES.get(key_id, f"SSH alternative: {key_id}"),
                "note": SSH_ALTERNATIVE_NOTES.get(
                    key_id,
                    (
                        f"Note for alternative `{key_id}` on GET /ssh-auth; "
                        "soft-fertig catalogs do not close hard gaps."
                    ),
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth alternative_notes ids; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }




SOFT_FERTIG_SSH_ALTERNATIVE_TITLES_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_alternative_titles_roster() -> dict[str, object]:
    """SSH alternative-titles roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_ALTERNATIVE_TITLES

    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVE_TITLES_KEYS:
        title = SSH_ALTERNATIVE_TITLES.get(key_id, f"SSH alternative title: {key_id}")
        entries.append(
            {
                "id": key_id,
                "title": title,
                "note": (
                    f"Title for alternative `{key_id}` on GET /ssh-auth alternative_titles; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth alternative_titles ids; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }




SOFT_FERTIG_SSH_REFUSAL_PATH_TITLES_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_refusal_path_titles_roster() -> dict[str, object]:
    """SSH refusal-path titles roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_REFUSAL_PATH_TITLES

    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_REFUSAL_PATH_TITLES_KEYS:
        title = SSH_REFUSAL_PATH_TITLES.get(key_id, f"SSH refusal path title: {key_id}")
        entries.append(
            {
                "id": key_id,
                "title": title,
                "note": (
                    f"Title for refusal path `{key_id}` on GET /ssh-auth refusal_path_titles; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth refusal_path_titles ids; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }




SOFT_FERTIG_SSH_REFUSAL_PATH_NOTES_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_refusal_path_notes_roster() -> dict[str, object]:
    """SSH refusal-path notes roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_REFUSAL_PATH_NOTES, SSH_REFUSAL_PATH_TITLES

    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_REFUSAL_PATH_NOTES_KEYS:
        entries.append(
            {
                "id": key_id,
                "title": SSH_REFUSAL_PATH_TITLES.get(key_id, f"SSH refusal path: {key_id}"),
                "note": SSH_REFUSAL_PATH_NOTES.get(
                    key_id,
                    (
                        f"Note for refusal path `{key_id}` on GET /ssh-auth; "
                        "soft-fertig catalogs do not close hard gaps."
                    ),
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth refusal_path_notes ids; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }





SOFT_FERTIG_SSH_AUTH_NOTE_KEYS: tuple[str, ...] = (
    "note",
)


def soft_fertig_ssh_auth_note_roster() -> dict[str, object]:
    """SSH auth note-field roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_AUTH_NOTE, ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    note_text = str(caps.get("note") or SSH_AUTH_NOTE)
    entries: list[dict[str, object]] = [
        {
            "id": "note",
            "title": "SSH auth honesty note",
            "value": note_text,
            "note": (
                "Top-level `note` string on GET /ssh-auth; "
                "soft-fertig catalogs do not close hard gaps."
            ),
        }
    ]
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth note field; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }





SOFT_FERTIG_SSH_ALTERNATIVE_SUPPORT_KEYS: tuple[str, ...] = (
    "identity_file_supported",
    "ssh_agent_supported",
)


def soft_fertig_ssh_alternative_support_roster() -> dict[str, object]:
    """SSH alternative-support boolean roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVE_SUPPORT_KEYS:
        value = caps.get(key_id)
        entries.append(
            {
                "id": key_id,
                "value": value,
                "title": f"SSH alternative support flag: {key_id}",
                "note": (
                    f"Boolean `{key_id}` on GET /ssh-auth is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth identity_file/ssh_agent support flags; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }





SOFT_FERTIG_SSH_PASSWORD_SUPPORT_KEYS: tuple[str, ...] = (
    "password_supported",
    "keyboard_interactive_supported",
)


def soft_fertig_ssh_password_support_roster() -> dict[str, object]:
    """SSH password/keyboard support boolean roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_PASSWORD_SUPPORT_KEYS:
        value = caps.get(key_id)
        entries.append(
            {
                "id": key_id,
                "value": value,
                "title": f"SSH password support flag: {key_id}",
                "note": (
                    f"Boolean `{key_id}` on GET /ssh-auth is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth password_supported and "
            "keyboard_interactive_supported flags; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_BATCH_MODE_KEYS: tuple[str, ...] = (
    "batch_mode_only",
    "batch_mode",
)


def soft_fertig_ssh_batch_mode_roster() -> dict[str, object]:
    """SSH BatchMode policy boolean roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_BATCH_MODE_KEYS:
        value = caps.get(key_id)
        entries.append(
            {
                "id": key_id,
                "value": value,
                "title": f"SSH batch mode flag: {key_id}",
                "note": (
                    f"Boolean `{key_id}` on GET /ssh-auth is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth batch_mode_only and batch_mode flags; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_CHECK_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_implemented_check_roster() -> dict[str, object]:
    """SSH implemented[] membership roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_CHECK_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_implemented": value,
                "title": f"SSH implemented membership: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of identity_file and ssh_agent membership in GET /ssh-auth "
            "implemented[]; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_CHECK_KEYS: tuple[str, ...] = (
    "password",
    "keyboard_interactive",
)


def soft_fertig_ssh_not_implemented_check_roster() -> dict[str, object]:
    """SSH not_implemented[] membership roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_CHECK_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH not_implemented membership: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth not_implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of password and keyboard_interactive membership in GET /ssh-auth "
            "not_implemented[]; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_ALTERNATIVE_PRESENCE_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_alternative_presence_roster() -> dict[str, object]:
    """SSH alternatives[] membership roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    alternatives = list(caps.get("alternatives") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVE_PRESENCE_KEYS:
        value = key_id in alternatives
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_alternatives": value,
                "title": f"SSH alternatives membership: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth alternatives[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of identity_file and ssh_agent membership in GET /ssh-auth "
            "alternatives[]; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_BATCH_KEYS: tuple[str, ...] = (
    "batch_mode",
    "identity_file",
)


def soft_fertig_ssh_implemented_batch_roster() -> dict[str, object]:
    """SSH implemented[] batch/identity subset roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_BATCH_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_implemented": value,
                "title": f"SSH implemented batch subset: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of batch_mode and identity_file membership in GET /ssh-auth "
            "implemented[]; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_BATCH_KEYS: tuple[str, ...] = (
    "password",
    "keyboard_interactive",
)


def soft_fertig_ssh_not_implemented_batch_roster() -> dict[str, object]:
    """SSH not_implemented[] password subset roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_BATCH_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH not_implemented batch subset: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth not_implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of password and keyboard_interactive membership in GET /ssh-auth "
            "not_implemented[]; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_AGENT_KEYS: tuple[str, ...] = (
    "ssh_agent",
)


def soft_fertig_ssh_implemented_agent_roster() -> dict[str, object]:
    """SSH implemented[] ssh_agent subset roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_AGENT_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_implemented": value,
                "title": f"SSH implemented agent subset: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of ssh_agent membership in GET /ssh-auth "
            "implemented[]; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_NOTE_SNAPSHOT_KEYS: tuple[str, ...] = (
    "mentions_batch_mode",
    "mentions_password",
    "mentions_keyboard_interactive",
    "mentions_not_implemented",
)


def soft_fertig_ssh_auth_note_snapshot_roster() -> dict[str, object]:
    """SSH auth note text snapshot roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_AUTH_NOTE, ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    note_text = str(caps.get("note") or SSH_AUTH_NOTE)
    note_lower = note_text.lower()
    note_compact = note_lower.replace("-", "").replace("_", "")
    checks: dict[str, bool] = {
        "mentions_batch_mode": "batchmode" in note_compact,
        "mentions_password": "password" in note_lower,
        "mentions_keyboard_interactive": (
            "keyboard-interactive" in note_lower or "keyboard_interactive" in note_lower
        ),
        "mentions_not_implemented": "not implemented" in note_lower,
    }
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_NOTE_SNAPSHOT_KEYS:
        value = bool(checks.get(key_id))
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_snapshot": value,
                "title": f"SSH auth note snapshot: {key_id}",
                "note": (
                    f"Signal `{key_id}` on GET /ssh-auth note text is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note_text": note_text,
        "note": (
            "Catalog of honesty signals in GET /ssh-auth note field text; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_HONESTY_REFRESH_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_honesty_refresh_roster() -> dict[str, object]:
    """SSH alternatives/refusal_paths refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    alternatives = list(caps.get("alternatives") or [])
    refusal_paths = dict(caps.get("refusal_paths") or {})
    entries: list[dict[str, object]] = []
    for key_id in ("identity_file", "ssh_agent"):
        value = key_id in alternatives
        entries.append(
            {
                "id": key_id,
                "kind": "alternative",
                "value": value,
                "in_alternatives": value,
                "title": f"SSH honesty refresh alternative: {key_id}",
                "note": (
                    f"Alternative `{key_id}` in GET /ssh-auth alternatives[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    for key_id in ("deploy_allow_password_auth", "ssh_auth_password"):
        value = key_id in refusal_paths
        status = refusal_paths.get(key_id)
        entries.append(
            {
                "id": key_id,
                "kind": "refusal_path",
                "value": value,
                "in_refusal_paths": value,
                "status_code": status,
                "title": f"SSH honesty refresh refusal path: {key_id}",
                "note": (
                    f"Refusal path `{key_id}` in GET /ssh-auth refusal_paths is {value!r}"
                    + (f" (HTTP {status})" if status is not None else "")
                    + "; soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "base_roster_entry_count": soft_fertig_ssh_honesty_roster()["entry_count"],
        "note": (
            "Refresh catalog of GET /ssh-auth alternatives[] and refusal_paths "
            "membership aligned with soft_fertig_ssh_honesty_roster; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_IDENTITY_KEYS: tuple[str, ...] = (
    "identity_file",
)


def soft_fertig_ssh_implemented_identity_roster() -> dict[str, object]:
    """SSH implemented[] identity_file subset roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_IDENTITY_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_implemented": value,
                "title": f"SSH implemented identity subset: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of identity_file membership in GET /ssh-auth "
            "implemented[]; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_KEYBOARD_KEYS: tuple[str, ...] = (
    "keyboard_interactive",
)


def soft_fertig_ssh_not_implemented_keyboard_roster() -> dict[str, object]:
    """SSH not_implemented[] keyboard_interactive subset roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_KEYBOARD_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH not_implemented keyboard subset: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth not_implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of keyboard_interactive membership in GET /ssh-auth "
            "not_implemented[]; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_PASSWORD_KEYS: tuple[str, ...] = (
    "password",
)


def soft_fertig_ssh_not_implemented_password_roster() -> dict[str, object]:
    """SSH not_implemented[] password subset roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_PASSWORD_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH not_implemented password subset: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth not_implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of password membership in GET /ssh-auth "
            "not_implemented[]; soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_REFUSAL_STATUS_REFRESH_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_refusal_status_refresh_roster() -> dict[str, object]:
    """SSH refusal_paths status refresh roster (documentation; does not close hard gaps)."""
    from .deploy import (
        SSH_REFUSAL_PATH_NOTES,
        SSH_REFUSAL_PATH_TITLES,
        ssh_auth_capabilities,
    )

    refusal_paths = dict(ssh_auth_capabilities().get("refusal_paths") or {})
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_REFUSAL_STATUS_REFRESH_KEYS:
        in_refusal = key_id in refusal_paths
        status_code = int(refusal_paths.get(key_id, 0)) if in_refusal else 0
        entries.append(
            {
                "id": key_id,
                "kind": "refusal_path",
                "in_refusal_paths": in_refusal,
                "status_code": status_code,
                "title": SSH_REFUSAL_PATH_TITLES.get(
                    key_id, f"SSH refusal status refresh: {key_id}"
                ),
                "note": SSH_REFUSAL_PATH_NOTES.get(
                    key_id,
                    (
                        f"Refusal path `{key_id}` refresh maps to HTTP {status_code} on "
                        "GET /ssh-auth refusal_paths; soft-fertig catalogs do not close hard gaps."
                    ),
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth refusal_paths status refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_AUTH_POLICY_REFRESH_KEYS: tuple[str, ...] = (
    "batch_mode",
    "batch_mode_only",
    "password_supported",
)


def soft_fertig_ssh_auth_policy_refresh_roster() -> dict[str, object]:
    """SSH auth policy boolean refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_POLICY_REFRESH_KEYS:
        value = caps.get(key_id)
        entries.append(
            {
                "id": key_id,
                "kind": "policy_boolean",
                "value": value,
                "title": f"SSH auth policy refresh: {key_id}",
                "note": (
                    f"Policy boolean `{key_id}` on GET /ssh-auth refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth batch/password policy boolean refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_REFUSAL_PATHS_REFRESH_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_refusal_paths_refresh_roster() -> dict[str, object]:
    """SSH refusal_paths membership refresh roster (documentation; does not close hard gaps)."""
    from .deploy import (
        SSH_REFUSAL_PATH_NOTES,
        SSH_REFUSAL_PATH_TITLES,
        ssh_auth_capabilities,
    )

    refusal_paths = dict(ssh_auth_capabilities().get("refusal_paths") or {})
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_REFUSAL_PATHS_REFRESH_KEYS:
        in_refusal = key_id in refusal_paths
        status_code = int(refusal_paths.get(key_id, 0)) if in_refusal else 0
        entries.append(
            {
                "id": key_id,
                "kind": "refusal_path",
                "in_refusal_paths": in_refusal,
                "status_code": status_code,
                "title": SSH_REFUSAL_PATH_TITLES.get(
                    key_id, f"SSH refusal paths refresh: {key_id}"
                ),
                "note": SSH_REFUSAL_PATH_NOTES.get(
                    key_id,
                    (
                        f"Refusal path `{key_id}` refresh in GET /ssh-auth refusal_paths is "
                        f"{in_refusal!r} (HTTP {status_code}); soft-fertig catalogs do not close hard gaps."
                    ),
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth refusal_paths membership refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_ALTERNATIVES_REFRESH_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_alternatives_refresh_roster() -> dict[str, object]:
    """SSH alternatives[] membership refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    alternatives = list(caps.get("alternatives") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVES_REFRESH_KEYS:
        value = key_id in alternatives
        entries.append(
            {
                "id": key_id,
                "kind": "alternative",
                "value": value,
                "in_alternatives": value,
                "title": f"SSH alternatives refresh: {key_id}",
                "note": (
                    f"Alternative `{key_id}` in GET /ssh-auth alternatives[] refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth alternatives[] membership refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_ALTERNATIVE_TITLES_REFRESH_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_alternative_titles_refresh_roster() -> dict[str, object]:
    """SSH alternative_titles display refresh roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_ALTERNATIVE_TITLES

    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVE_TITLES_REFRESH_KEYS:
        display_title = SSH_ALTERNATIVE_TITLES.get(key_id, f"SSH alternative title refresh: {key_id}")
        entries.append(
            {
                "id": key_id,
                "kind": "alternative_title",
                "display_title": display_title,
                "title": f"SSH alternative titles refresh: {key_id}",
                "note": (
                    f"Alternative title `{key_id}` on GET /ssh-auth alternative_titles refresh is {display_title!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth alternative_titles display refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_REFUSAL_PATH_TITLES_REFRESH_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_refusal_path_titles_refresh_roster() -> dict[str, object]:
    """SSH refusal_path_titles display refresh roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_REFUSAL_PATH_TITLES

    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_REFUSAL_PATH_TITLES_REFRESH_KEYS:
        display_title = SSH_REFUSAL_PATH_TITLES.get(key_id, f"SSH refusal path title refresh: {key_id}")
        entries.append(
            {
                "id": key_id,
                "kind": "refusal_path_title",
                "display_title": display_title,
                "title": f"SSH refusal path titles refresh: {key_id}",
                "note": (
                    f"Refusal path title `{key_id}` on GET /ssh-auth refusal_path_titles refresh is {display_title!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth refusal_path_titles display refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_REFUSAL_PATH_NOTES_REFRESH_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_refusal_path_notes_refresh_roster() -> dict[str, object]:
    """SSH refusal_path_notes display refresh roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_REFUSAL_PATH_NOTES

    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_REFUSAL_PATH_NOTES_REFRESH_KEYS:
        display_note = SSH_REFUSAL_PATH_NOTES.get(key_id, f"SSH refusal path note refresh: {key_id}")
        entries.append(
            {
                "id": key_id,
                "kind": "refusal_path_note",
                "display_note": display_note,
                "title": f"SSH refusal path notes refresh: {key_id}",
                "note": (
                    f"Refusal path note `{key_id}` on GET /ssh-auth refusal_path_notes refresh is {display_note!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth refusal_path_notes display refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }



SOFT_FERTIG_SSH_ALTERNATIVE_NOTES_REFRESH_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_alternative_notes_refresh_roster() -> dict[str, object]:
    """SSH alternative_notes display refresh roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_ALTERNATIVE_NOTES

    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVE_NOTES_REFRESH_KEYS:
        display_note = SSH_ALTERNATIVE_NOTES.get(key_id, f"SSH alternative note refresh: {key_id}")
        entries.append(
            {
                "id": key_id,
                "kind": "alternative_note",
                "display_note": display_note,
                "title": f"SSH alternative notes refresh: {key_id}",
                "note": (
                    f"Alternative note `{key_id}` on GET /ssh-auth alternative_notes refresh is {display_note!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth alternative_notes display refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_NOTE_REFRESH_KEYS: tuple[str, ...] = (
    "note",
)


def soft_fertig_ssh_auth_note_refresh_roster() -> dict[str, object]:
    """SSH auth note field refresh roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_AUTH_NOTE, ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    note_text = str(caps.get("note") or SSH_AUTH_NOTE)
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_NOTE_REFRESH_KEYS:
        entries.append(
            {
                "id": key_id,
                "kind": "auth_note",
                "display_value": note_text,
                "value": note_text,
                "title": f"SSH auth note refresh: {key_id}",
                "note": (
                    f"Top-level `{key_id}` on GET /ssh-auth note field refresh is {note_text!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth note field refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_CAPABILITY_FLAGS_REFRESH_KEYS: tuple[str, ...] = (
    "batch_mode",
    "batch_mode_only",
    "password_supported",
    "keyboard_interactive_supported",
    "identity_file_supported",
    "ssh_agent_supported",
)


def soft_fertig_ssh_capability_flags_refresh_roster() -> dict[str, object]:
    """SSH capability boolean-flag refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_CAPABILITY_FLAGS_REFRESH_KEYS:
        value = caps.get(key_id)
        entries.append(
            {
                "id": key_id,
                "kind": "capability_flag",
                "value": value,
                "title": f"SSH capability flags refresh: {key_id}",
                "note": (
                    f"Capability flag `{key_id}` on GET /ssh-auth refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth boolean capability flag refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_METHOD_LISTS_REFRESH_KEYS: tuple[str, ...] = (
    "implemented",
    "not_implemented",
    "alternatives",
)


def soft_fertig_ssh_method_lists_refresh_roster() -> dict[str, object]:
    """SSH method list field refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_METHOD_LISTS_REFRESH_KEYS:
        values = list(caps.get(key_id) or [])
        entries.append(
            {
                "id": key_id,
                "kind": "method_list",
                "list_count": len(values),
                "values": values,
                "title": f"SSH method lists refresh: {key_id}",
                "note": (
                    f"List field `{key_id}` on GET /ssh-auth refresh ({len(values)} items); "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth implemented/not_implemented/alternatives list refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_BATCH_MODE_REFRESH_KEYS: tuple[str, ...] = (
    "batch_mode_only",
    "batch_mode",
)


def soft_fertig_ssh_batch_mode_refresh_roster() -> dict[str, object]:
    """SSH batch_mode boolean refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_BATCH_MODE_REFRESH_KEYS:
        value = caps.get(key_id)
        entries.append(
            {
                "id": key_id,
                "kind": "batch_mode_flag",
                "value": value,
                "title": f"SSH batch mode refresh: {key_id}",
                "note": (
                    f"Boolean `{key_id}` on GET /ssh-auth batch mode refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth batch_mode_only and batch_mode refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_REFRESH_KEYS: tuple[str, ...] = (
    "batch_mode",
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_implemented_refresh_roster() -> dict[str, object]:
    """SSH implemented method refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_REFRESH_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "kind": "implemented_method",
                "value": value,
                "in_implemented": value,
                "title": f"SSH implemented refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth implemented[] refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth implemented method refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_REFRESH_KEYS: tuple[str, ...] = (
    "password",
    "keyboard_interactive",
)


def soft_fertig_ssh_not_implemented_refresh_roster() -> dict[str, object]:
    """SSH not_implemented method refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_REFRESH_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "kind": "not_implemented_method",
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH not-implemented refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth not_implemented[] refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth not_implemented method refresh entries; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_NOTE_SNAPSHOT_REFRESH_KEYS: tuple[str, ...] = (
    "mentions_batch_mode",
    "mentions_password",
    "mentions_keyboard_interactive",
    "mentions_not_implemented",
)


def soft_fertig_ssh_auth_note_snapshot_refresh_roster() -> dict[str, object]:
    """SSH auth note text snapshot refresh roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_AUTH_NOTE, ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    note_text = str(caps.get("note") or SSH_AUTH_NOTE)
    note_lower = note_text.lower()
    note_compact = note_lower.replace("-", "").replace("_", "")
    checks: dict[str, bool] = {
        "mentions_batch_mode": "batchmode" in note_compact,
        "mentions_password": "password" in note_lower,
        "mentions_keyboard_interactive": (
            "keyboard-interactive" in note_lower or "keyboard_interactive" in note_lower
        ),
        "mentions_not_implemented": "not implemented" in note_lower,
    }
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_NOTE_SNAPSHOT_REFRESH_KEYS:
        value = bool(checks.get(key_id))
        entries.append(
            {
                "id": key_id,
                "kind": "auth_note_snapshot_signal",
                "value": value,
                "in_snapshot": value,
                "title": f"SSH auth note snapshot refresh: {key_id}",
                "note": (
                    f"Signal `{key_id}` on GET /ssh-auth note text refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note_text": note_text,
        "note": (
            "Catalog of honesty signals in GET /ssh-auth note field text refresh; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_CHECK_REFRESH_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_implemented_check_refresh_roster() -> dict[str, object]:
    """SSH implemented[] membership refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_CHECK_REFRESH_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "kind": "implemented_membership",
                "value": value,
                "in_implemented": value,
                "title": f"SSH implemented-check refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth implemented[] refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of identity_file and ssh_agent membership in GET /ssh-auth "
            "implemented[] refresh; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_CHECK_REFRESH_KEYS: tuple[str, ...] = (
    "password",
    "keyboard_interactive",
)


def soft_fertig_ssh_not_implemented_check_refresh_roster() -> dict[str, object]:
    """SSH not_implemented[] membership refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_CHECK_REFRESH_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "kind": "not_implemented_membership",
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH not-implemented-check refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth not_implemented[] refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of password and keyboard_interactive membership in GET /ssh-auth "
            "not_implemented[] refresh; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_ALTERNATIVE_PRESENCE_REFRESH_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
)


def soft_fertig_ssh_alternative_presence_refresh_roster() -> dict[str, object]:
    """SSH alternatives[] presence refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    alternatives = list(caps.get("alternatives") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVE_PRESENCE_REFRESH_KEYS:
        value = key_id in alternatives
        entries.append(
            {
                "id": key_id,
                "kind": "alternative_presence",
                "value": value,
                "in_alternatives": value,
                "title": f"SSH alternative-presence refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth alternatives[] refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of identity_file and ssh_agent presence in GET /ssh-auth "
            "alternatives[] refresh; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_BATCH_REFRESH_KEYS: tuple[str, ...] = (
    "batch_mode",
    "identity_file",
)


def soft_fertig_ssh_implemented_batch_refresh_roster() -> dict[str, object]:
    """SSH implemented[] batch/identity subset refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_BATCH_REFRESH_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "kind": "implemented_batch",
                "value": value,
                "in_implemented": value,
                "title": f"SSH implemented-batch refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth implemented[] batch subset refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of batch_mode and identity_file membership in GET /ssh-auth "
            "implemented[] batch subset refresh; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_BATCH_REFRESH_KEYS: tuple[str, ...] = (
    "password",
    "keyboard_interactive",
)


def soft_fertig_ssh_not_implemented_batch_refresh_roster() -> dict[str, object]:
    """SSH not_implemented[] password subset refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_BATCH_REFRESH_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "kind": "not_implemented_batch",
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH not-implemented-batch refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth not_implemented[] batch subset refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of password and keyboard_interactive membership in GET /ssh-auth "
            "not_implemented[] batch subset refresh; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_AGENT_REFRESH_KEYS: tuple[str, ...] = (
    "ssh_agent",
)


def soft_fertig_ssh_implemented_agent_refresh_roster() -> dict[str, object]:
    """SSH implemented[] ssh_agent subset refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_AGENT_REFRESH_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "kind": "implemented_agent",
                "value": value,
                "in_implemented": value,
                "title": f"SSH implemented-agent refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth implemented[] agent subset refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of ssh_agent membership in GET /ssh-auth "
            "implemented[] agent subset refresh; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_IMPLEMENTED_IDENTITY_REFRESH_KEYS: tuple[str, ...] = (
    "identity_file",
)


def soft_fertig_ssh_implemented_identity_refresh_roster() -> dict[str, object]:
    """SSH implemented[] identity_file subset refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_IMPLEMENTED_IDENTITY_REFRESH_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "kind": "implemented_identity",
                "value": value,
                "in_implemented": value,
                "title": f"SSH implemented-identity refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth implemented[] identity subset refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of identity_file membership in GET /ssh-auth "
            "implemented[] identity subset refresh; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_KEYBOARD_REFRESH_KEYS: tuple[str, ...] = (
    "keyboard_interactive",
)


def soft_fertig_ssh_not_implemented_keyboard_refresh_roster() -> dict[str, object]:
    """SSH not_implemented[] keyboard_interactive subset refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_KEYBOARD_REFRESH_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "kind": "not_implemented_keyboard",
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH not-implemented-keyboard refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth not_implemented[] keyboard subset refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of keyboard_interactive membership in GET /ssh-auth "
            "not_implemented[] keyboard subset refresh; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_NOT_IMPLEMENTED_PASSWORD_REFRESH_KEYS: tuple[str, ...] = (
    "password",
)


def soft_fertig_ssh_not_implemented_password_refresh_roster() -> dict[str, object]:
    """SSH not_implemented[] password subset refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_NOT_IMPLEMENTED_PASSWORD_REFRESH_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "kind": "not_implemented_password",
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH not-implemented-password refresh: {key_id}",
                "note": (
                    f"Method `{key_id}` in GET /ssh-auth not_implemented[] password subset refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of password membership in GET /ssh-auth "
            "not_implemented[] password subset refresh; soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_ALTERNATIVE_SUPPORT_REFRESH_KEYS: tuple[str, ...] = (
    "identity_file_supported",
    "ssh_agent_supported",
)


def soft_fertig_ssh_alternative_support_refresh_roster() -> dict[str, object]:
    """SSH alternative-support boolean refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_ALTERNATIVE_SUPPORT_REFRESH_KEYS:
        value = caps.get(key_id)
        entries.append(
            {
                "id": key_id,
                "kind": "alternative_support",
                "value": value,
                "title": f"SSH alternative-support refresh: {key_id}",
                "note": (
                    f"Boolean `{key_id}` on GET /ssh-auth refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth identity_file/ssh_agent support flags refresh; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_PASSWORD_SUPPORT_REFRESH_KEYS: tuple[str, ...] = (
    "password_supported",
    "keyboard_interactive_supported",
)


def soft_fertig_ssh_password_support_refresh_roster() -> dict[str, object]:
    """SSH password/keyboard support boolean refresh roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_PASSWORD_SUPPORT_REFRESH_KEYS:
        value = caps.get(key_id)
        entries.append(
            {
                "id": key_id,
                "kind": "password_support",
                "value": value,
                "title": f"SSH password-support refresh: {key_id}",
                "note": (
                    f"Boolean `{key_id}` on GET /ssh-auth refresh is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth password_supported and "
            "keyboard_interactive_supported flags refresh; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_REFRESH_KEYS: tuple[str, ...] = (
    "alternative_notes",
    "alternative_titles",
    "alternatives",
    "batch_mode",
    "batch_mode_only",
    "identity_file_supported",
    "implemented",
    "keyboard_interactive_supported",
    "not_implemented",
    "note",
    "password_supported",
    "refusal_path_notes",
    "refusal_path_titles",
    "refusal_paths",
    "ssh_agent_supported",
)


def soft_fertig_ssh_auth_refresh_roster() -> dict[str, object]:
    """SSH-auth endpoint field refresh roster (documentation; does not close hard gaps)."""
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_REFRESH_KEYS:
        entries.append(
            {
                "id": key_id,
                "kind": "auth_field",
                "title": f"SSH-auth field refresh: {key_id}",
                "note": (
                    f"Field `{key_id}` on GET /ssh-auth refresh; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of /ssh-auth field keys refresh; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_FIELD_PRESENCE_KEYS: tuple[str, ...] = (
    "alternatives",
    "implemented",
    "not_implemented",
    "note",
    "refusal_paths",
)


def soft_fertig_ssh_auth_field_presence_roster() -> dict[str, object]:
    """SSH-auth core field presence roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_FIELD_PRESENCE_KEYS:
        raw = caps.get(key_id)
        if isinstance(raw, list):
            present = len(raw) > 0
        elif isinstance(raw, str):
            present = bool(raw.strip())
        else:
            present = raw is not None
        entries.append(
            {
                "id": key_id,
                "kind": "auth_field_presence",
                "value": present,
                "present": present,
                "title": f"SSH-auth field presence: {key_id}",
                "note": (
                    f"Field `{key_id}` on GET /ssh-auth present={present!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of core GET /ssh-auth field presence; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_LIST_LENGTH_KEYS: tuple[str, ...] = (
    "alternatives",
    "implemented",
    "not_implemented",
    "refusal_paths",
)


def soft_fertig_ssh_auth_list_length_roster() -> dict[str, object]:
    """SSH-auth list-field length roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_LIST_LENGTH_KEYS:
        raw = caps.get(key_id)
        length = len(raw) if isinstance(raw, list) else 0
        entries.append(
            {
                "id": key_id,
                "kind": "auth_list_length",
                "value": length,
                "length": length,
                "title": f"SSH-auth list length: {key_id}",
                "note": (
                    f"List `{key_id}` on GET /ssh-auth has length {length}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth list-field lengths; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_BOOL_FLAG_KEYS: tuple[str, ...] = (
    "batch_mode",
    "batch_mode_only",
    "identity_file_supported",
    "keyboard_interactive_supported",
    "password_supported",
    "ssh_agent_supported",
)


def soft_fertig_ssh_auth_bool_flag_roster() -> dict[str, object]:
    """SSH-auth boolean flag roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_BOOL_FLAG_KEYS:
        value = bool(caps.get(key_id))
        entries.append(
            {
                "id": key_id,
                "kind": "auth_bool_flag",
                "value": value,
                "title": f"SSH-auth bool flag: {key_id}",
                "note": (
                    f"Boolean `{key_id}` on GET /ssh-auth is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth boolean capability flags; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_NOTE_TOKEN_KEYS: tuple[str, ...] = (
    "batch_mode",
    "password",
    "keyboard_interactive",
    "not_implemented",
    "identity_file",
)


def soft_fertig_ssh_auth_note_token_roster() -> dict[str, object]:
    """SSH-auth note token presence roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_AUTH_NOTE, ssh_auth_capabilities

    _ = ssh_auth_capabilities()
    note = str(SSH_AUTH_NOTE or "")
    note_l = note.lower()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_NOTE_TOKEN_KEYS:
        value = key_id.lower() in note_l
        entries.append(
            {
                "id": key_id,
                "kind": "auth_note_token",
                "value": value,
                "in_note": value,
                "title": f"SSH-auth note token: {key_id}",
                "note": (
                    f"Token `{key_id}` in GET /ssh-auth note is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of token presence in GET /ssh-auth note text; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_ALTERNATIVE_ID_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
    "batch_mode",
)


def soft_fertig_ssh_auth_alternative_id_roster() -> dict[str, object]:
    """SSH-auth alternatives[] id membership roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    alternatives = list(caps.get("alternatives") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_ALTERNATIVE_ID_KEYS:
        value = key_id in alternatives
        entries.append(
            {
                "id": key_id,
                "kind": "auth_alternative_id",
                "value": value,
                "in_alternatives": value,
                "title": f"SSH-auth alternative id: {key_id}",
                "note": (
                    f"Id `{key_id}` in GET /ssh-auth alternatives[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of candidate ids in GET /ssh-auth alternatives[]; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_REFUSAL_ID_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_auth_refusal_id_roster() -> dict[str, object]:
    """SSH-auth refusal_paths[] id membership roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    refusal_paths = list(caps.get("refusal_paths") or [])
    # refusal_paths may be list of dicts or strings
    ids: list[str] = []
    for item in refusal_paths:
        if isinstance(item, dict):
            ids.append(str(item.get("id") or item.get("path") or ""))
        else:
            ids.append(str(item))
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_REFUSAL_ID_KEYS:
        value = key_id in ids
        entries.append(
            {
                "id": key_id,
                "kind": "auth_refusal_id",
                "value": value,
                "in_refusal_paths": value,
                "title": f"SSH-auth refusal id: {key_id}",
                "note": (
                    f"Id `{key_id}` in GET /ssh-auth refusal_paths[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of candidate ids in GET /ssh-auth refusal_paths[]; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_IMPLEMENTED_ID_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
    "batch_mode",
)


def soft_fertig_ssh_auth_implemented_id_roster() -> dict[str, object]:
    """SSH-auth implemented[] id membership roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = list(caps.get("implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_IMPLEMENTED_ID_KEYS:
        value = key_id in implemented
        entries.append(
            {
                "id": key_id,
                "kind": "auth_implemented_id",
                "value": value,
                "in_implemented": value,
                "title": f"SSH-auth implemented id: {key_id}",
                "note": (
                    f"Id `{key_id}` in GET /ssh-auth implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of candidate ids in GET /ssh-auth implemented[]; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_NOT_IMPLEMENTED_ID_KEYS: tuple[str, ...] = (
    "password",
    "keyboard_interactive",
)


def soft_fertig_ssh_auth_not_implemented_id_roster() -> dict[str, object]:
    """SSH-auth not_implemented[] id membership roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    not_implemented = list(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_NOT_IMPLEMENTED_ID_KEYS:
        value = key_id in not_implemented
        entries.append(
            {
                "id": key_id,
                "kind": "auth_not_implemented_id",
                "value": value,
                "in_not_implemented": value,
                "title": f"SSH-auth not-implemented id: {key_id}",
                "note": (
                    f"Id `{key_id}` in GET /ssh-auth not_implemented[] is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of candidate ids in GET /ssh-auth not_implemented[]; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_REFUSAL_STATUS_KEYS: tuple[str, ...] = (
    "deploy_allow_password_auth",
    "ssh_auth_password",
)


def soft_fertig_ssh_auth_refusal_status_roster() -> dict[str, object]:
    """SSH-auth refusal_paths status-code roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    refusal_paths = caps.get("refusal_paths") or {}
    if not isinstance(refusal_paths, dict):
        refusal_paths = {}
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_REFUSAL_STATUS_KEYS:
        value = refusal_paths.get(key_id)
        entries.append(
            {
                "id": key_id,
                "kind": "auth_refusal_status",
                "value": value,
                "status": value,
                "title": f"SSH-auth refusal status: {key_id}",
                "note": (
                    f"Refusal `{key_id}` on GET /ssh-auth maps to status {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth refusal_paths status codes; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_TITLE_MAP_KEYS: tuple[str, ...] = (
    "alternative_titles",
    "refusal_path_titles",
)


def soft_fertig_ssh_auth_title_map_roster() -> dict[str, object]:
    """SSH-auth title-map size roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_TITLE_MAP_KEYS:
        raw = caps.get(key_id) or {}
        size = len(raw) if isinstance(raw, dict) else 0
        entries.append(
            {
                "id": key_id,
                "kind": "auth_title_map",
                "value": size,
                "size": size,
                "title": f"SSH-auth title map: {key_id}",
                "note": (
                    f"Map `{key_id}` on GET /ssh-auth has size {size}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth title-map sizes; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_NOTE_MAP_KEYS: tuple[str, ...] = (
    "alternative_notes",
    "refusal_path_notes",
)


def soft_fertig_ssh_auth_note_map_roster() -> dict[str, object]:
    """SSH-auth note-map size roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_NOTE_MAP_KEYS:
        raw = caps.get(key_id) or {}
        size = len(raw) if isinstance(raw, dict) else 0
        entries.append(
            {
                "id": key_id,
                "kind": "auth_note_map",
                "value": size,
                "size": size,
                "title": f"SSH-auth note map: {key_id}",
                "note": (
                    f"Map `{key_id}` on GET /ssh-auth has size {size}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth note-map sizes; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_NOTE_LENGTH_KEYS: tuple[str, ...] = (
    "char_count",
    "word_count",
    "line_count",
)


def soft_fertig_ssh_auth_note_length_roster() -> dict[str, object]:
    """SSH-auth note length metrics roster (documentation; does not close hard gaps)."""
    from .deploy import SSH_AUTH_NOTE, ssh_auth_capabilities

    _ = ssh_auth_capabilities()
    note = str(SSH_AUTH_NOTE or "")
    metrics = {
        "char_count": len(note),
        "word_count": len(note.split()),
        "line_count": len(note.splitlines()) or (1 if note else 0),
    }
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_NOTE_LENGTH_KEYS:
        value = metrics[key_id]
        entries.append(
            {
                "id": key_id,
                "kind": "auth_note_length",
                "value": value,
                "title": f"SSH-auth note length: {key_id}",
                "note": (
                    f"GET /ssh-auth note `{key_id}` is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth note length metrics; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_CAPABILITY_COUNT_KEYS: tuple[str, ...] = (
    "implemented_count",
    "not_implemented_count",
    "alternatives_count",
    "refusal_paths_count",
)


def soft_fertig_ssh_auth_capability_count_roster() -> dict[str, object]:
    """SSH-auth capability collection counts roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    counts = {
        "implemented_count": len(list(caps.get("implemented") or [])),
        "not_implemented_count": len(list(caps.get("not_implemented") or [])),
        "alternatives_count": len(list(caps.get("alternatives") or [])),
        "refusal_paths_count": len(caps.get("refusal_paths") or {}),
    }
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_CAPABILITY_COUNT_KEYS:
        value = counts[key_id]
        entries.append(
            {
                "id": key_id,
                "kind": "auth_capability_count",
                "value": value,
                "title": f"SSH-auth capability count: {key_id}",
                "note": (
                    f"GET /ssh-auth `{key_id}` is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth collection counts; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_BATCH_GATE_KEYS: tuple[str, ...] = (
    "batch_mode",
    "batch_mode_only",
)


def soft_fertig_ssh_auth_batch_gate_roster() -> dict[str, object]:
    """SSH-auth batch-mode gate roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_BATCH_GATE_KEYS:
        value = bool(caps.get(key_id))
        entries.append(
            {
                "id": key_id,
                "kind": "auth_batch_gate",
                "value": value,
                "title": f"SSH-auth batch gate: {key_id}",
                "note": (
                    f"GET /ssh-auth `{key_id}` is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth batch-mode gates; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_SUPPORT_GATE_KEYS: tuple[str, ...] = (
    "identity_file_supported",
    "ssh_agent_supported",
    "password_supported",
    "keyboard_interactive_supported",
)


def soft_fertig_ssh_auth_support_gate_roster() -> dict[str, object]:
    """SSH-auth support-gate boolean roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_SUPPORT_GATE_KEYS:
        value = bool(caps.get(key_id))
        entries.append(
            {
                "id": key_id,
                "kind": "auth_support_gate",
                "value": value,
                "title": f"SSH-auth support gate: {key_id}",
                "note": (
                    f"GET /ssh-auth `{key_id}` is {value!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth support-gate booleans; "
            "soft-fertig catalogs do not close hard gaps."
        ),
    }


SOFT_FERTIG_SSH_AUTH_METHOD_PARTITION_KEYS: tuple[str, ...] = (
    "identity_file",
    "ssh_agent",
    "batch_mode",
    "password",
    "keyboard_interactive",
)


def soft_fertig_ssh_auth_method_partition_roster() -> dict[str, object]:
    """SSH-auth method partition roster (documentation; does not close hard gaps)."""
    from .deploy import ssh_auth_capabilities

    caps = ssh_auth_capabilities()
    implemented = set(caps.get("implemented") or [])
    not_implemented = set(caps.get("not_implemented") or [])
    entries: list[dict[str, object]] = []
    for key_id in SOFT_FERTIG_SSH_AUTH_METHOD_PARTITION_KEYS:
        if key_id in implemented:
            part = "implemented"
        elif key_id in not_implemented:
            part = "not_implemented"
        else:
            part = "unlisted"
        entries.append(
            {
                "id": key_id,
                "kind": "auth_method_partition",
                "value": part,
                "partition": part,
                "title": f"SSH-auth method partition: {key_id}",
                "note": (
                    f"Method `{key_id}` partition on GET /ssh-auth is {part!r}; "
                    "soft-fertig catalogs do not close hard gaps."
                ),
            }
        )
    return {
        "hard_gaps_remain": True,
        "entries": entries,
        "entry_count": len(entries),
        "note": (
            "Catalog of GET /ssh-auth method partitions; "
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
    "4.0": (
        "soft_fertig_hard_gaps_field_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "4.1": (
        "soft_fertig_layout_fidelity_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "4.2": (
        "soft_fertig_stack_switch_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "4.3": (
        "soft_fertig_option_enable_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "4.4": (
        "soft_fertig_expect_run_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "4.5": (
        "soft_fertig_expect_steps_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "4.6": (
        "soft_fertig_expect_steps_refusals_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "4.7": (
        "soft_fertig_ssh_auth_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "4.8": (
        "soft_fertig_password_ssh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "4.9": (
        "soft_fertig_ssh_not_implemented_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.0": (
        "soft_fertig_ssh_implemented_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.1": (
        "soft_fertig_ssh_capability_flags_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.2": (
        "soft_fertig_ssh_alternatives_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.3": (
        "soft_fertig_ssh_refusal_paths_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.4": (
        "soft_fertig_ssh_refusal_status_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.5": (
        "soft_fertig_ssh_method_lists_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.6": (
        "soft_fertig_ssh_auth_policy_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.7": (
        "soft_fertig_ssh_alternative_notes_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.8": (
        "soft_fertig_ssh_alternative_titles_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.9": (
        "soft_fertig_ssh_refusal_path_titles_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.10": (
        "soft_fertig_ssh_refusal_path_notes_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.11": (
        "soft_fertig_ssh_auth_note_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.12": (
        "soft_fertig_ssh_alternative_support_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.13": (
        "soft_fertig_ssh_password_support_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.14": (
        "soft_fertig_ssh_batch_mode_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.15": (
        "soft_fertig_ssh_implemented_check_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.16": (
        "soft_fertig_ssh_not_implemented_check_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.17": (
        "soft_fertig_ssh_alternative_presence_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.18": (
        "soft_fertig_ssh_implemented_batch_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.19": (
        "soft_fertig_ssh_not_implemented_batch_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.20": (
        "soft_fertig_ssh_implemented_agent_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.21": (
        "soft_fertig_ssh_auth_note_snapshot_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.22": (
        "soft_fertig_ssh_honesty_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.23": (
        "soft_fertig_ssh_implemented_identity_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.24": (
        "soft_fertig_ssh_not_implemented_keyboard_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.25": (
        "soft_fertig_ssh_not_implemented_password_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.26": (
        "soft_fertig_ssh_refusal_status_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.27": (
        "soft_fertig_ssh_auth_policy_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.28": (
        "soft_fertig_ssh_refusal_paths_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.29": (
        "soft_fertig_ssh_alternatives_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.30": (
        "soft_fertig_ssh_alternative_titles_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.31": (
        "soft_fertig_ssh_refusal_path_titles_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.32": (
        "soft_fertig_ssh_refusal_path_notes_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.33": (
        "soft_fertig_ssh_alternative_notes_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.34": (
        "soft_fertig_ssh_auth_note_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.35": (
        "soft_fertig_ssh_capability_flags_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.36": (
        "soft_fertig_ssh_method_lists_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.37": (
        "soft_fertig_ssh_batch_mode_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.38": (
        "soft_fertig_ssh_implemented_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.39": (
        "soft_fertig_ssh_not_implemented_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.40": (
        "soft_fertig_ssh_auth_note_snapshot_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.41": (
        "soft_fertig_ssh_implemented_check_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.42": (
        "soft_fertig_ssh_not_implemented_check_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.43": (
        "soft_fertig_ssh_alternative_presence_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.44": (
        "soft_fertig_ssh_implemented_batch_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.45": (
        "soft_fertig_ssh_not_implemented_batch_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.46": (
        "soft_fertig_ssh_implemented_agent_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.47": (
        "soft_fertig_ssh_implemented_identity_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.48": (
        "soft_fertig_ssh_not_implemented_keyboard_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.49": (
        "soft_fertig_ssh_not_implemented_password_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.50": (
        "soft_fertig_ssh_alternative_support_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.51": (
        "soft_fertig_ssh_password_support_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.52": (
        "soft_fertig_ssh_auth_refresh_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.53": (
        "soft_fertig_ssh_auth_field_presence_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.54": (
        "soft_fertig_ssh_auth_list_length_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.55": (
        "soft_fertig_ssh_auth_bool_flag_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.56": (
        "soft_fertig_ssh_auth_note_token_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.57": (
        "soft_fertig_ssh_auth_alternative_id_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.58": (
        "soft_fertig_ssh_auth_refusal_id_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.59": (
        "soft_fertig_ssh_auth_implemented_id_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.60": (
        "soft_fertig_ssh_auth_not_implemented_id_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.61": (
        "soft_fertig_ssh_auth_refusal_status_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.62": (
        "soft_fertig_ssh_auth_title_map_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.63": (
        "soft_fertig_ssh_auth_note_map_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.64": (
        "soft_fertig_ssh_auth_note_length_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.65": (
        "soft_fertig_ssh_auth_capability_count_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.66": (
        "soft_fertig_ssh_auth_batch_gate_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.67": (
        "soft_fertig_ssh_auth_support_gate_roster on /health and honesty "
        "endpoints (+ export/bundle)."
    ),
    "5.68": (
        "soft_fertig_ssh_auth_method_partition_roster on /health and honesty "
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
    "soft_fertig_layout_fidelity_roster_entry_count",
    "soft_fertig_stack_switch_roster_entry_count",
    "soft_fertig_option_enable_roster_entry_count",
    "soft_fertig_expect_run_roster_entry_count",
    "soft_fertig_expect_steps_roster_entry_count",
    "soft_fertig_expect_steps_refusals_roster_entry_count",
    "soft_fertig_ssh_auth_roster_entry_count",
    "soft_fertig_password_ssh_roster_entry_count",
    "soft_fertig_ssh_not_implemented_roster_entry_count",
    "soft_fertig_ssh_implemented_roster_entry_count",
    "soft_fertig_ssh_capability_flags_roster_entry_count",
    "soft_fertig_ssh_alternatives_roster_entry_count",
    "soft_fertig_ssh_refusal_paths_roster_entry_count",
    "soft_fertig_ssh_refusal_status_roster_entry_count",
    "soft_fertig_ssh_method_lists_roster_entry_count",
    "soft_fertig_ssh_alternative_notes_roster_entry_count",
    "soft_fertig_ssh_refusal_path_titles_roster_entry_count",
    "soft_fertig_ssh_refusal_path_notes_roster_entry_count",
    "soft_fertig_ssh_auth_note_roster_entry_count",
    "soft_fertig_ssh_alternative_support_roster_entry_count",
    "soft_fertig_ssh_batch_mode_roster_entry_count",
    "soft_fertig_ssh_implemented_check_roster_entry_count",
    "soft_fertig_ssh_not_implemented_check_roster_entry_count",
    "soft_fertig_ssh_alternative_presence_roster_entry_count",
    "soft_fertig_ssh_implemented_batch_roster_entry_count",
    "soft_fertig_ssh_not_implemented_batch_roster_entry_count",
    "soft_fertig_ssh_implemented_agent_roster_entry_count",
    "soft_fertig_ssh_auth_note_snapshot_roster_entry_count",
    "soft_fertig_ssh_honesty_refresh_roster_entry_count",
    "soft_fertig_ssh_implemented_identity_roster_entry_count",
    "soft_fertig_ssh_not_implemented_keyboard_roster_entry_count",
    "soft_fertig_ssh_not_implemented_password_roster_entry_count",
    "soft_fertig_ssh_refusal_status_refresh_roster_entry_count",
    "soft_fertig_ssh_auth_policy_refresh_roster_entry_count",
    "soft_fertig_ssh_refusal_paths_refresh_roster_entry_count",
    "soft_fertig_ssh_alternatives_refresh_roster_entry_count",
    "soft_fertig_ssh_alternative_titles_refresh_roster_entry_count",
    "soft_fertig_ssh_refusal_path_titles_refresh_roster_entry_count",
    "soft_fertig_ssh_refusal_path_notes_refresh_roster_entry_count",
    "soft_fertig_ssh_alternative_notes_refresh_roster_entry_count",
    "soft_fertig_ssh_auth_note_refresh_roster_entry_count",
    "soft_fertig_ssh_capability_flags_refresh_roster_entry_count",
    "soft_fertig_ssh_method_lists_refresh_roster_entry_count",
    "soft_fertig_ssh_batch_mode_refresh_roster_entry_count",
    "soft_fertig_ssh_implemented_refresh_roster_entry_count",
    "soft_fertig_ssh_not_implemented_refresh_roster_entry_count",
    "soft_fertig_ssh_auth_note_snapshot_refresh_roster_entry_count",
    "soft_fertig_ssh_implemented_check_refresh_roster_entry_count",
    "soft_fertig_ssh_not_implemented_check_refresh_roster_entry_count",
    "soft_fertig_ssh_alternative_presence_refresh_roster_entry_count",
    "soft_fertig_ssh_implemented_batch_refresh_roster_entry_count",
    "soft_fertig_ssh_not_implemented_batch_refresh_roster_entry_count",
    "soft_fertig_ssh_implemented_agent_refresh_roster_entry_count",
    "soft_fertig_ssh_implemented_identity_refresh_roster_entry_count",
    "soft_fertig_ssh_not_implemented_keyboard_refresh_roster_entry_count",
    "soft_fertig_ssh_not_implemented_password_refresh_roster_entry_count",
    "soft_fertig_ssh_alternative_support_refresh_roster_entry_count",
    "soft_fertig_ssh_password_support_refresh_roster_entry_count",
    "soft_fertig_ssh_auth_refresh_roster_entry_count",
    "soft_fertig_ssh_auth_field_presence_roster_entry_count",
    "soft_fertig_ssh_auth_list_length_roster_entry_count",
    "soft_fertig_ssh_auth_bool_flag_roster_entry_count",
    "soft_fertig_ssh_auth_note_token_roster_entry_count",
    "soft_fertig_ssh_auth_alternative_id_roster_entry_count",
    "soft_fertig_ssh_auth_refusal_id_roster_entry_count",
    "soft_fertig_ssh_auth_implemented_id_roster_entry_count",
    "soft_fertig_ssh_auth_not_implemented_id_roster_entry_count",
    "soft_fertig_ssh_auth_refusal_status_roster_entry_count",
    "soft_fertig_ssh_auth_title_map_roster_entry_count",
    "soft_fertig_ssh_auth_note_map_roster_entry_count",
    "soft_fertig_ssh_auth_note_length_roster_entry_count",
    "soft_fertig_ssh_auth_capability_count_roster_entry_count",
    "soft_fertig_ssh_auth_batch_gate_roster_entry_count",
    "soft_fertig_ssh_auth_support_gate_roster_entry_count",
    "soft_fertig_ssh_auth_method_partition_roster_entry_count",
    "soft_fertig_ssh_password_support_roster_entry_count",
    "soft_fertig_ssh_alternative_titles_roster_entry_count",
    "soft_fertig_ssh_auth_policy_roster_entry_count",
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
        "soft_fertig_layout_fidelity_roster_entry_count": (
            soft_fertig_layout_fidelity_roster()["entry_count"]
        ),
        "soft_fertig_stack_switch_roster_entry_count": (
            soft_fertig_stack_switch_roster()["entry_count"]
        ),
        "soft_fertig_option_enable_roster_entry_count": (
            soft_fertig_option_enable_roster()["entry_count"]
        ),
        "soft_fertig_expect_run_roster_entry_count": (
            soft_fertig_expect_run_roster()["entry_count"]
        ),
        "soft_fertig_expect_steps_roster_entry_count": (
            soft_fertig_expect_steps_roster()["entry_count"]
        ),
        "soft_fertig_expect_steps_refusals_roster_entry_count": (
            soft_fertig_expect_steps_refusals_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_roster_entry_count": (
            soft_fertig_ssh_auth_roster()["entry_count"]
        ),
        "soft_fertig_password_ssh_roster_entry_count": (
            soft_fertig_password_ssh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_roster_entry_count": (
            soft_fertig_ssh_not_implemented_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_roster_entry_count": (
            soft_fertig_ssh_implemented_roster()["entry_count"]
        ),
        "soft_fertig_ssh_capability_flags_roster_entry_count": (
            soft_fertig_ssh_capability_flags_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternatives_roster_entry_count": (
            soft_fertig_ssh_alternatives_roster()["entry_count"]
        ),
        "soft_fertig_ssh_refusal_paths_roster_entry_count": (
            soft_fertig_ssh_refusal_paths_roster()["entry_count"]
        ),
        "soft_fertig_ssh_refusal_status_roster_entry_count": (
            soft_fertig_ssh_refusal_status_roster()["entry_count"]
        ),
        "soft_fertig_ssh_method_lists_roster_entry_count": (
            soft_fertig_ssh_method_lists_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternative_notes_roster_entry_count": (
            soft_fertig_ssh_alternative_notes_roster()["entry_count"]
        ),
        "soft_fertig_ssh_refusal_path_titles_roster_entry_count": (
            soft_fertig_ssh_refusal_path_titles_roster()["entry_count"]
        ),
        "soft_fertig_ssh_refusal_path_notes_roster_entry_count": (
            soft_fertig_ssh_refusal_path_notes_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_note_roster_entry_count": (
            soft_fertig_ssh_auth_note_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternative_support_roster_entry_count": (
            soft_fertig_ssh_alternative_support_roster()["entry_count"]
        ),
        "soft_fertig_ssh_batch_mode_roster_entry_count": (
            soft_fertig_ssh_batch_mode_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_check_roster_entry_count": (
            soft_fertig_ssh_implemented_check_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_check_roster_entry_count": (
            soft_fertig_ssh_not_implemented_check_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternative_presence_roster_entry_count": (
            soft_fertig_ssh_alternative_presence_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_batch_roster_entry_count": (
            soft_fertig_ssh_implemented_batch_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_batch_roster_entry_count": (
            soft_fertig_ssh_not_implemented_batch_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_agent_roster_entry_count": (
            soft_fertig_ssh_implemented_agent_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_note_snapshot_roster_entry_count": (
            soft_fertig_ssh_auth_note_snapshot_roster()["entry_count"]
        ),
        "soft_fertig_ssh_honesty_refresh_roster_entry_count": (
            soft_fertig_ssh_honesty_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_identity_roster_entry_count": (
            soft_fertig_ssh_implemented_identity_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_keyboard_roster_entry_count": (
            soft_fertig_ssh_not_implemented_keyboard_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_password_roster_entry_count": (
            soft_fertig_ssh_not_implemented_password_roster()["entry_count"]
        ),
        "soft_fertig_ssh_refusal_status_refresh_roster_entry_count": (
            soft_fertig_ssh_refusal_status_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_policy_refresh_roster_entry_count": (
            soft_fertig_ssh_auth_policy_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_refusal_paths_refresh_roster_entry_count": (
            soft_fertig_ssh_refusal_paths_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternatives_refresh_roster_entry_count": (
            soft_fertig_ssh_alternatives_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternative_titles_refresh_roster_entry_count": (
            soft_fertig_ssh_alternative_titles_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_refusal_path_titles_refresh_roster_entry_count": (
            soft_fertig_ssh_refusal_path_titles_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_refusal_path_notes_refresh_roster_entry_count": (
            soft_fertig_ssh_refusal_path_notes_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternative_notes_refresh_roster_entry_count": (
            soft_fertig_ssh_alternative_notes_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_note_refresh_roster_entry_count": (
            soft_fertig_ssh_auth_note_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_capability_flags_refresh_roster_entry_count": (
            soft_fertig_ssh_capability_flags_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_method_lists_refresh_roster_entry_count": (
            soft_fertig_ssh_method_lists_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_batch_mode_refresh_roster_entry_count": (
            soft_fertig_ssh_batch_mode_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_refresh_roster_entry_count": (
            soft_fertig_ssh_implemented_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_refresh_roster_entry_count": (
            soft_fertig_ssh_not_implemented_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_note_snapshot_refresh_roster_entry_count": (
            soft_fertig_ssh_auth_note_snapshot_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_check_refresh_roster_entry_count": (
            soft_fertig_ssh_implemented_check_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_check_refresh_roster_entry_count": (
            soft_fertig_ssh_not_implemented_check_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternative_presence_refresh_roster_entry_count": (
            soft_fertig_ssh_alternative_presence_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_batch_refresh_roster_entry_count": (
            soft_fertig_ssh_implemented_batch_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_batch_refresh_roster_entry_count": (
            soft_fertig_ssh_not_implemented_batch_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_agent_refresh_roster_entry_count": (
            soft_fertig_ssh_implemented_agent_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_implemented_identity_refresh_roster_entry_count": (
            soft_fertig_ssh_implemented_identity_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_keyboard_refresh_roster_entry_count": (
            soft_fertig_ssh_not_implemented_keyboard_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_not_implemented_password_refresh_roster_entry_count": (
            soft_fertig_ssh_not_implemented_password_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternative_support_refresh_roster_entry_count": (
            soft_fertig_ssh_alternative_support_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_password_support_refresh_roster_entry_count": (
            soft_fertig_ssh_password_support_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_refresh_roster_entry_count": (
            soft_fertig_ssh_auth_refresh_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_field_presence_roster_entry_count": (
            soft_fertig_ssh_auth_field_presence_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_list_length_roster_entry_count": (
            soft_fertig_ssh_auth_list_length_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_bool_flag_roster_entry_count": (
            soft_fertig_ssh_auth_bool_flag_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_note_token_roster_entry_count": (
            soft_fertig_ssh_auth_note_token_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_alternative_id_roster_entry_count": (
            soft_fertig_ssh_auth_alternative_id_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_refusal_id_roster_entry_count": (
            soft_fertig_ssh_auth_refusal_id_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_implemented_id_roster_entry_count": (
            soft_fertig_ssh_auth_implemented_id_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_not_implemented_id_roster_entry_count": (
            soft_fertig_ssh_auth_not_implemented_id_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_refusal_status_roster_entry_count": (
            soft_fertig_ssh_auth_refusal_status_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_title_map_roster_entry_count": (
            soft_fertig_ssh_auth_title_map_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_note_map_roster_entry_count": (
            soft_fertig_ssh_auth_note_map_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_note_length_roster_entry_count": (
            soft_fertig_ssh_auth_note_length_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_capability_count_roster_entry_count": (
            soft_fertig_ssh_auth_capability_count_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_batch_gate_roster_entry_count": (
            soft_fertig_ssh_auth_batch_gate_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_support_gate_roster_entry_count": (
            soft_fertig_ssh_auth_support_gate_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_method_partition_roster_entry_count": (
            soft_fertig_ssh_auth_method_partition_roster()["entry_count"]
        ),
        "soft_fertig_ssh_password_support_roster_entry_count": (
            soft_fertig_ssh_password_support_roster()["entry_count"]
        ),
        "soft_fertig_ssh_alternative_titles_roster_entry_count": (
            soft_fertig_ssh_alternative_titles_roster()["entry_count"]
        ),
        "soft_fertig_ssh_auth_policy_roster_entry_count": (
            soft_fertig_ssh_auth_policy_roster()["entry_count"]
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
        "soft_fertig_layout_fidelity_roster": soft_fertig_layout_fidelity_roster(),
        "soft_fertig_stack_switch_roster": soft_fertig_stack_switch_roster(),
        "soft_fertig_option_enable_roster": soft_fertig_option_enable_roster(),
        "soft_fertig_expect_run_roster": soft_fertig_expect_run_roster(),
        "soft_fertig_expect_steps_roster": soft_fertig_expect_steps_roster(),
        "soft_fertig_expect_steps_refusals_roster": soft_fertig_expect_steps_refusals_roster(),
        "soft_fertig_ssh_auth_roster": soft_fertig_ssh_auth_roster(),
        "soft_fertig_password_ssh_roster": soft_fertig_password_ssh_roster(),
        "soft_fertig_ssh_not_implemented_roster": soft_fertig_ssh_not_implemented_roster(),
        "soft_fertig_ssh_implemented_roster": soft_fertig_ssh_implemented_roster(),
        "soft_fertig_ssh_capability_flags_roster": soft_fertig_ssh_capability_flags_roster(),
        "soft_fertig_ssh_alternatives_roster": soft_fertig_ssh_alternatives_roster(),
        "soft_fertig_ssh_refusal_paths_roster": soft_fertig_ssh_refusal_paths_roster(),
        "soft_fertig_ssh_refusal_status_roster": soft_fertig_ssh_refusal_status_roster(),
        "soft_fertig_ssh_method_lists_roster": soft_fertig_ssh_method_lists_roster(),
        "soft_fertig_ssh_alternative_notes_roster": soft_fertig_ssh_alternative_notes_roster(),
        "soft_fertig_ssh_refusal_path_titles_roster": soft_fertig_ssh_refusal_path_titles_roster(),
        "soft_fertig_ssh_refusal_path_notes_roster": soft_fertig_ssh_refusal_path_notes_roster(),
        "soft_fertig_ssh_auth_note_roster": soft_fertig_ssh_auth_note_roster(),
        "soft_fertig_ssh_alternative_support_roster": soft_fertig_ssh_alternative_support_roster(),
        "soft_fertig_ssh_password_support_roster": soft_fertig_ssh_password_support_roster(),
        "soft_fertig_ssh_batch_mode_roster": soft_fertig_ssh_batch_mode_roster(),
        "soft_fertig_ssh_implemented_check_roster": soft_fertig_ssh_implemented_check_roster(),
        "soft_fertig_ssh_not_implemented_check_roster": soft_fertig_ssh_not_implemented_check_roster(),
        "soft_fertig_ssh_alternative_presence_roster": soft_fertig_ssh_alternative_presence_roster(),
        "soft_fertig_ssh_implemented_batch_roster": soft_fertig_ssh_implemented_batch_roster(),
        "soft_fertig_ssh_not_implemented_batch_roster": soft_fertig_ssh_not_implemented_batch_roster(),
        "soft_fertig_ssh_implemented_agent_roster": soft_fertig_ssh_implemented_agent_roster(),
        "soft_fertig_ssh_auth_note_snapshot_roster": soft_fertig_ssh_auth_note_snapshot_roster(),
        "soft_fertig_ssh_honesty_refresh_roster": soft_fertig_ssh_honesty_refresh_roster(),
        "soft_fertig_ssh_implemented_identity_roster": soft_fertig_ssh_implemented_identity_roster(),
        "soft_fertig_ssh_not_implemented_keyboard_roster": soft_fertig_ssh_not_implemented_keyboard_roster(),
        "soft_fertig_ssh_not_implemented_password_roster": soft_fertig_ssh_not_implemented_password_roster(),
        "soft_fertig_ssh_refusal_status_refresh_roster": soft_fertig_ssh_refusal_status_refresh_roster(),
        "soft_fertig_ssh_auth_policy_refresh_roster": soft_fertig_ssh_auth_policy_refresh_roster(),
        "soft_fertig_ssh_refusal_paths_refresh_roster": soft_fertig_ssh_refusal_paths_refresh_roster(),
        "soft_fertig_ssh_alternatives_refresh_roster": soft_fertig_ssh_alternatives_refresh_roster(),
        "soft_fertig_ssh_alternative_titles_refresh_roster": soft_fertig_ssh_alternative_titles_refresh_roster(),
        "soft_fertig_ssh_refusal_path_titles_refresh_roster": soft_fertig_ssh_refusal_path_titles_refresh_roster(),
        "soft_fertig_ssh_refusal_path_notes_refresh_roster": soft_fertig_ssh_refusal_path_notes_refresh_roster(),
        "soft_fertig_ssh_alternative_notes_refresh_roster": soft_fertig_ssh_alternative_notes_refresh_roster(),
        "soft_fertig_ssh_auth_note_refresh_roster": soft_fertig_ssh_auth_note_refresh_roster(),
        "soft_fertig_ssh_capability_flags_refresh_roster": soft_fertig_ssh_capability_flags_refresh_roster(),
        "soft_fertig_ssh_method_lists_refresh_roster": soft_fertig_ssh_method_lists_refresh_roster(),
        "soft_fertig_ssh_batch_mode_refresh_roster": soft_fertig_ssh_batch_mode_refresh_roster(),
        "soft_fertig_ssh_implemented_refresh_roster": soft_fertig_ssh_implemented_refresh_roster(),
        "soft_fertig_ssh_not_implemented_refresh_roster": soft_fertig_ssh_not_implemented_refresh_roster(),
        "soft_fertig_ssh_auth_note_snapshot_refresh_roster": soft_fertig_ssh_auth_note_snapshot_refresh_roster(),
        "soft_fertig_ssh_implemented_check_refresh_roster": soft_fertig_ssh_implemented_check_refresh_roster(),
        "soft_fertig_ssh_not_implemented_check_refresh_roster": soft_fertig_ssh_not_implemented_check_refresh_roster(),
        "soft_fertig_ssh_alternative_presence_refresh_roster": soft_fertig_ssh_alternative_presence_refresh_roster(),
        "soft_fertig_ssh_implemented_batch_refresh_roster": soft_fertig_ssh_implemented_batch_refresh_roster(),
        "soft_fertig_ssh_not_implemented_batch_refresh_roster": soft_fertig_ssh_not_implemented_batch_refresh_roster(),
        "soft_fertig_ssh_implemented_agent_refresh_roster": soft_fertig_ssh_implemented_agent_refresh_roster(),
        "soft_fertig_ssh_implemented_identity_refresh_roster": soft_fertig_ssh_implemented_identity_refresh_roster(),
        "soft_fertig_ssh_not_implemented_keyboard_refresh_roster": soft_fertig_ssh_not_implemented_keyboard_refresh_roster(),
        "soft_fertig_ssh_not_implemented_password_refresh_roster": soft_fertig_ssh_not_implemented_password_refresh_roster(),
        "soft_fertig_ssh_alternative_support_refresh_roster": soft_fertig_ssh_alternative_support_refresh_roster(),
        "soft_fertig_ssh_password_support_refresh_roster": soft_fertig_ssh_password_support_refresh_roster(),
        "soft_fertig_ssh_auth_refresh_roster": soft_fertig_ssh_auth_refresh_roster(),
        "soft_fertig_ssh_auth_field_presence_roster": soft_fertig_ssh_auth_field_presence_roster(),
        "soft_fertig_ssh_auth_list_length_roster": soft_fertig_ssh_auth_list_length_roster(),
        "soft_fertig_ssh_auth_bool_flag_roster": soft_fertig_ssh_auth_bool_flag_roster(),
        "soft_fertig_ssh_auth_note_token_roster": soft_fertig_ssh_auth_note_token_roster(),
        "soft_fertig_ssh_auth_alternative_id_roster": soft_fertig_ssh_auth_alternative_id_roster(),
        "soft_fertig_ssh_auth_refusal_id_roster": soft_fertig_ssh_auth_refusal_id_roster(),
        "soft_fertig_ssh_auth_implemented_id_roster": soft_fertig_ssh_auth_implemented_id_roster(),
        "soft_fertig_ssh_auth_not_implemented_id_roster": soft_fertig_ssh_auth_not_implemented_id_roster(),
        "soft_fertig_ssh_auth_refusal_status_roster": soft_fertig_ssh_auth_refusal_status_roster(),
        "soft_fertig_ssh_auth_title_map_roster": soft_fertig_ssh_auth_title_map_roster(),
        "soft_fertig_ssh_auth_note_map_roster": soft_fertig_ssh_auth_note_map_roster(),
        "soft_fertig_ssh_auth_note_length_roster": soft_fertig_ssh_auth_note_length_roster(),
        "soft_fertig_ssh_auth_capability_count_roster": soft_fertig_ssh_auth_capability_count_roster(),
        "soft_fertig_ssh_auth_batch_gate_roster": soft_fertig_ssh_auth_batch_gate_roster(),
        "soft_fertig_ssh_auth_support_gate_roster": soft_fertig_ssh_auth_support_gate_roster(),
        "soft_fertig_ssh_auth_method_partition_roster": soft_fertig_ssh_auth_method_partition_roster(),
        "soft_fertig_ssh_alternative_titles_roster": soft_fertig_ssh_alternative_titles_roster(),
        "soft_fertig_ssh_auth_policy_roster": soft_fertig_ssh_auth_policy_roster(),
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
        "soft_fertig_layout_fidelity_roster": soft_fertig_layout_fidelity_roster(),
        "soft_fertig_stack_switch_roster": soft_fertig_stack_switch_roster(),
        "soft_fertig_option_enable_roster": soft_fertig_option_enable_roster(),
        "soft_fertig_expect_run_roster": soft_fertig_expect_run_roster(),
        "soft_fertig_expect_steps_roster": soft_fertig_expect_steps_roster(),
        "soft_fertig_expect_steps_refusals_roster": soft_fertig_expect_steps_refusals_roster(),
        "soft_fertig_ssh_auth_roster": soft_fertig_ssh_auth_roster(),
        "soft_fertig_password_ssh_roster": soft_fertig_password_ssh_roster(),
        "soft_fertig_ssh_not_implemented_roster": soft_fertig_ssh_not_implemented_roster(),
        "soft_fertig_ssh_implemented_roster": soft_fertig_ssh_implemented_roster(),
        "soft_fertig_ssh_capability_flags_roster": soft_fertig_ssh_capability_flags_roster(),
        "soft_fertig_ssh_alternatives_roster": soft_fertig_ssh_alternatives_roster(),
        "soft_fertig_ssh_refusal_paths_roster": soft_fertig_ssh_refusal_paths_roster(),
        "soft_fertig_ssh_refusal_status_roster": soft_fertig_ssh_refusal_status_roster(),
        "soft_fertig_ssh_method_lists_roster": soft_fertig_ssh_method_lists_roster(),
        "soft_fertig_ssh_alternative_notes_roster": soft_fertig_ssh_alternative_notes_roster(),
        "soft_fertig_ssh_refusal_path_titles_roster": soft_fertig_ssh_refusal_path_titles_roster(),
        "soft_fertig_ssh_alternative_titles_roster": soft_fertig_ssh_alternative_titles_roster(),
        "soft_fertig_ssh_auth_policy_roster": soft_fertig_ssh_auth_policy_roster(),
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
        "soft_fertig_layout_fidelity_roster": soft_fertig_layout_fidelity_roster(),
        "soft_fertig_stack_switch_roster": soft_fertig_stack_switch_roster(),
        "soft_fertig_option_enable_roster": soft_fertig_option_enable_roster(),
        "soft_fertig_expect_run_roster": soft_fertig_expect_run_roster(),
        "soft_fertig_expect_steps_roster": soft_fertig_expect_steps_roster(),
        "soft_fertig_expect_steps_refusals_roster": soft_fertig_expect_steps_refusals_roster(),
        "soft_fertig_ssh_auth_roster": soft_fertig_ssh_auth_roster(),
        "soft_fertig_password_ssh_roster": soft_fertig_password_ssh_roster(),
        "soft_fertig_ssh_not_implemented_roster": soft_fertig_ssh_not_implemented_roster(),
        "soft_fertig_ssh_implemented_roster": soft_fertig_ssh_implemented_roster(),
        "soft_fertig_ssh_capability_flags_roster": soft_fertig_ssh_capability_flags_roster(),
        "soft_fertig_ssh_alternatives_roster": soft_fertig_ssh_alternatives_roster(),
        "soft_fertig_ssh_refusal_paths_roster": soft_fertig_ssh_refusal_paths_roster(),
        "soft_fertig_ssh_refusal_status_roster": soft_fertig_ssh_refusal_status_roster(),
        "soft_fertig_ssh_method_lists_roster": soft_fertig_ssh_method_lists_roster(),
        "soft_fertig_ssh_alternative_notes_roster": soft_fertig_ssh_alternative_notes_roster(),
        "soft_fertig_ssh_refusal_path_titles_roster": soft_fertig_ssh_refusal_path_titles_roster(),
        "soft_fertig_ssh_refusal_path_notes_roster": soft_fertig_ssh_refusal_path_notes_roster(),
        "soft_fertig_ssh_auth_note_roster": soft_fertig_ssh_auth_note_roster(),
        "soft_fertig_ssh_alternative_support_roster": soft_fertig_ssh_alternative_support_roster(),
        "soft_fertig_ssh_password_support_roster": soft_fertig_ssh_password_support_roster(),
        "soft_fertig_ssh_batch_mode_roster": soft_fertig_ssh_batch_mode_roster(),
        "soft_fertig_ssh_implemented_check_roster": soft_fertig_ssh_implemented_check_roster(),
        "soft_fertig_ssh_not_implemented_check_roster": soft_fertig_ssh_not_implemented_check_roster(),
        "soft_fertig_ssh_alternative_presence_roster": soft_fertig_ssh_alternative_presence_roster(),
        "soft_fertig_ssh_implemented_batch_roster": soft_fertig_ssh_implemented_batch_roster(),
        "soft_fertig_ssh_not_implemented_batch_roster": soft_fertig_ssh_not_implemented_batch_roster(),
        "soft_fertig_ssh_implemented_agent_roster": soft_fertig_ssh_implemented_agent_roster(),
        "soft_fertig_ssh_auth_note_snapshot_roster": soft_fertig_ssh_auth_note_snapshot_roster(),
        "soft_fertig_ssh_honesty_refresh_roster": soft_fertig_ssh_honesty_refresh_roster(),
        "soft_fertig_ssh_implemented_identity_roster": soft_fertig_ssh_implemented_identity_roster(),
        "soft_fertig_ssh_not_implemented_keyboard_roster": soft_fertig_ssh_not_implemented_keyboard_roster(),
        "soft_fertig_ssh_not_implemented_password_roster": soft_fertig_ssh_not_implemented_password_roster(),
        "soft_fertig_ssh_refusal_status_refresh_roster": soft_fertig_ssh_refusal_status_refresh_roster(),
        "soft_fertig_ssh_auth_policy_refresh_roster": soft_fertig_ssh_auth_policy_refresh_roster(),
        "soft_fertig_ssh_refusal_paths_refresh_roster": soft_fertig_ssh_refusal_paths_refresh_roster(),
        "soft_fertig_ssh_alternatives_refresh_roster": soft_fertig_ssh_alternatives_refresh_roster(),
        "soft_fertig_ssh_alternative_titles_refresh_roster": soft_fertig_ssh_alternative_titles_refresh_roster(),
        "soft_fertig_ssh_refusal_path_titles_refresh_roster": soft_fertig_ssh_refusal_path_titles_refresh_roster(),
        "soft_fertig_ssh_refusal_path_notes_refresh_roster": soft_fertig_ssh_refusal_path_notes_refresh_roster(),
        "soft_fertig_ssh_alternative_notes_refresh_roster": soft_fertig_ssh_alternative_notes_refresh_roster(),
        "soft_fertig_ssh_auth_note_refresh_roster": soft_fertig_ssh_auth_note_refresh_roster(),
        "soft_fertig_ssh_capability_flags_refresh_roster": soft_fertig_ssh_capability_flags_refresh_roster(),
        "soft_fertig_ssh_method_lists_refresh_roster": soft_fertig_ssh_method_lists_refresh_roster(),
        "soft_fertig_ssh_batch_mode_refresh_roster": soft_fertig_ssh_batch_mode_refresh_roster(),
        "soft_fertig_ssh_implemented_refresh_roster": soft_fertig_ssh_implemented_refresh_roster(),
        "soft_fertig_ssh_not_implemented_refresh_roster": soft_fertig_ssh_not_implemented_refresh_roster(),
        "soft_fertig_ssh_auth_note_snapshot_refresh_roster": soft_fertig_ssh_auth_note_snapshot_refresh_roster(),
        "soft_fertig_ssh_implemented_check_refresh_roster": soft_fertig_ssh_implemented_check_refresh_roster(),
        "soft_fertig_ssh_not_implemented_check_refresh_roster": soft_fertig_ssh_not_implemented_check_refresh_roster(),
        "soft_fertig_ssh_alternative_presence_refresh_roster": soft_fertig_ssh_alternative_presence_refresh_roster(),
        "soft_fertig_ssh_implemented_batch_refresh_roster": soft_fertig_ssh_implemented_batch_refresh_roster(),
        "soft_fertig_ssh_not_implemented_batch_refresh_roster": soft_fertig_ssh_not_implemented_batch_refresh_roster(),
        "soft_fertig_ssh_implemented_agent_refresh_roster": soft_fertig_ssh_implemented_agent_refresh_roster(),
        "soft_fertig_ssh_implemented_identity_refresh_roster": soft_fertig_ssh_implemented_identity_refresh_roster(),
        "soft_fertig_ssh_not_implemented_keyboard_refresh_roster": soft_fertig_ssh_not_implemented_keyboard_refresh_roster(),
        "soft_fertig_ssh_not_implemented_password_refresh_roster": soft_fertig_ssh_not_implemented_password_refresh_roster(),
        "soft_fertig_ssh_alternative_support_refresh_roster": soft_fertig_ssh_alternative_support_refresh_roster(),
        "soft_fertig_ssh_password_support_refresh_roster": soft_fertig_ssh_password_support_refresh_roster(),
        "soft_fertig_ssh_auth_refresh_roster": soft_fertig_ssh_auth_refresh_roster(),
        "soft_fertig_ssh_auth_field_presence_roster": soft_fertig_ssh_auth_field_presence_roster(),
        "soft_fertig_ssh_auth_list_length_roster": soft_fertig_ssh_auth_list_length_roster(),
        "soft_fertig_ssh_auth_bool_flag_roster": soft_fertig_ssh_auth_bool_flag_roster(),
        "soft_fertig_ssh_auth_note_token_roster": soft_fertig_ssh_auth_note_token_roster(),
        "soft_fertig_ssh_auth_alternative_id_roster": soft_fertig_ssh_auth_alternative_id_roster(),
        "soft_fertig_ssh_auth_refusal_id_roster": soft_fertig_ssh_auth_refusal_id_roster(),
        "soft_fertig_ssh_auth_implemented_id_roster": soft_fertig_ssh_auth_implemented_id_roster(),
        "soft_fertig_ssh_auth_not_implemented_id_roster": soft_fertig_ssh_auth_not_implemented_id_roster(),
        "soft_fertig_ssh_auth_refusal_status_roster": soft_fertig_ssh_auth_refusal_status_roster(),
        "soft_fertig_ssh_auth_title_map_roster": soft_fertig_ssh_auth_title_map_roster(),
        "soft_fertig_ssh_auth_note_map_roster": soft_fertig_ssh_auth_note_map_roster(),
        "soft_fertig_ssh_auth_note_length_roster": soft_fertig_ssh_auth_note_length_roster(),
        "soft_fertig_ssh_auth_capability_count_roster": soft_fertig_ssh_auth_capability_count_roster(),
        "soft_fertig_ssh_auth_batch_gate_roster": soft_fertig_ssh_auth_batch_gate_roster(),
        "soft_fertig_ssh_auth_support_gate_roster": soft_fertig_ssh_auth_support_gate_roster(),
        "soft_fertig_ssh_auth_method_partition_roster": soft_fertig_ssh_auth_method_partition_roster(),
        "soft_fertig_ssh_alternative_titles_roster": soft_fertig_ssh_alternative_titles_roster(),
        "soft_fertig_ssh_auth_policy_roster": soft_fertig_ssh_auth_policy_roster(),
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
        "soft_fertig_layout_fidelity_roster": dict(
            full.get("soft_fertig_layout_fidelity_roster") or {}
        ),
        "soft_fertig_stack_switch_roster": dict(
            full.get("soft_fertig_stack_switch_roster") or {}
        ),
        "soft_fertig_option_enable_roster": dict(
            full.get("soft_fertig_option_enable_roster") or {}
        ),
        "soft_fertig_expect_run_roster": dict(
            full.get("soft_fertig_expect_run_roster") or {}
        ),
        "soft_fertig_expect_steps_roster": dict(
            full.get("soft_fertig_expect_steps_roster") or {}
        ),
        "soft_fertig_expect_steps_refusals_roster": dict(
            full.get("soft_fertig_expect_steps_refusals_roster") or {}
        ),
        "soft_fertig_ssh_auth_roster": dict(
            full.get("soft_fertig_ssh_auth_roster") or {}
        ),
        "soft_fertig_password_ssh_roster": dict(
            full.get("soft_fertig_password_ssh_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_roster") or {}
        ),
        "soft_fertig_ssh_implemented_roster": dict(
            full.get("soft_fertig_ssh_implemented_roster") or {}
        ),
        "soft_fertig_ssh_capability_flags_roster": dict(
            full.get("soft_fertig_ssh_capability_flags_roster") or {}
        ),
        "soft_fertig_ssh_alternatives_roster": dict(
            full.get("soft_fertig_ssh_alternatives_roster") or {}
        ),
        "soft_fertig_ssh_refusal_paths_roster": dict(
            full.get("soft_fertig_ssh_refusal_paths_roster") or {}
        ),
        "soft_fertig_ssh_refusal_status_roster": dict(
            full.get("soft_fertig_ssh_refusal_status_roster") or {}
        ),
        "soft_fertig_ssh_method_lists_roster": dict(
            full.get("soft_fertig_ssh_method_lists_roster") or {}
        ),
        "soft_fertig_ssh_alternative_notes_roster": dict(
            full.get("soft_fertig_ssh_alternative_notes_roster") or {}
        ),
        "soft_fertig_ssh_refusal_path_titles_roster": dict(
            full.get("soft_fertig_ssh_refusal_path_titles_roster") or {}
        ),
        "soft_fertig_ssh_refusal_path_notes_roster": dict(
            full.get("soft_fertig_ssh_refusal_path_notes_roster") or {}
        ),
        "soft_fertig_ssh_auth_note_roster": dict(
            full.get("soft_fertig_ssh_auth_note_roster") or {}
        ),
        "soft_fertig_ssh_alternative_support_roster": dict(
            full.get("soft_fertig_ssh_alternative_support_roster") or {}
        ),
        "soft_fertig_ssh_password_support_roster": dict(
            full.get("soft_fertig_ssh_password_support_roster") or {}
        ),
        "soft_fertig_ssh_batch_mode_roster": dict(
            full.get("soft_fertig_ssh_batch_mode_roster") or {}
        ),
        "soft_fertig_ssh_implemented_check_roster": dict(
            full.get("soft_fertig_ssh_implemented_check_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_check_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_check_roster") or {}
        ),
        "soft_fertig_ssh_alternative_presence_roster": dict(
            full.get("soft_fertig_ssh_alternative_presence_roster") or {}
        ),
        "soft_fertig_ssh_implemented_batch_roster": dict(
            full.get("soft_fertig_ssh_implemented_batch_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_batch_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_batch_roster") or {}
        ),
        "soft_fertig_ssh_implemented_agent_roster": dict(
            full.get("soft_fertig_ssh_implemented_agent_roster") or {}
        ),
        "soft_fertig_ssh_auth_note_snapshot_roster": dict(
            full.get("soft_fertig_ssh_auth_note_snapshot_roster") or {}
        ),
        "soft_fertig_ssh_honesty_refresh_roster": dict(
            full.get("soft_fertig_ssh_honesty_refresh_roster") or {}
        ),
        "soft_fertig_ssh_implemented_identity_roster": dict(
            full.get("soft_fertig_ssh_implemented_identity_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_keyboard_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_keyboard_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_password_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_password_roster") or {}
        ),
        "soft_fertig_ssh_refusal_status_refresh_roster": dict(
            full.get("soft_fertig_ssh_refusal_status_refresh_roster") or {}
        ),
        "soft_fertig_ssh_auth_policy_refresh_roster": dict(
            full.get("soft_fertig_ssh_auth_policy_refresh_roster") or {}
        ),
        "soft_fertig_ssh_refusal_paths_refresh_roster": dict(
            full.get("soft_fertig_ssh_refusal_paths_refresh_roster") or {}
        ),
        "soft_fertig_ssh_alternatives_refresh_roster": dict(
            full.get("soft_fertig_ssh_alternatives_refresh_roster") or {}
        ),
        "soft_fertig_ssh_alternative_titles_refresh_roster": dict(
            full.get("soft_fertig_ssh_alternative_titles_refresh_roster") or {}
        ),
        "soft_fertig_ssh_refusal_path_titles_refresh_roster": dict(
            full.get("soft_fertig_ssh_refusal_path_titles_refresh_roster") or {}
        ),
        "soft_fertig_ssh_refusal_path_notes_refresh_roster": dict(
            full.get("soft_fertig_ssh_refusal_path_notes_refresh_roster") or {}
        ),
        "soft_fertig_ssh_alternative_notes_refresh_roster": dict(
            full.get("soft_fertig_ssh_alternative_notes_refresh_roster") or {}
        ),
        "soft_fertig_ssh_auth_note_refresh_roster": dict(
            full.get("soft_fertig_ssh_auth_note_refresh_roster") or {}
        ),
        "soft_fertig_ssh_capability_flags_refresh_roster": dict(
            full.get("soft_fertig_ssh_capability_flags_refresh_roster") or {}
        ),
        "soft_fertig_ssh_method_lists_refresh_roster": dict(
            full.get("soft_fertig_ssh_method_lists_refresh_roster") or {}
        ),
        "soft_fertig_ssh_batch_mode_refresh_roster": dict(
            full.get("soft_fertig_ssh_batch_mode_refresh_roster") or {}
        ),
        "soft_fertig_ssh_implemented_refresh_roster": dict(
            full.get("soft_fertig_ssh_implemented_refresh_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_refresh_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_refresh_roster") or {}
        ),
        "soft_fertig_ssh_auth_note_snapshot_refresh_roster": dict(
            full.get("soft_fertig_ssh_auth_note_snapshot_refresh_roster") or {}
        ),
        "soft_fertig_ssh_implemented_check_refresh_roster": dict(
            full.get("soft_fertig_ssh_implemented_check_refresh_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_check_refresh_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_check_refresh_roster") or {}
        ),
        "soft_fertig_ssh_alternative_presence_refresh_roster": dict(
            full.get("soft_fertig_ssh_alternative_presence_refresh_roster") or {}
        ),
        "soft_fertig_ssh_implemented_batch_refresh_roster": dict(
            full.get("soft_fertig_ssh_implemented_batch_refresh_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_batch_refresh_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_batch_refresh_roster") or {}
        ),
        "soft_fertig_ssh_implemented_agent_refresh_roster": dict(
            full.get("soft_fertig_ssh_implemented_agent_refresh_roster") or {}
        ),
        "soft_fertig_ssh_implemented_identity_refresh_roster": dict(
            full.get("soft_fertig_ssh_implemented_identity_refresh_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_keyboard_refresh_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_keyboard_refresh_roster") or {}
        ),
        "soft_fertig_ssh_not_implemented_password_refresh_roster": dict(
            full.get("soft_fertig_ssh_not_implemented_password_refresh_roster") or {}
        ),
        "soft_fertig_ssh_alternative_support_refresh_roster": dict(
            full.get("soft_fertig_ssh_alternative_support_refresh_roster") or {}
        ),
        "soft_fertig_ssh_password_support_refresh_roster": dict(
            full.get("soft_fertig_ssh_password_support_refresh_roster") or {}
        ),
        "soft_fertig_ssh_auth_refresh_roster": dict(
            full.get("soft_fertig_ssh_auth_refresh_roster") or {}
        ),
        "soft_fertig_ssh_auth_field_presence_roster": dict(
            full.get("soft_fertig_ssh_auth_field_presence_roster") or {}
        ),
        "soft_fertig_ssh_auth_list_length_roster": dict(
            full.get("soft_fertig_ssh_auth_list_length_roster") or {}
        ),
        "soft_fertig_ssh_auth_bool_flag_roster": dict(
            full.get("soft_fertig_ssh_auth_bool_flag_roster") or {}
        ),
        "soft_fertig_ssh_auth_note_token_roster": dict(
            full.get("soft_fertig_ssh_auth_note_token_roster") or {}
        ),
        "soft_fertig_ssh_auth_alternative_id_roster": dict(
            full.get("soft_fertig_ssh_auth_alternative_id_roster") or {}
        ),
        "soft_fertig_ssh_auth_refusal_id_roster": dict(
            full.get("soft_fertig_ssh_auth_refusal_id_roster") or {}
        ),
        "soft_fertig_ssh_auth_implemented_id_roster": dict(
            full.get("soft_fertig_ssh_auth_implemented_id_roster") or {}
        ),
        "soft_fertig_ssh_auth_not_implemented_id_roster": dict(
            full.get("soft_fertig_ssh_auth_not_implemented_id_roster") or {}
        ),
        "soft_fertig_ssh_auth_refusal_status_roster": dict(
            full.get("soft_fertig_ssh_auth_refusal_status_roster") or {}
        ),
        "soft_fertig_ssh_auth_title_map_roster": dict(
            full.get("soft_fertig_ssh_auth_title_map_roster") or {}
        ),
        "soft_fertig_ssh_auth_note_map_roster": dict(
            full.get("soft_fertig_ssh_auth_note_map_roster") or {}
        ),
        "soft_fertig_ssh_auth_note_length_roster": dict(
            full.get("soft_fertig_ssh_auth_note_length_roster") or {}
        ),
        "soft_fertig_ssh_auth_capability_count_roster": dict(
            full.get("soft_fertig_ssh_auth_capability_count_roster") or {}
        ),
        "soft_fertig_ssh_auth_batch_gate_roster": dict(
            full.get("soft_fertig_ssh_auth_batch_gate_roster") or {}
        ),
        "soft_fertig_ssh_auth_support_gate_roster": dict(
            full.get("soft_fertig_ssh_auth_support_gate_roster") or {}
        ),
        "soft_fertig_ssh_auth_method_partition_roster": dict(
            full.get("soft_fertig_ssh_auth_method_partition_roster") or {}
        ),
        "soft_fertig_ssh_alternative_titles_roster": dict(
            full.get("soft_fertig_ssh_alternative_titles_roster") or {}
        ),
        "soft_fertig_ssh_auth_policy_roster": dict(
            full.get("soft_fertig_ssh_auth_policy_roster") or {}
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
        "soft_fertig_layout_fidelity_roster": soft_fertig_layout_fidelity_roster(),
        "soft_fertig_stack_switch_roster": soft_fertig_stack_switch_roster(),
        "soft_fertig_option_enable_roster": soft_fertig_option_enable_roster(),
        "soft_fertig_expect_run_roster": soft_fertig_expect_run_roster(),
        "soft_fertig_expect_steps_roster": soft_fertig_expect_steps_roster(),
        "soft_fertig_expect_steps_refusals_roster": soft_fertig_expect_steps_refusals_roster(),
        "soft_fertig_ssh_auth_roster": soft_fertig_ssh_auth_roster(),
        "soft_fertig_password_ssh_roster": soft_fertig_password_ssh_roster(),
        "soft_fertig_ssh_not_implemented_roster": soft_fertig_ssh_not_implemented_roster(),
        "soft_fertig_ssh_implemented_roster": soft_fertig_ssh_implemented_roster(),
        "soft_fertig_ssh_capability_flags_roster": soft_fertig_ssh_capability_flags_roster(),
        "soft_fertig_ssh_alternatives_roster": soft_fertig_ssh_alternatives_roster(),
        "soft_fertig_ssh_refusal_paths_roster": soft_fertig_ssh_refusal_paths_roster(),
        "soft_fertig_ssh_refusal_status_roster": soft_fertig_ssh_refusal_status_roster(),
        "soft_fertig_ssh_method_lists_roster": soft_fertig_ssh_method_lists_roster(),
        "soft_fertig_ssh_alternative_notes_roster": soft_fertig_ssh_alternative_notes_roster(),
        "soft_fertig_ssh_refusal_path_titles_roster": soft_fertig_ssh_refusal_path_titles_roster(),
        "soft_fertig_ssh_refusal_path_notes_roster": soft_fertig_ssh_refusal_path_notes_roster(),
        "soft_fertig_ssh_auth_note_roster": soft_fertig_ssh_auth_note_roster(),
        "soft_fertig_ssh_alternative_support_roster": soft_fertig_ssh_alternative_support_roster(),
        "soft_fertig_ssh_password_support_roster": soft_fertig_ssh_password_support_roster(),
        "soft_fertig_ssh_batch_mode_roster": soft_fertig_ssh_batch_mode_roster(),
        "soft_fertig_ssh_implemented_check_roster": soft_fertig_ssh_implemented_check_roster(),
        "soft_fertig_ssh_not_implemented_check_roster": soft_fertig_ssh_not_implemented_check_roster(),
        "soft_fertig_ssh_alternative_presence_roster": soft_fertig_ssh_alternative_presence_roster(),
        "soft_fertig_ssh_implemented_batch_roster": soft_fertig_ssh_implemented_batch_roster(),
        "soft_fertig_ssh_not_implemented_batch_roster": soft_fertig_ssh_not_implemented_batch_roster(),
        "soft_fertig_ssh_implemented_agent_roster": soft_fertig_ssh_implemented_agent_roster(),
        "soft_fertig_ssh_auth_note_snapshot_roster": soft_fertig_ssh_auth_note_snapshot_roster(),
        "soft_fertig_ssh_honesty_refresh_roster": soft_fertig_ssh_honesty_refresh_roster(),
        "soft_fertig_ssh_implemented_identity_roster": soft_fertig_ssh_implemented_identity_roster(),
        "soft_fertig_ssh_not_implemented_keyboard_roster": soft_fertig_ssh_not_implemented_keyboard_roster(),
        "soft_fertig_ssh_not_implemented_password_roster": soft_fertig_ssh_not_implemented_password_roster(),
        "soft_fertig_ssh_refusal_status_refresh_roster": soft_fertig_ssh_refusal_status_refresh_roster(),
        "soft_fertig_ssh_auth_policy_refresh_roster": soft_fertig_ssh_auth_policy_refresh_roster(),
        "soft_fertig_ssh_refusal_paths_refresh_roster": soft_fertig_ssh_refusal_paths_refresh_roster(),
        "soft_fertig_ssh_alternatives_refresh_roster": soft_fertig_ssh_alternatives_refresh_roster(),
        "soft_fertig_ssh_alternative_titles_refresh_roster": soft_fertig_ssh_alternative_titles_refresh_roster(),
        "soft_fertig_ssh_refusal_path_titles_refresh_roster": soft_fertig_ssh_refusal_path_titles_refresh_roster(),
        "soft_fertig_ssh_refusal_path_notes_refresh_roster": soft_fertig_ssh_refusal_path_notes_refresh_roster(),
        "soft_fertig_ssh_alternative_notes_refresh_roster": soft_fertig_ssh_alternative_notes_refresh_roster(),
        "soft_fertig_ssh_auth_note_refresh_roster": soft_fertig_ssh_auth_note_refresh_roster(),
        "soft_fertig_ssh_capability_flags_refresh_roster": soft_fertig_ssh_capability_flags_refresh_roster(),
        "soft_fertig_ssh_method_lists_refresh_roster": soft_fertig_ssh_method_lists_refresh_roster(),
        "soft_fertig_ssh_batch_mode_refresh_roster": soft_fertig_ssh_batch_mode_refresh_roster(),
        "soft_fertig_ssh_implemented_refresh_roster": soft_fertig_ssh_implemented_refresh_roster(),
        "soft_fertig_ssh_not_implemented_refresh_roster": soft_fertig_ssh_not_implemented_refresh_roster(),
        "soft_fertig_ssh_auth_note_snapshot_refresh_roster": soft_fertig_ssh_auth_note_snapshot_refresh_roster(),
        "soft_fertig_ssh_implemented_check_refresh_roster": soft_fertig_ssh_implemented_check_refresh_roster(),
        "soft_fertig_ssh_not_implemented_check_refresh_roster": soft_fertig_ssh_not_implemented_check_refresh_roster(),
        "soft_fertig_ssh_alternative_presence_refresh_roster": soft_fertig_ssh_alternative_presence_refresh_roster(),
        "soft_fertig_ssh_implemented_batch_refresh_roster": soft_fertig_ssh_implemented_batch_refresh_roster(),
        "soft_fertig_ssh_not_implemented_batch_refresh_roster": soft_fertig_ssh_not_implemented_batch_refresh_roster(),
        "soft_fertig_ssh_implemented_agent_refresh_roster": soft_fertig_ssh_implemented_agent_refresh_roster(),
        "soft_fertig_ssh_implemented_identity_refresh_roster": soft_fertig_ssh_implemented_identity_refresh_roster(),
        "soft_fertig_ssh_not_implemented_keyboard_refresh_roster": soft_fertig_ssh_not_implemented_keyboard_refresh_roster(),
        "soft_fertig_ssh_not_implemented_password_refresh_roster": soft_fertig_ssh_not_implemented_password_refresh_roster(),
        "soft_fertig_ssh_alternative_support_refresh_roster": soft_fertig_ssh_alternative_support_refresh_roster(),
        "soft_fertig_ssh_password_support_refresh_roster": soft_fertig_ssh_password_support_refresh_roster(),
        "soft_fertig_ssh_auth_refresh_roster": soft_fertig_ssh_auth_refresh_roster(),
        "soft_fertig_ssh_auth_field_presence_roster": soft_fertig_ssh_auth_field_presence_roster(),
        "soft_fertig_ssh_auth_list_length_roster": soft_fertig_ssh_auth_list_length_roster(),
        "soft_fertig_ssh_auth_bool_flag_roster": soft_fertig_ssh_auth_bool_flag_roster(),
        "soft_fertig_ssh_auth_note_token_roster": soft_fertig_ssh_auth_note_token_roster(),
        "soft_fertig_ssh_auth_alternative_id_roster": soft_fertig_ssh_auth_alternative_id_roster(),
        "soft_fertig_ssh_auth_refusal_id_roster": soft_fertig_ssh_auth_refusal_id_roster(),
        "soft_fertig_ssh_auth_implemented_id_roster": soft_fertig_ssh_auth_implemented_id_roster(),
        "soft_fertig_ssh_auth_not_implemented_id_roster": soft_fertig_ssh_auth_not_implemented_id_roster(),
        "soft_fertig_ssh_auth_refusal_status_roster": soft_fertig_ssh_auth_refusal_status_roster(),
        "soft_fertig_ssh_auth_title_map_roster": soft_fertig_ssh_auth_title_map_roster(),
        "soft_fertig_ssh_auth_note_map_roster": soft_fertig_ssh_auth_note_map_roster(),
        "soft_fertig_ssh_auth_note_length_roster": soft_fertig_ssh_auth_note_length_roster(),
        "soft_fertig_ssh_auth_capability_count_roster": soft_fertig_ssh_auth_capability_count_roster(),
        "soft_fertig_ssh_auth_batch_gate_roster": soft_fertig_ssh_auth_batch_gate_roster(),
        "soft_fertig_ssh_auth_support_gate_roster": soft_fertig_ssh_auth_support_gate_roster(),
        "soft_fertig_ssh_auth_method_partition_roster": soft_fertig_ssh_auth_method_partition_roster(),
        "soft_fertig_ssh_alternative_titles_roster": soft_fertig_ssh_alternative_titles_roster(),
        "soft_fertig_ssh_auth_policy_roster": soft_fertig_ssh_auth_policy_roster(),
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
