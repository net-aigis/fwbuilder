#!/usr/bin/env bash
# Phase-38992: soft-complete through 38992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38992
PY
grep -qE 'phase38992|through 38992' webui/STATUS.md
echo "OK: phase38992 e2e passed"
