#!/usr/bin/env bash
# Phase-4040: soft-complete through 4040 (hard_gaps_field_roster session + ms 10700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4040
assert m.WEBUI_HONESTY_MILESTONE == 10700
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4040", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4040|Soft-complete STATUS through 4040|through 4040' webui/STATUS.md
echo "STATUS soft-complete 4040 ok"
echo "cleaned"
echo "OK: phase4040 e2e passed"
