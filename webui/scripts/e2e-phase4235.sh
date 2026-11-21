#!/usr/bin/env bash
# Phase-4235: export titles/notes include option_enable_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "option_enable_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "option_enable_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "option_enable_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "option_enable_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("option_enable_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase4235 e2e passed"
