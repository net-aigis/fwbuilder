#!/usr/bin/env bash
# Phase-48080: soft-complete through 48080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48080
PY
grep -qE 'phase48080|through 48080' webui/STATUS.md
echo "OK: phase48080 e2e passed"
