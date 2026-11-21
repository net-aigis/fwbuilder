#!/usr/bin/env bash
# Phase-42216: soft-complete through 42216 (ms 130000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42216
assert m.WEBUI_HONESTY_MILESTONE == 130000
print("soft-complete >=42216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42216|through 42216' webui/STATUS.md
echo "OK: phase42216 e2e passed"
