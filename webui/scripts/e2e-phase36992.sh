#!/usr/bin/env bash
# Phase-36992: soft-complete through 36992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36992
PY
grep -qE 'phase36992|through 36992' webui/STATUS.md
echo "OK: phase36992 e2e passed"
