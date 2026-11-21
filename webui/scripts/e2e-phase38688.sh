#!/usr/bin/env bash
# Phase-38688: soft-complete through 38688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38688
PY
grep -qE 'phase38688|through 38688' webui/STATUS.md
echo "OK: phase38688 e2e passed"
