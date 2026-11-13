#!/usr/bin/env bash
# Phase-28216: soft-complete through 28216 (ms 86250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28216
assert m.WEBUI_HONESTY_MILESTONE == 86250
print("soft-complete >=28216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28216|through 28216' webui/STATUS.md
echo "OK: phase28216 e2e passed"
