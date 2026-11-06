#!/usr/bin/env bash
# Phase-3995: export titles/notes include hard_gaps_field_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "hard_gaps_field_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("hard_gaps_field_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase3995 e2e passed"
