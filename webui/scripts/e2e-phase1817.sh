#!/usr/bin/env bash
# Phase-1817: soft_fertig_honesty_track_note on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "three hard gaps" in m.SOFT_FERTIG_HONESTY_TRACK_NOTE
assert "soft_fertig_honesty_track_note" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert "three hard gaps" in (h.get("soft_fertig_honesty_track_note") or "")
assert "three hard gaps" in (m.health().get("soft_fertig_honesty_track_note") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1824
print("track note ok")
PY
echo "cleaned"
echo "OK: phase1817 e2e passed"
