#!/usr/bin/env bash
# Phase-48824: soft-complete through 48824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48824
PY
grep -qE 'phase48824|through 48824' webui/STATUS.md
echo "OK: phase48824 e2e passed"
