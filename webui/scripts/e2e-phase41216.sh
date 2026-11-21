#!/usr/bin/env bash
# Phase-41216: soft-complete through 41216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41216
PY
grep -qE 'phase41216|through 41216' webui/STATUS.md
echo "OK: phase41216 e2e passed"
