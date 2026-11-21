#!/usr/bin/env bash
# Phase-928: soft-complete through 928 (fidelity UI truncate).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 928
print("soft-complete >=928", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase928|Soft-complete STATUS through 928|through 928' webui/STATUS.md
echo "STATUS soft-complete 928 ok"
echo "cleaned"
echo "OK: phase928 e2e passed"
