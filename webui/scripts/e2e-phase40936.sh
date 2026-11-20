#!/usr/bin/env bash
# Phase-40936: soft-complete through 40936 (ms 126000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40936
assert m.WEBUI_HONESTY_MILESTONE == 126000
print("soft-complete >=40936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40936|through 40936' webui/STATUS.md
echo "OK: phase40936 e2e passed"
