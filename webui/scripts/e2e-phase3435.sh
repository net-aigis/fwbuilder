#!/usr/bin/env bash
# Phase-3435: export titles/notes include session_storage_clear_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "session_storage_clear_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "session_storage_clear_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "session_storage_clear_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "session_storage_clear_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("session_storage_clear_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase3435 e2e passed"
