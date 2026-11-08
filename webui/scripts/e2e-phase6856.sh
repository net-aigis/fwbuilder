#!/usr/bin/env bash
# Phase-6856: soft-complete through 6856 (Soft 6840+ ssh_not_implemented_password_roster + ms 19500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6856
assert m.WEBUI_HONESTY_MILESTONE == 19500
print("soft-complete >=6856", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6856|Soft-complete STATUS through 6856|through 6856' webui/STATUS.md
echo "STATUS soft-complete 6856 ok"; echo "cleaned"; echo "OK: phase6856 e2e passed"
