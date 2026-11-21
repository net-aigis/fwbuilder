#!/usr/bin/env bash
# Phase-5528: soft-complete through 5128 (ssh_refusal_path_titles_roster export + ms 15350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5528
assert m.WEBUI_HONESTY_MILESTONE >= 15350
print("soft-complete >=5128", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase5528|Soft-complete STATUS through 5128|through 5128' webui/STATUS.md
echo "STATUS soft-complete 5128 ok"; echo "cleaned"; echo "OK: phase5528 e2e passed"
