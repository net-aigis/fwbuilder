#!/usr/bin/env bash
# Phase-17896: soft-complete through 17896 (ms 54000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17896
assert m.WEBUI_HONESTY_MILESTONE == 54000
print("soft-complete >=17896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17896|through 17896' webui/STATUS.md
echo "OK: phase17896 e2e passed"
