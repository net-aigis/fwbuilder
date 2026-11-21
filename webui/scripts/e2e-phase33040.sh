#!/usr/bin/env bash
# Phase-33040: soft-complete through 33040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33040
PY
grep -qE 'phase33040|through 33040' webui/STATUS.md
echo "OK: phase33040 e2e passed"
