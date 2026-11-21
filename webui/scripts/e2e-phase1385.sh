#!/usr/bin/env bash
# Phase-1385: honesty_paths on closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
c = m.hard_gap_closure()
assert c.get("honesty_paths") == h.get("honesty_paths")
assert c.get("honesty_path_titles") == h.get("honesty_path_titles")
assert c.get("honesty_path_notes") == h.get("honesty_path_notes")
assert c.get("honesty_paths_count") == h.get("honesty_paths_count")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1392
print("closure honesty_paths ok")
PY
echo "cleaned"
echo "OK: phase1385 e2e passed"
