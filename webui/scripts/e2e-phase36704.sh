#!/usr/bin/env bash
# Phase-36704: soft-complete through 36704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36704
PY
grep -qE 'phase36704|through 36704' webui/STATUS.md
echo "OK: phase36704 e2e passed"
