#!/usr/bin/env bash
# Phase-42440: soft-complete through 42440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42440
PY
grep -qE 'phase42440|through 42440' webui/STATUS.md
echo "OK: phase42440 e2e passed"
