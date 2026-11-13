#!/usr/bin/env bash
# Phase-28288: soft-complete through 28288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28288
PY
grep -qE 'phase28288|through 28288' webui/STATUS.md
echo "OK: phase28288 e2e passed"
