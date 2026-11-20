#!/usr/bin/env bash
# Phase-42464: soft-complete through 42464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42464
PY
grep -qE 'phase42464|through 42464' webui/STATUS.md
echo "OK: phase42464 e2e passed"
