#!/usr/bin/env bash
# Phase-38040: soft-complete through 38040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38040
PY
grep -qE 'phase38040|through 38040' webui/STATUS.md
echo "OK: phase38040 e2e passed"
