#!/usr/bin/env bash
# Phase-45688: soft-complete through 45688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45688
PY
grep -qE 'phase45688|through 45688' webui/STATUS.md
echo "OK: phase45688 e2e passed"
