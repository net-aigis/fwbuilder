#!/usr/bin/env bash
# Phase-6249: soft_fertig_honesty_surface_version 5.18.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION in ("5.18",)
assert "Schema 5." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "ssh" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") in ("5.18",)
assert m.health().get("soft_fertig_honesty_surface_version") in ("5.18",)
assert "5.18" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6256
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"; echo "OK: phase6249 e2e passed"
