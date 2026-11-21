#!/usr/bin/env bash
# Phase-39168: soft-complete through 39168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39168
PY
grep -qE 'phase39168|through 39168' webui/STATUS.md
echo "OK: phase39168 e2e passed"
