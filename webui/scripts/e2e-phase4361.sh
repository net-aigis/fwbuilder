#!/usr/bin/env bash
# Phase-4361: Soft 4360+ honesty surface still complete (expect_run_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_EXPECT_RUN_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4360
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "expect_run_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "expect_run_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_expect_run_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4368
print("Soft 4360+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase4361 e2e passed"
