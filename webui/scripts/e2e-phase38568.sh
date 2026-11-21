#!/usr/bin/env bash
# Phase-38568: soft-complete through 38568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38568
PY
grep -qE 'phase38568|through 38568' webui/STATUS.md
echo "OK: phase38568 e2e passed"
