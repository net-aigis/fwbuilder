#!/usr/bin/env bash
# Phase-3915: export titles/notes include res_status_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "res_status_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "res_status_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "res_status_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "res_status_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("res_status_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase3915 e2e passed"
