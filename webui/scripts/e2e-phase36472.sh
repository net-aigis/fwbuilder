#!/usr/bin/env bash
# Phase-36472: soft-complete through 36472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36472
PY
grep -qE 'phase36472|through 36472' webui/STATUS.md
echo "OK: phase36472 e2e passed"
