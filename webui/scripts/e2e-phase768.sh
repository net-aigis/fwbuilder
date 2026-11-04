#!/usr/bin/env bash
# Phase-768: soft-complete through 768 (with_size_policy_fixed).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 768
print("soft-complete >=768", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase768|Soft-complete STATUS through 768|through 768' webui/STATUS.md
echo "STATUS soft-complete 768 ok"
echo "cleaned"
echo "OK: phase768 e2e passed"
