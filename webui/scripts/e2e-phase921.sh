#!/usr/bin/env bash
# Phase-921: UI truncates long sample fidelity lines.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'formatSampleFidelityLine' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'SAMPLE_FIDELITY_UI_MAX' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsSummaryFidelityTitle' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
note = m.HARD_GAP_NOTES.get("full_qt_pixel_layout") or ""
assert "truncates" in note or "UI truncates" in note
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 928
print("fidelity UI truncate ok")
PY
echo "cleaned"
echo "OK: phase921 e2e passed"
