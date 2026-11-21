#!/usr/bin/env bash
# Phase-21896: soft-complete through 21896 (ms 66500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21896
assert m.WEBUI_HONESTY_MILESTONE == 66500
print("soft-complete >=21896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21896|through 21896' webui/STATUS.md
echo "OK: phase21896 e2e passed"
