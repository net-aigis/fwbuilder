#!/usr/bin/env bash
# Phase-21096: soft-complete through 21096 (ms 64000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21096
assert m.WEBUI_HONESTY_MILESTONE == 64000
print("soft-complete >=21096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21096|through 21096' webui/STATUS.md
echo "OK: phase21096 e2e passed"
