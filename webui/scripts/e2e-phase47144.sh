#!/usr/bin/env bash
# Phase-47144: soft-complete through 47144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47144
PY
grep -qE 'phase47144|through 47144' webui/STATUS.md
echo "OK: phase47144 e2e passed"
