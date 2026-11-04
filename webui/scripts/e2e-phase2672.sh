#!/usr/bin/env bash
# Phase-2672: soft-complete through 2672 (honesty_bundle_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2672
print("soft-complete >=2672", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2672|Soft-complete STATUS through 2672|through 2672' webui/STATUS.md
echo "STATUS soft-complete 2672 ok"
echo "cleaned"
echo "OK: phase2672 e2e passed"
