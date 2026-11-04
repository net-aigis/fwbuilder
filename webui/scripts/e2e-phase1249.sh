#!/usr/bin/env bash
# Phase-1249: hard_gap_related_refusals on hard-gaps (+ titles on summary).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAP_RELATED_REFUSALS) == 3
h = m.hard_gaps()
s = m.hard_gaps_summary()
refs = h.get("hard_gap_related_refusals") or {}
titles = h.get("hard_gap_related_refusal_titles") or {}
assert set(refs) == set(m.HARD_GAPS_OPEN)
assert set(titles) == set(m.HARD_GAPS_OPEN)
assert s.get("hard_gap_related_refusal_titles") == titles
assert refs["expect_sshsession_runtime"].get("expect_install_plan_run") == 501
assert refs["password_keyboard_interactive_ssh"].get("ssh_auth_password") == 501
assert refs["full_qt_pixel_layout"].get("layout_fidelity_pixel_parity") is False
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1256
print("hard_gap_related_refusals", list(refs))
PY
echo "cleaned"
echo "OK: phase1249 e2e passed"
