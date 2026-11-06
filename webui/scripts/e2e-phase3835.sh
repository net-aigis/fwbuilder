#!/usr/bin/env bash
# Phase-3835: export titles/notes include health_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "health_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "health_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "health_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "health_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("health_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase3835 e2e passed"
