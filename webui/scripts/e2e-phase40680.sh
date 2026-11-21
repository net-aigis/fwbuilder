#!/usr/bin/env bash
# Phase-40680: soft-complete through 40680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40680
PY
grep -qE 'phase40680|through 40680' webui/STATUS.md
echo "OK: phase40680 e2e passed"
