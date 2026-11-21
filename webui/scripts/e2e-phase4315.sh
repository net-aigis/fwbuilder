#!/usr/bin/env bash
# Phase-4315: export titles/notes include expect_run_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "expect_run_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "expect_run_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "expect_run_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "expect_run_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("expect_run_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase4315 e2e passed"
