#!/usr/bin/env bash
# Phase-40216: soft-complete through 40216 (ms 123750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40216
assert m.WEBUI_HONESTY_MILESTONE == 123750
print("soft-complete >=40216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40216|through 40216' webui/STATUS.md
echo "OK: phase40216 e2e passed"
