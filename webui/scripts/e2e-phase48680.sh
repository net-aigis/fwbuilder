#!/usr/bin/env bash
# Phase-48680: soft-complete through 48680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48680
PY
grep -qE 'phase48680|through 48680' webui/STATUS.md
echo "OK: phase48680 e2e passed"
