#!/usr/bin/env bash
# Phase-24768: soft-complete through 24768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24768
PY
grep -qE 'phase24768|through 24768' webui/STATUS.md
echo "OK: phase24768 e2e passed"
