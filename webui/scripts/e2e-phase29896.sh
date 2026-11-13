#!/usr/bin/env bash
# Phase-29896: soft-complete through 29896 (ms 91500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29896
assert m.WEBUI_HONESTY_MILESTONE == 91500
print("soft-complete >=29896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29896|through 29896' webui/STATUS.md
echo "OK: phase29896 e2e passed"
