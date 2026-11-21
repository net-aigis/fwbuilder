#!/usr/bin/env bash
# Phase-2875: export titles/notes include expect_step_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "expect_step_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "expect_step_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "expect_step_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "expect_step_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("expect_step_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase2875 e2e passed"
