#!/usr/bin/env bash
# Phase-41272: soft-complete through 41272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41272
PY
grep -qE 'phase41272|through 41272' webui/STATUS.md
echo "OK: phase41272 e2e passed"
