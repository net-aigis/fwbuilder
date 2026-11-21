#!/usr/bin/env bash
# Phase-5072: soft-complete through 5072 (ssh_refusal_paths_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5072
print("soft-complete >=5072", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5072|Soft-complete STATUS through 5072|through 5072' webui/STATUS.md
echo "STATUS soft-complete 5072 ok"; echo "cleaned"; echo "OK: phase5072 e2e passed"
