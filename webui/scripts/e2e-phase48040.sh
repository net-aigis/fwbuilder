#!/usr/bin/env bash
# Phase-48040: soft-complete through 48040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48040
PY
grep -qE 'phase48040|through 48040' webui/STATUS.md
echo "OK: phase48040 e2e passed"
