#!/usr/bin/env bash
# Phase-619: honesty_paths_count on /hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert h.get("honesty_paths_count") == len(h.get("honesty_paths") or {})
assert h["honesty_paths_count"] >= 10
print("honesty_paths_count", h["honesty_paths_count"])
PY
echo "cleaned"
echo "OK: phase619 e2e passed"
