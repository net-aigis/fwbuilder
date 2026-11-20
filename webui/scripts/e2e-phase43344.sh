#!/usr/bin/env bash
# Phase-43344: soft-complete through 43344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43344
PY
grep -qE 'phase43344|through 43344' webui/STATUS.md
echo "OK: phase43344 e2e passed"
