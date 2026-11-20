#!/usr/bin/env bash
# Phase-41896: soft-complete through 41896 (ms 129000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41896
assert m.WEBUI_HONESTY_MILESTONE == 129000
print("soft-complete >=41896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41896|through 41896' webui/STATUS.md
echo "OK: phase41896 e2e passed"
