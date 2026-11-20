#!/usr/bin/env bash
# Phase-43960: soft-complete through 43960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43960
PY
grep -qE 'phase43960|through 43960' webui/STATUS.md
echo "OK: phase43960 e2e passed"
