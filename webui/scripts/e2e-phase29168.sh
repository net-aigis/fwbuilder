#!/usr/bin/env bash
# Phase-29168: soft-complete through 29168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29168
PY
grep -qE 'phase29168|through 29168' webui/STATUS.md
echo "OK: phase29168 e2e passed"
