#!/usr/bin/env bash
# Phase-1497: UI expandable sessionStorage keys detail.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorageKeysDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig sessionStorage keys' webui/frontend/src/components/FirewallExtras.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert int(h.get("soft_fertig_session_storage_key_count") or 0) >= 5
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1504
print("sessionStorage detail data ok")
PY
echo "cleaned"
echo "OK: phase1497 e2e passed"
