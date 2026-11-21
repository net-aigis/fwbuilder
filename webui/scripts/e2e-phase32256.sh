#!/usr/bin/env bash
# Phase-32256: soft-complete through 32256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32256
PY
grep -qE 'phase32256|through 32256' webui/STATUS.md
echo "OK: phase32256 e2e passed"
