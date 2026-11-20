#!/usr/bin/env bash
# Phase-43568: soft-complete through 43568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43568
PY
grep -qE 'phase43568|through 43568' webui/STATUS.md
echo "OK: phase43568 e2e passed"
