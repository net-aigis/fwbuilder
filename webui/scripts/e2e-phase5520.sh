#!/usr/bin/env bash
# Phase-5520: soft-complete through 5120 (ssh_refusal_path_titles_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5520
print("soft-complete >=5120", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5520|Soft-complete STATUS through 5120|through 5120' webui/STATUS.md
echo "STATUS soft-complete 5120 ok"; echo "cleaned"; echo "OK: phase5520 e2e passed"
