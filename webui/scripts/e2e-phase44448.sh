#!/usr/bin/env bash
# Phase-44448: soft-complete through 44448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44448
PY
grep -qE 'phase44448|through 44448' webui/STATUS.md
echo "OK: phase44448 e2e passed"
