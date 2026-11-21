#!/usr/bin/env bash
# Phase-2635: export titles/notes include honesty_bundle_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honesty_bundle_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "honesty_bundle_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "honesty_bundle_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "honesty_bundle_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("honesty_bundle_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase2635 e2e passed"
