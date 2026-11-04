#!/usr/bin/env bash
# Phase-1993: soft_fertig_soft_complete_note on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "WEBUI_SOFT_COMPLETE_PHASE" in m.SOFT_FERTIG_SOFT_COMPLETE_NOTE
assert "three hard gaps" in m.SOFT_FERTIG_SOFT_COMPLETE_NOTE
assert "soft_fertig_soft_complete_note" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert "WEBUI_SOFT_COMPLETE_PHASE" in (h.get("soft_fertig_soft_complete_note") or "")
assert "WEBUI_SOFT_COMPLETE_PHASE" in (m.health().get("soft_fertig_soft_complete_note") or "")
assert "soft_fertig_soft_complete_note" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2000
print("soft_complete_note ok")
PY
echo "cleaned"
echo "OK: phase1993 e2e passed"
