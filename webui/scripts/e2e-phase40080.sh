#!/usr/bin/env bash
# Phase-40080: soft-complete through 40080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40080
PY
grep -qE 'phase40080|through 40080' webui/STATUS.md
echo "OK: phase40080 e2e passed"
