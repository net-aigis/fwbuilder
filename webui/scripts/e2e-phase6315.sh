#!/usr/bin/env bash
# Phase-6315: export titles/notes include ssh_not_implemented_batch_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_not_implemented_batch_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "ssh_not_implemented_batch_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "ssh_not_implemented_batch_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "ssh_not_implemented_batch_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("ssh_not_implemented_batch_roster titles/notes ok")
PY
echo "cleaned"; echo "OK: phase6315 e2e passed"
