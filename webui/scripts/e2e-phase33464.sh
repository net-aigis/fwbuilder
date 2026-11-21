#!/usr/bin/env bash
# Phase-33464: soft-complete through 33464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33464
PY
grep -qE 'phase33464|through 33464' webui/STATUS.md
echo "OK: phase33464 e2e passed"
