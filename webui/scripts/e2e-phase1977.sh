#!/usr/bin/env bash
# Phase-1977: soft_fertig_honesty_surface_version 1.4.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "1.4"
assert "Schema 1.4" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "catalogs_complete" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "hard_gaps_remain" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") == "1.4"
assert m.health().get("soft_fertig_honesty_surface_version") == "1.4"
assert m.soft_fertig_catalog_summary()["soft_fertig_honesty_surface_version"] == "1.4"
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1984
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase1977 e2e passed"
