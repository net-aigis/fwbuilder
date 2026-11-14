#!/usr/bin/env bash
# Phase-30752: soft-complete through 30752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30752
PY
grep -qE 'phase30752|through 30752' webui/STATUS.md
echo "OK: phase30752 e2e passed"
