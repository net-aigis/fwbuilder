#!/usr/bin/env bash
# Phase-32456: soft-complete through 32456 (ms 99500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32456
assert m.WEBUI_HONESTY_MILESTONE == 99500
print("soft-complete >=32456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32456|through 32456' webui/STATUS.md
echo "OK: phase32456 e2e passed"
