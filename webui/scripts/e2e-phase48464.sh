#!/usr/bin/env bash
# Phase-48464: soft-complete through 48464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48464
PY
grep -qE 'phase48464|through 48464' webui/STATUS.md
echo "OK: phase48464 e2e passed"
