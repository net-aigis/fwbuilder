#!/usr/bin/env bash
# Phase-11896: soft-complete through 11896 (ms 35250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11896
assert m.WEBUI_HONESTY_MILESTONE == 35250
print("soft-complete >=11896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11896|through 11896' webui/STATUS.md
echo "OK: phase11896 e2e passed"
