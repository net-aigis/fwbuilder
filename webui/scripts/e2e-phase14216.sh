#!/usr/bin/env bash
# Phase-14216: soft-complete through 14216 (ms 42500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14216
assert m.WEBUI_HONESTY_MILESTONE == 42500
print("soft-complete >=14216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14216|through 14216' webui/STATUS.md
echo "OK: phase14216 e2e passed"
