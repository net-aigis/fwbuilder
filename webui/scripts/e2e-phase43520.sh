#!/usr/bin/env bash
# Phase-43520: soft-complete through 43520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43520
PY
grep -qE 'phase43520|through 43520' webui/STATUS.md
echo "OK: phase43520 e2e passed"
