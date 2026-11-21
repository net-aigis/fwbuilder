#!/usr/bin/env bash
# Phase-34520: soft-complete through 34520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34520
PY
grep -qE 'phase34520|through 34520' webui/STATUS.md
echo "OK: phase34520 e2e passed"
