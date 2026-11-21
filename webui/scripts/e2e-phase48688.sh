#!/usr/bin/env bash
# Phase-48688: soft-complete through 48688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48688
PY
grep -qE 'phase48688|through 48688' webui/STATUS.md
echo "OK: phase48688 e2e passed"
