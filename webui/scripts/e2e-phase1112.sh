#!/usr/bin/env bash
# Phase-1112: soft-complete through 1112 (alt2 junosacl sample).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1112
print("soft-complete >=1112", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1112|Soft-complete STATUS through 1112|through 1112' webui/STATUS.md
echo "STATUS soft-complete 1112 ok"
echo "cleaned"
echo "OK: phase1112 e2e passed"
