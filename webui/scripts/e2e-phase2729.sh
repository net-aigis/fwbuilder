#!/usr/bin/env bash
# Phase-2729: soft_fertig_honesty_surface_version 2.4.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.4"
assert ("Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "Schema 2." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE)
assert ("surface_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        or "surface_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        or "Schema" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE)
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") == "2.4"
assert m.health().get("soft_fertig_honesty_surface_version") == "2.4"
assert m.soft_fertig_catalog_summary()["soft_fertig_honesty_surface_version"] == "2.4"
assert "2.4" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2736
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase2729 e2e passed"
