#!/usr/bin/env bash
# Phase-2795: export titles/notes include changelog_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "changelog_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "changelog_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "changelog_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "changelog_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("changelog_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase2795 e2e passed"
