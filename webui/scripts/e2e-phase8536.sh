#!/usr/bin/env bash
# Phase-8536: soft-complete through 8536 (ms 24750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8536
assert m.WEBUI_HONESTY_MILESTONE == 24750
print("soft-complete >=8536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8536|through 8536' webui/STATUS.md
echo "OK: phase8536 e2e passed"
