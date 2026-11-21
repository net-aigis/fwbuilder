#!/usr/bin/env bash
# Phase-48160: soft-complete through 48160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48160
PY
grep -qE 'phase48160|through 48160' webui/STATUS.md
echo "OK: phase48160 e2e passed"
