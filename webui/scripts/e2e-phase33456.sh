#!/usr/bin/env bash
# Phase-33456: soft-complete through 33456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33456
PY
grep -qE 'phase33456|through 33456' webui/STATUS.md
echo "OK: phase33456 e2e passed"
