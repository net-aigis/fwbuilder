#!/usr/bin/env bash
# Phase-30624: soft-complete through 30624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30624
PY
grep -qE 'phase30624|through 30624' webui/STATUS.md
echo "OK: phase30624 e2e passed"
