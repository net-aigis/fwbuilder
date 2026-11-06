#!/usr/bin/env bash
# Phase-3515: export titles/notes include honesty_operator_brief_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("honesty_operator_brief_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase3515 e2e passed"
