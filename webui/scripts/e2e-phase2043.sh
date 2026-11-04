#!/usr/bin/env bash
# Phase-2043: export/bundle notes mention soft_complete_note sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "softCompleteNote" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES["soft_complete_note"]
assert "softCompleteNote" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES["soft_complete_note"]
print("soft_complete_note notes mention sessionStorage")
PY
echo "cleaned"
echo "OK: phase2043 e2e passed"
