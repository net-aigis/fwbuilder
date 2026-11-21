#!/usr/bin/env bash
# Phase-1513: UI download/copy sessionStorage keys buttons.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Download sessionStorage keys' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Copy sessionStorage keys' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb-session-storage-keys-' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert int(h.get("soft_fertig_session_storage_key_count") or 0) >= 5
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1520
print("sessionStorage keys download data ok")
PY
echo "cleaned"
echo "OK: phase1513 e2e passed"
