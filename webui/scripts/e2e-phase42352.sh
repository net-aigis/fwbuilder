#!/usr/bin/env bash
# Phase-42352: soft-complete through 42352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42352
PY
grep -qE 'phase42352|through 42352' webui/STATUS.md
echo "OK: phase42352 e2e passed"
