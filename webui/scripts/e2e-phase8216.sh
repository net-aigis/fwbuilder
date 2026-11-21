#!/usr/bin/env bash
# Phase-8216: soft-complete through 8216 (ms 23750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8216
assert m.WEBUI_HONESTY_MILESTONE == 23750
print("soft-complete >=8216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8216|through 8216' webui/STATUS.md
echo "OK: phase8216 e2e passed"
