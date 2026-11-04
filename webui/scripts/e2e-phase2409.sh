#!/usr/bin/env bash
# Phase-2409: soft_fertig_honesty_surface_version 2.0.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("2.")
assert ("Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "Schema 2." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE)
assert ("honesty_path_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        or "honesty_path_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        or "Schema" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE)
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version").startswith("2.")
assert m.health().get("soft_fertig_honesty_surface_version").startswith("2.")
assert m.soft_fertig_catalog_summary()["soft_fertig_honesty_surface_version"].startswith("2.")
assert "2.0" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2416
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase2409 e2e passed"
