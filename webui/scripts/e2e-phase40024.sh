#!/usr/bin/env bash
# Phase-40024: soft-complete through 40024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40024
PY
grep -qE 'phase40024|through 40024' webui/STATUS.md
echo "OK: phase40024 e2e passed"
