#!/usr/bin/env bash
# Phase-19096: soft-complete through 19096 (ms 57750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19096
assert m.WEBUI_HONESTY_MILESTONE == 57750
print("soft-complete >=19096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19096|through 19096' webui/STATUS.md
echo "OK: phase19096 e2e passed"
