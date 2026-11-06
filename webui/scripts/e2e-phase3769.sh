#!/usr/bin/env bash
# Phase-3769: soft_fertig_honesty_surface_version 3.7.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "3.7"
assert ("Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "Schema 2." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "Schema 3." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE)
assert ("hard_gaps_closure_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        or "Schema" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE)
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") == "3.7"
assert m.health().get("soft_fertig_honesty_surface_version") == "3.7"
assert m.soft_fertig_honesty_readiness()["soft_fertig_honesty_surface_version"] == "3.7"
assert "3.7" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3776
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase3769 e2e passed"
