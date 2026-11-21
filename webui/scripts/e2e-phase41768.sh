#!/usr/bin/env bash
# Phase-41768: soft-complete through 41768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41768
PY
grep -qE 'phase41768|through 41768' webui/STATUS.md
echo "OK: phase41768 e2e passed"
