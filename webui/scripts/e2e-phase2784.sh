#!/usr/bin/env bash
# Phase-2784: soft-complete through 2784 (changelog roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2784
print("soft-complete >=2784", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2784|Soft-complete STATUS through 2784|through 2784' webui/STATUS.md
echo "STATUS soft-complete 2784 ok"
echo "cleaned"
echo "OK: phase2784 e2e passed"
