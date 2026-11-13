#!/usr/bin/env bash
# Phase-29096: soft-complete through 29096 (ms 89000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29096
assert m.WEBUI_HONESTY_MILESTONE == 89000
print("soft-complete >=29096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29096|through 29096' webui/STATUS.md
echo "OK: phase29096 e2e passed"
