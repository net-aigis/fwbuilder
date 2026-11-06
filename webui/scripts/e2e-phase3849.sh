#!/usr/bin/env bash
# Phase-3849: soft_fertig_honesty_surface_version 3.8.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
assert ("Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "Schema 2." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "Schema 3." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE)
assert ("health_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        or "Schema" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE)
h = m.hard_gaps()
assert str(h.get("soft_fertig_honesty_surface_version") or "").startswith("3.")
assert str(m.health().get("soft_fertig_honesty_surface_version") or "").startswith("3.")
assert str(m.soft_fertig_honesty_readiness()["soft_fertig_honesty_surface_version"]).startswith("3.")
assert "3.8" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3856
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase3849 e2e passed"
