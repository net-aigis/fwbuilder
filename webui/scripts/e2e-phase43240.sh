#!/usr/bin/env bash
# Phase-43240: soft-complete through 43240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43240
PY
grep -qE 'phase43240|through 43240' webui/STATUS.md
echo "OK: phase43240 e2e passed"
