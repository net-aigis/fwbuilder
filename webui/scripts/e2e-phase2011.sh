#!/usr/bin/env bash
# Phase-2011: export/bundle notes mention soft_complete_note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "soft_complete_note" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "soft_complete_note" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
assert "soft_fertig_soft_complete_note" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES["soft_complete_note"]
print("soft_complete_note notes ok")
PY
echo "cleaned"
echo "OK: phase2011 e2e passed"
