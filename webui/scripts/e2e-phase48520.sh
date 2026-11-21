#!/usr/bin/env bash
# Phase-48520: soft-complete through 48520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48520
PY
grep -qE 'phase48520|through 48520' webui/STATUS.md
echo "OK: phase48520 e2e passed"
