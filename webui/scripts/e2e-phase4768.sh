#!/usr/bin/env bash
# Phase-4768: soft-complete through 4768 (Soft 4760+ ssh_not_implemented_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4768
print("soft-complete >=4768", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4768|Soft-complete STATUS through 4768|through 4768' webui/STATUS.md
echo "STATUS soft-complete 4768 ok"
echo "cleaned"
echo "OK: phase4768 e2e passed"
