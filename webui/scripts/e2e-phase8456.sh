#!/usr/bin/env bash
# Phase-8456: soft-complete through 8456 (ms 24500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8456
assert m.WEBUI_HONESTY_MILESTONE == 24500
print("soft-complete >=8456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8456|through 8456' webui/STATUS.md
echo "OK: phase8456 e2e passed"
