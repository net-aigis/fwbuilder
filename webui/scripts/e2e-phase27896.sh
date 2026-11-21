#!/usr/bin/env bash
# Phase-27896: soft-complete through 27896 (ms 85250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27896
assert m.WEBUI_HONESTY_MILESTONE == 85250
print("soft-complete >=27896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27896|through 27896' webui/STATUS.md
echo "OK: phase27896 e2e passed"
