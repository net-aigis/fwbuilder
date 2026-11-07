#!/usr/bin/env bash
# Phase-4809: soft_fertig_honesty_surface_version 5.0.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "5.0"
assert "Schema 5.0" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "ssh_implemented" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") == "5.0"
assert m.health().get("soft_fertig_honesty_surface_version") == "5.0"
assert "5.0" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4816
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"; echo "OK: phase4809 e2e passed"
