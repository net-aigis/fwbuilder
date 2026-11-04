#!/usr/bin/env bash
# Phase-1201: honesty_path_titles on hard-gaps/summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HONESTY_PATH_TITLES) >= 11
h = m.hard_gaps()
s = m.hard_gaps_summary()
titles = h.get("honesty_path_titles") or {}
assert set(titles) == set(h.get("honesty_paths") or {})
assert s.get("honesty_path_titles") == titles
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1208
print("honesty_path_titles", len(titles))
PY
echo "cleaned"
echo "OK: phase1201 e2e passed"
