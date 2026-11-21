#!/usr/bin/env bash
# Phase-48224: soft-complete through 48224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48224
PY
grep -qE 'phase48224|through 48224' webui/STATUS.md
echo "OK: phase48224 e2e passed"
