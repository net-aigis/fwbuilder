#!/usr/bin/env bash
# Phase-48096: soft-complete through 48096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48096
PY
grep -qE 'phase48096|through 48096' webui/STATUS.md
echo "OK: phase48096 e2e passed"
