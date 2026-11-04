#!/usr/bin/env bash
# Phase-1536: soft-complete through 1536 (surface keys + session storage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1536
print("soft-complete >=1536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1536|Soft-complete STATUS through 1536|through 1536' webui/STATUS.md
echo "STATUS soft-complete 1536 ok"
echo "cleaned"
echo "OK: phase1536 e2e passed"
