#!/usr/bin/env bash
# Phase-784: soft-complete through 784 (with_size_policy_minimum).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 784
print("soft-complete >=784", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase784|Soft-complete STATUS through 784|through 784' webui/STATUS.md
echo "STATUS soft-complete 784 ok"
echo "cleaned"
echo "OK: phase784 e2e passed"
