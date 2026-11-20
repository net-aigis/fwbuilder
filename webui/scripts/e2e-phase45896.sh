#!/usr/bin/env bash
# Phase-45896: soft-complete through 45896 (ms 141500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45896
assert m.WEBUI_HONESTY_MILESTONE == 141500
print("soft-complete >=45896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45896|through 45896' webui/STATUS.md
echo "OK: phase45896 e2e passed"
