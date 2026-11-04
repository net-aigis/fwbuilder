#!/usr/bin/env bash
# Phase-2091: export/bundle notes mention surface_changelog.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "surface_changelog" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "surface_changelog" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
assert "soft_fertig_honesty_surface_changelog" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES["surface_changelog"]
print("surface_changelog notes ok")
PY
echo "cleaned"
echo "OK: phase2091 e2e passed"
