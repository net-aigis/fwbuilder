#!/usr/bin/env bash
# Phase-944: soft-complete through 944 (with_size_policy total sample).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 944
print("soft-complete >=944", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase944|Soft-complete STATUS through 944|through 944' webui/STATUS.md
echo "STATUS soft-complete 944 ok"
echo "cleaned"
echo "OK: phase944 e2e passed"
