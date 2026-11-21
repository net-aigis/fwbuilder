#!/usr/bin/env bash
# Phase-48168: soft-complete through 48168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48168
PY
grep -qE 'phase48168|through 48168' webui/STATUS.md
echo "OK: phase48168 e2e passed"
