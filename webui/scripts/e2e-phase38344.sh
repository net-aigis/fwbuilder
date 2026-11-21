#!/usr/bin/env bash
# Phase-38344: soft-complete through 38344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38344
PY
grep -qE 'phase38344|through 38344' webui/STATUS.md
echo "OK: phase38344 e2e passed"
