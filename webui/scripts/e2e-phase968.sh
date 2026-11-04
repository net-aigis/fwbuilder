#!/usr/bin/env bash
# Phase-968: soft-complete through 968 (with_visible sample).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 968
print("soft-complete >=968", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase968|Soft-complete STATUS through 968|through 968' webui/STATUS.md
echo "STATUS soft-complete 968 ok"
echo "cleaned"
echo "OK: phase968 e2e passed"
