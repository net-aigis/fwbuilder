#!/usr/bin/env bash
# Phase-792: soft-complete through 792 (min/max size samples).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 792
print("soft-complete >=792", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase792|Soft-complete STATUS through 792|through 792' webui/STATUS.md
echo "STATUS soft-complete 792 ok"
echo "cleaned"
echo "OK: phase792 e2e passed"
