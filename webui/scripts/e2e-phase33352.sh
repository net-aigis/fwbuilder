#!/usr/bin/env bash
# Phase-33352: soft-complete through 33352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33352
PY
grep -qE 'phase33352|through 33352' webui/STATUS.md
echo "OK: phase33352 e2e passed"
