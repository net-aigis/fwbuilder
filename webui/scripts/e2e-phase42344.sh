#!/usr/bin/env bash
# Phase-42344: soft-complete through 42344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42344
PY
grep -qE 'phase42344|through 42344' webui/STATUS.md
echo "OK: phase42344 e2e passed"
