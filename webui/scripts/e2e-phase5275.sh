#!/usr/bin/env bash
# Phase-5275: export titles/notes include ssh_auth_policy_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_auth_policy_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "ssh_auth_policy_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "ssh_auth_policy_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "ssh_auth_policy_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("ssh_auth_policy_roster titles/notes ok")
PY
echo "cleaned"; echo "OK: phase5275 e2e passed"
