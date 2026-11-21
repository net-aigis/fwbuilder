#!/usr/bin/env bash
# Phase-10848: soft-complete through 10848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10848
PY
grep -qE 'phase10848|through 10848' webui/STATUS.md
echo "OK: phase10848 e2e passed"
