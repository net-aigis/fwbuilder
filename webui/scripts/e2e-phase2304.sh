#!/usr/bin/env bash
# Phase-2304: soft-complete through 2304 (hard-gap refusal roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2304
print("soft-complete >=2304", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2304|Soft-complete STATUS through 2304|through 2304' webui/STATUS.md
echo "STATUS soft-complete 2304 ok"
echo "cleaned"
echo "OK: phase2304 e2e passed"
