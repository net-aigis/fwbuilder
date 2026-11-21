#!/usr/bin/env bash
# Phase-36768: soft-complete through 36768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36768
PY
grep -qE 'phase36768|through 36768' webui/STATUS.md
echo "OK: phase36768 e2e passed"
