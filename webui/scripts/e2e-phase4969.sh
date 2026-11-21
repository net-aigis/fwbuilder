#!/usr/bin/env bash
# Phase-4969: soft_fertig_honesty_surface_version 5.2.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "5.2"
assert "Schema 5.2" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "ssh_alternatives" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") == "5.2"
assert m.health().get("soft_fertig_honesty_surface_version") == "5.2"
assert "5.2" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4976
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"; echo "OK: phase4969 e2e passed"
