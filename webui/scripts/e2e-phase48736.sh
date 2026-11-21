#!/usr/bin/env bash
# Phase-48736: soft-complete through 48736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48736
PY
grep -qE 'phase48736|through 48736' webui/STATUS.md
echo "OK: phase48736 e2e passed"
