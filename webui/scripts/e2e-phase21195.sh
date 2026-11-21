#!/usr/bin/env bash
# Phase-21195: export titles/notes include ssh_alternative_notes_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_alternative_notes_refresh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "ssh_alternative_notes_refresh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "ssh_alternative_notes_refresh_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "ssh_alternative_notes_refresh_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("ssh_alternative_notes_refresh_roster titles/notes ok")
PY
echo "cleaned"; echo "OK: phase21195 e2e passed"
