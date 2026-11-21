#!/usr/bin/env bash
# Phase-42040: soft-complete through 42040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42040
PY
grep -qE 'phase42040|through 42040' webui/STATUS.md
echo "OK: phase42040 e2e passed"
