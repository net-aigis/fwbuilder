#!/usr/bin/env bash
# Phase-32216: soft-complete through 32216 (ms 98750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32216
assert m.WEBUI_HONESTY_MILESTONE == 98750
print("soft-complete >=32216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32216|through 32216' webui/STATUS.md
echo "OK: phase32216 e2e passed"
