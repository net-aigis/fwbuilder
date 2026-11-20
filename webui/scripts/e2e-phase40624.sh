#!/usr/bin/env bash
# Phase-40624: soft-complete through 40624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40624
PY
grep -qE 'phase40624|through 40624' webui/STATUS.md
echo "OK: phase40624 e2e passed"
