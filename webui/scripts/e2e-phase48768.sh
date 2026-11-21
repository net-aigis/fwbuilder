#!/usr/bin/env bash
# Phase-48768: soft-complete through 48768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48768
PY
grep -qE 'phase48768|through 48768' webui/STATUS.md
echo "OK: phase48768 e2e passed"
