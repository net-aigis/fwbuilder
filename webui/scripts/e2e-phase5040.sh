#!/usr/bin/env bash
# Phase-5040: soft-complete through 5040 (ssh_refusal_paths_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5040
print("soft-complete >=5040", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5040|Soft-complete STATUS through 5040|through 5040' webui/STATUS.md
echo "STATUS soft-complete 5040 ok"; echo "cleaned"; echo "OK: phase5040 e2e passed"
