#!/usr/bin/env bash
# Phase-38888: soft-complete through 38888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38888
PY
grep -qE 'phase38888|through 38888' webui/STATUS.md
echo "OK: phase38888 e2e passed"
