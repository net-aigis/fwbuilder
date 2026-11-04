#!/usr/bin/env bash
# Phase-1369: honesty_paths + notes mirrored on summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
s = m.hard_gaps_summary()
assert s.get("honesty_paths") == h.get("honesty_paths")
assert s.get("honesty_path_notes") == h.get("honesty_path_notes")
assert s.get("honesty_path_titles") == h.get("honesty_path_titles")
assert len(s.get("honesty_paths") or {}) >= 11
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1376
print("summary honesty_paths mirror ok")
PY
echo "cleaned"
echo "OK: phase1369 e2e passed"
