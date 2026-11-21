#!/usr/bin/env bash
# Phase-5915: export titles/notes include ssh_batch_mode_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "ssh_batch_mode_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEY_TITLES
assert "ssh_batch_mode_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "ssh_batch_mode_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_SECTION_TITLES
assert "ssh_batch_mode_roster" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
print("ssh_batch_mode_roster titles/notes ok")
PY
echo "cleaned"; echo "OK: phase5915 e2e passed"
