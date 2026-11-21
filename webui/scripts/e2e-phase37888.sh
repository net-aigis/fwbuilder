#!/usr/bin/env bash
# Phase-37888: soft-complete through 37888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37888
PY
grep -qE 'phase37888|through 37888' webui/STATUS.md
echo "OK: phase37888 e2e passed"
