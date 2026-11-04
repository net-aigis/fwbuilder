#!/usr/bin/env bash
# Phase-2025: soft_fertig_honesty_surface_version 1.5.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "1.5"
assert "Schema 1.5" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "soft_complete_note" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") == "1.5"
assert m.health().get("soft_fertig_honesty_surface_version") == "1.5"
assert m.soft_fertig_catalog_summary()["soft_fertig_honesty_surface_version"] == "1.5"
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2032
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase2025 e2e passed"
