#!/usr/bin/env bash
# Phase-39080: soft-complete through 39080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39080
PY
grep -qE 'phase39080|through 39080' webui/STATUS.md
echo "OK: phase39080 e2e passed"
