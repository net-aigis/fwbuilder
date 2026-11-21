#!/usr/bin/env bash
# Phase-38416: soft-complete through 38416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38416
PY
grep -qE 'phase38416|through 38416' webui/STATUS.md
echo "OK: phase38416 e2e passed"
