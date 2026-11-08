#!/usr/bin/env bash
# Phase-10009: soft_fertig_honesty_surface_version 5.65.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION in ("5.65",)
assert "Schema 5." in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "ssh" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") in ("5.65",)
assert m.health().get("soft_fertig_honesty_surface_version") in ("5.65",)
assert "5.65" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10024
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"; echo "OK: phase10009 e2e passed"
