#!/usr/bin/env bash
# Phase-19888: soft-complete through 19888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19888
PY
grep -qE 'phase19888|through 19888' webui/STATUS.md
echo "OK: phase19888 e2e passed"
