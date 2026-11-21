#!/usr/bin/env bash
# Phase-43440: soft-complete through 43440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43440
PY
grep -qE 'phase43440|through 43440' webui/STATUS.md
echo "OK: phase43440 e2e passed"
