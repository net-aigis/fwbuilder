#!/usr/bin/env bash
# Phase-1689: clear catalog still on API (UI detail data).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert int(h.get("soft_fertig_session_storage_clear_key_count") or 0) >= 6
assert "Clear honesty catalogs" in (h.get("soft_fertig_session_storage_clear_note") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1696
print("clear catalog data ok")
PY
echo "cleaned"
echo "OK: phase1689 e2e passed"
