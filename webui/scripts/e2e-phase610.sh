#!/usr/bin/env bash
# Phase-610: honesty_paths catalog on /hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
paths = h.get("honesty_paths") or {}
assert isinstance(paths, dict)
assert paths.get("closure") == "/api/v1/hard-gaps/closure"
assert paths.get("expect_steps_refusals")
assert h.get("honesty_milestone") == m.WEBUI_HONESTY_MILESTONE
print("honesty_paths", len(paths))
PY
echo "cleaned"
echo "OK: phase610 e2e passed"
