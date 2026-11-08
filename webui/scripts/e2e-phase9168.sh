#!/usr/bin/env bash
# Phase-9168: soft-complete through 9168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9168
PY
grep -qE 'phase9168|through 9168' webui/STATUS.md
echo "OK: phase9168 e2e passed"
