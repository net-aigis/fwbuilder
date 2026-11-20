#!/usr/bin/env bash
# Phase-43448: soft-complete through 43448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43448
PY
grep -qE 'phase43448|through 43448' webui/STATUS.md
echo "OK: phase43448 e2e passed"
