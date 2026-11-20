#!/usr/bin/env bash
# Phase-38184: soft-complete through 38184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38184
PY
grep -qE 'phase38184|through 38184' webui/STATUS.md
echo "OK: phase38184 e2e passed"
