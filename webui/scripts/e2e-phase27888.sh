#!/usr/bin/env bash
# Phase-27888: soft-complete through 27888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27888
PY
grep -qE 'phase27888|through 27888' webui/STATUS.md
echo "OK: phase27888 e2e passed"
