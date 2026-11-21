#!/usr/bin/env bash
# Phase-3275: export titles/notes include catalog_summary_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "catalog_summary_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "catalog_summary_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "catalog_summary_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "catalog_summary_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("catalog_summary_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase3275 e2e passed"
