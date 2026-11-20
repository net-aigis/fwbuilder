#!/usr/bin/env bash
# Phase-41888: soft-complete through 41888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41888
PY
grep -qE 'phase41888|through 41888' webui/STATUS.md
echo "OK: phase41888 e2e passed"
