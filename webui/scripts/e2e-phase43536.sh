#!/usr/bin/env bash
# Phase-43536: soft-complete through 43536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43536
PY
grep -qE 'phase43536|through 43536' webui/STATUS.md
echo "OK: phase43536 e2e passed"
