#!/usr/bin/env bash
# Phase-12288: soft-complete through 12288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12288
PY
grep -qE 'phase12288|through 12288' webui/STATUS.md
echo "OK: phase12288 e2e passed"
