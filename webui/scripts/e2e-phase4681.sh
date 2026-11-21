#!/usr/bin/env bash
# Phase-4681: Soft 4680+ honesty surface still complete (password_ssh_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_PASSWORD_SSH_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4680
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "password_ssh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "password_ssh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_password_ssh_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4688
print("Soft 4680+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase4681 e2e passed"
