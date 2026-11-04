#!/usr/bin/env bash
# Phase-625: GET /hard-gaps/summary endpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
s = m.hard_gaps_summary()
assert s.get("honesty_milestone") == m.WEBUI_HONESTY_MILESTONE
assert s.get("soft_fertig_honesty_track") is True
assert s.get("hard_gap_count") == 3
assert s.get("parent_path") == "/api/v1/hard-gaps"
assert s.get("closure_path") == "/api/v1/hard-gaps/closure"
assert int(s.get("honesty_paths_count") or 0) >= 10
assert m.WEBUI_SOFT_COMPLETE_PHASE == "632"
print("summary ok", s["honesty_paths_count"])
PY
echo "cleaned"
echo "OK: phase625 e2e passed"
