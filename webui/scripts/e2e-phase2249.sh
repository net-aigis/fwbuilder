#!/usr/bin/env bash
# Phase-2249: soft_fertig_honesty_surface_version 1.8.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION .startswith("1.")
assert "Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert ("hard_gap_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        or "hard_gap_refusal_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
        or "Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE)
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") .startswith("1.")
assert m.health().get("soft_fertig_honesty_surface_version") .startswith("1.")
assert m.soft_fertig_catalog_summary()["soft_fertig_honesty_surface_version"] .startswith("1.")
assert "1.8" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2256
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase2249 e2e passed"
