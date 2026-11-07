#!/usr/bin/env bash
# Phase-5049: soft_fertig_honesty_surface_version 5.3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "5.3"
assert "Schema 5.3" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
assert "ssh_refusal_paths" in m.SOFT_FERTIG_HONESTY_SURFACE_VERSION_NOTE
h = m.hard_gaps()
assert h.get("soft_fertig_honesty_surface_version") == "5.3"
assert m.health().get("soft_fertig_honesty_surface_version") == "5.3"
assert "5.3" in (m.soft_fertig_honesty_surface_changelog().get("versions") or {})
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5056
print("surface version", m.SOFT_FERTIG_HONESTY_SURFACE_VERSION)
PY
echo "cleaned"; echo "OK: phase5049 e2e passed"
