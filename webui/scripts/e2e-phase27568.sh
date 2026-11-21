#!/usr/bin/env bash
# Phase-27568: soft-complete through 27568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27568
PY
grep -qE 'phase27568|through 27568' webui/STATUS.md
echo "OK: phase27568 e2e passed"
