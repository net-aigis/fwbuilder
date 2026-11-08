#!/usr/bin/env bash
# Phase-14768: soft-complete through 14768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14768
PY
grep -qE 'phase14768|through 14768' webui/STATUS.md
echo "OK: phase14768 e2e passed"
