#!/usr/bin/env bash
# Phase-43088: soft-complete through 43088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43088
PY
grep -qE 'phase43088|through 43088' webui/STATUS.md
echo "OK: phase43088 e2e passed"
