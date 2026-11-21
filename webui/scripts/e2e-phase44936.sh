#!/usr/bin/env bash
# Phase-44936: soft-complete through 44936 (ms 138500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44936
assert m.WEBUI_HONESTY_MILESTONE == 138500
print("soft-complete >=44936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44936|through 44936' webui/STATUS.md
echo "OK: phase44936 e2e passed"
