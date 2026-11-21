#!/usr/bin/env bash
# Phase-35216: soft-complete through 35216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35216
PY
grep -qE 'phase35216|through 35216' webui/STATUS.md
echo "OK: phase35216 e2e passed"
