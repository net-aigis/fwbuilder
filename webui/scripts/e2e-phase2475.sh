#!/usr/bin/env bash
# Phase-2475: export titles/notes include session_storage_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "session_storage_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "session_storage_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "session_storage_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "session_storage_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("session_storage_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase2475 e2e passed"
