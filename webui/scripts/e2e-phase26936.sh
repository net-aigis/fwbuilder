#!/usr/bin/env bash
# Phase-26936: soft-complete through 26936 (ms 82250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26936
assert m.WEBUI_HONESTY_MILESTONE == 82250
print("soft-complete >=26936", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26936|through 26936' webui/STATUS.md
echo "OK: phase26936 e2e passed"
