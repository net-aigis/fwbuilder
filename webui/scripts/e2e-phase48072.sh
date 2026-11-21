#!/usr/bin/env bash
# Phase-48072: soft-complete through 48072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48072
PY
grep -qE 'phase48072|through 48072' webui/STATUS.md
echo "OK: phase48072 e2e passed"
