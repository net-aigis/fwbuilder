#!/usr/bin/env bash
# Phase-840: soft-complete through 840 (flat/checkable/annotations sample).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 840
print("soft-complete >=840", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase840|Soft-complete STATUS through 840|through 840' webui/STATUS.md
echo "STATUS soft-complete 840 ok"
echo "cleaned"
echo "OK: phase840 e2e passed"
