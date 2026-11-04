#!/usr/bin/env bash
# Phase-618: res-status honesty fields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
r = m.res_status()
assert r.get("honesty_milestone") == m.WEBUI_HONESTY_MILESTONE
assert r.get("soft_fertig_honesty_track") is True
assert r.get("hard_gap_count") == len(m.HARD_GAPS_OPEN)
assert "hard_gap_open" in r
print("res-status honesty ok")
PY
echo "cleaned"
echo "OK: phase618 e2e passed"
