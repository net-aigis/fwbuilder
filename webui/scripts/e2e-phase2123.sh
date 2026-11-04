#!/usr/bin/env bash
# Phase-2123: export/bundle notes mention surface_changelog sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honestySurfaceChangelog" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES["surface_changelog"]
assert "honestySurfaceChangelog" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES["surface_changelog"]
print("surface_changelog notes mention sessionStorage")
PY
echo "cleaned"
echo "OK: phase2123 e2e passed"
