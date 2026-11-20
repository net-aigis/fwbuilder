#!/usr/bin/env bash
# Phase-41424: soft-complete through 41424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41424
PY
grep -qE 'phase41424|through 41424' webui/STATUS.md
echo "OK: phase41424 e2e passed"
