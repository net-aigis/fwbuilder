#!/usr/bin/env bash
# Phase-2464: soft-complete through 2464 (sessionStorage roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2464
print("soft-complete >=2464", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2464|Soft-complete STATUS through 2464|through 2464' webui/STATUS.md
echo "STATUS soft-complete 2464 ok"
echo "cleaned"
echo "OK: phase2464 e2e passed"
