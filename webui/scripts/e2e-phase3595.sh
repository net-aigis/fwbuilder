#!/usr/bin/env bash
# Phase-3595: export titles/notes include surface_changelog_meta_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("surface_changelog_meta_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase3595 e2e passed"
