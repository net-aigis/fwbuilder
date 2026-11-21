#!/usr/bin/env bash
# Phase-4155: export titles/notes include stack_switch_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "stack_switch_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "stack_switch_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "stack_switch_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "stack_switch_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("stack_switch_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase4155 e2e passed"
