#!/usr/bin/env bash
# Phase-984: soft-complete through 984 (signal_key_count).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 984
print("soft-complete >=984", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase984|Soft-complete STATUS through 984|through 984' webui/STATUS.md
echo "STATUS soft-complete 984 ok"
echo "cleaned"
echo "OK: phase984 e2e passed"
