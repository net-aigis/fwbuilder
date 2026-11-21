#!/usr/bin/env bash
# Phase-4635: export titles/notes include password_ssh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "password_ssh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "password_ssh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "password_ssh_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "password_ssh_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("password_ssh_roster titles/notes ok")
PY
echo "cleaned"
echo "OK: phase4635 e2e passed"
