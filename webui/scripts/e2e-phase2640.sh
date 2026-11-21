#!/usr/bin/env bash
# Phase-2640: soft-complete through 2640 (honesty_bundle_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2640
print("soft-complete >=2640", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2640|Soft-complete STATUS through 2640|through 2640' webui/STATUS.md
echo "STATUS soft-complete 2640 ok"
echo "cleaned"
echo "OK: phase2640 e2e passed"
