#!/usr/bin/env bash
# Phase-1721: soft_fertig_honesty_surface_version on hard-gaps (+ summary/closure/surface).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
assert "Schema 1." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "soft_fertig_honesty_surface_version" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
s = m.hard_gaps_summary()
c = m.hard_gap_closure()
assert str(h.get("soft_fertig_honesty_surface_version") or "").startswith(("1.", "2."))
assert "Schema 1." in (h.get("soft_fertig_honesty_surface_version_note") or "")
assert str(s.get("soft_fertig_honesty_surface_version") or "").startswith(("1.", "2."))
assert str(c.get("soft_fertig_honesty_surface_version") or "").startswith(("1.", "2."))
assert "soft_fertig_honesty_surface_version" in (h.get("soft_fertig_surface_keys") or [])
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1728
print("surface version", h.get("soft_fertig_honesty_surface_version"))
PY
echo "cleaned"
echo "OK: phase1721 e2e passed"
