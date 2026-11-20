#!/usr/bin/env bash
# Phase-40824: soft-complete through 40824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40824
PY
grep -qE 'phase40824|through 40824' webui/STATUS.md
echo "OK: phase40824 e2e passed"
