#!/usr/bin/env bash
# Phase-1929: soft_fertig_honesty_surface_version 1.3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
assert "Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "readiness" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "catalogs_complete" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
h = m.hard_gaps()
assert str(h.get("soft_fertig_honesty_surface_version") or "").startswith(("1.", "2."))
assert str(m.health().get("soft_fertig_honesty_surface_version") or "").startswith(("1.", "2."))
assert str(m.soft_fertig_catalog_summary()["soft_fertig_honesty_surface_version"]).startswith(("1.", "2."))
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1936
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase1929 e2e passed"
