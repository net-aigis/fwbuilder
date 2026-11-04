#!/usr/bin/env bash
# Phase-2105: soft_fertig_honesty_surface_version 1.6.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
assert "Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "surface_changelog" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "changelog" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "operator_brief" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "hard_gap_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "hard_gap_refusal_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE or "honesty_path_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
h = m.hard_gaps()
assert str(h.get("soft_fertig_honesty_surface_version") or "").startswith(("1.", "2."))
assert str(m.health().get("soft_fertig_honesty_surface_version") or "").startswith(("1.", "2."))
assert str(m.soft_fertig_catalog_summary()["soft_fertig_honesty_surface_version"]).startswith(("1.", "2."))
assert "1.6" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2112
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase2105 e2e passed"
