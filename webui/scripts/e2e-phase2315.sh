#!/usr/bin/env bash
# Phase-2315: export titles/notes include hard_gap_refusal_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "hard_gap_refusal_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "hard_gap_refusal_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "hard_gap_refusal_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "hard_gap_refusal_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("hard_gap_refusal_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase2315 e2e passed"
