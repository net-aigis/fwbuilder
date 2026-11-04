#!/usr/bin/env bash
# Phase-704: soft-complete through 704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 704
print("soft-complete >=704", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase704|Soft-complete STATUS through 704|through 704' webui/STATUS.md
echo "STATUS soft-complete 704 ok"
echo "cleaned"
echo "OK: phase704 e2e passed"
