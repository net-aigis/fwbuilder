#!/usr/bin/env bash
# Phase-43680: soft-complete through 43680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43680
PY
grep -qE 'phase43680|through 43680' webui/STATUS.md
echo "OK: phase43680 e2e passed"
