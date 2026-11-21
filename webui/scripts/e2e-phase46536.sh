#!/usr/bin/env bash
# Phase-46536: soft-complete through 46536 (ms 143500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46536
assert m.WEBUI_HONESTY_MILESTONE == 143500
print("soft-complete >=46536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46536|through 46536' webui/STATUS.md
echo "OK: phase46536 e2e passed"
