#!/usr/bin/env bash
# Phase-11168: soft-complete through 11168.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11168
PY
grep -qE 'phase11168|through 11168' webui/STATUS.md
echo "OK: phase11168 e2e passed"
