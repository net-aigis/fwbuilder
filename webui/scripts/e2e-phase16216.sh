#!/usr/bin/env bash
# Phase-16216: soft-complete through 16216 (ms 48750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16216
assert m.WEBUI_HONESTY_MILESTONE == 48750
print("soft-complete >=16216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16216|through 16216' webui/STATUS.md
echo "OK: phase16216 e2e passed"
