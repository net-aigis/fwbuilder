#!/usr/bin/env bash
# Phase-626: summary_path on /hard-gaps and honesty_paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert h.get("summary_path") == "/api/v1/hard-gaps/summary"
paths = h.get("honesty_paths") or {}
assert paths.get("summary") == "/api/v1/hard-gaps/summary"
assert h.get("honesty_paths_count") == len(paths)
c = m.hard_gap_closure()
assert c.get("summary_path") == "/api/v1/hard-gaps/summary"
print("summary_path wired")
PY
echo "cleaned"
echo "OK: phase626 e2e passed"
