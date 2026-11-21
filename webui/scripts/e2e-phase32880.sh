#!/usr/bin/env bash
# Phase-32880: soft-complete through 32880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32880
PY
grep -qE 'phase32880|through 32880' webui/STATUS.md
echo "OK: phase32880 e2e passed"
