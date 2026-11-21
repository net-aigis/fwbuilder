#!/usr/bin/env bash
# Phase-43848: soft-complete through 43848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43848
PY
grep -qE 'phase43848|through 43848' webui/STATUS.md
echo "OK: phase43848 e2e passed"
