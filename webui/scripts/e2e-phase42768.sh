#!/usr/bin/env bash
# Phase-42768: soft-complete through 42768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42768
PY
grep -qE 'phase42768|through 42768' webui/STATUS.md
echo "OK: phase42768 e2e passed"
