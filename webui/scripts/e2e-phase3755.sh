#!/usr/bin/env bash
# Phase-3755: export titles/notes include hard_gaps_closure_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "hard_gaps_closure_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "hard_gaps_closure_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "hard_gaps_closure_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "hard_gaps_closure_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("hard_gaps_closure_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase3755 e2e passed"
