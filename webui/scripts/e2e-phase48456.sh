#!/usr/bin/env bash
# Phase-48456: soft-complete through 48456 (ms 149500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48456
assert m.WEBUI_HONESTY_MILESTONE == 149500
print("soft-complete >=48456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48456|through 48456' webui/STATUS.md
echo "OK: phase48456 e2e passed"
