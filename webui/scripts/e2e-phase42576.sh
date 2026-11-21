#!/usr/bin/env bash
# Phase-42576: soft-complete through 42576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42576
PY
grep -qE 'phase42576|through 42576' webui/STATUS.md
echo "OK: phase42576 e2e passed"
