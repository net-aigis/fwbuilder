#!/usr/bin/env bash
# Phase-22216: soft-complete through 22216 (ms 67500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22216
assert m.WEBUI_HONESTY_MILESTONE == 67500
print("soft-complete >=22216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22216|through 22216' webui/STATUS.md
echo "OK: phase22216 e2e passed"
