#!/usr/bin/env bash
# Phase-4489: soft_fertig_honesty_surface_version 4.0.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "4.6"
assert (
    "Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
    or "Schema 2." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
    or "Schema 3." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
    or "Schema 4." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
)
assert (
    "expect_steps_refusals_roster" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
    or "Schema" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
)
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") == "4.6"
assert m.health().get("soft_fertig_honesty_surface_version") == "4.6"
assert m.soft_fertig_honesty_readiness()["soft_fertig_honesty_surface_version"] == "4.6"
assert "4.6" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4496
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"
echo "OK: phase4489 e2e passed"
