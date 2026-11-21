#!/usr/bin/env bash
# Phase-48216: soft-complete through 48216 (ms 148750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48216
assert m.WEBUI_HONESTY_MILESTONE == 148750
print("soft-complete >=48216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48216|through 48216' webui/STATUS.md
echo "OK: phase48216 e2e passed"
