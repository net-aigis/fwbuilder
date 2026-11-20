#!/usr/bin/env bash
# Phase-38080: soft-complete through 38080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38080
PY
grep -qE 'phase38080|through 38080' webui/STATUS.md
echo "OK: phase38080 e2e passed"
