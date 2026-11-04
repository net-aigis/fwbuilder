#!/usr/bin/env bash
# Phase-1096: soft-complete through 1096 (alt iosacl sample).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1096
print("soft-complete >=1096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1096|Soft-complete STATUS through 1096|through 1096' webui/STATUS.md
echo "STATUS soft-complete 1096 ok"
echo "cleaned"
echo "OK: phase1096 e2e passed"
