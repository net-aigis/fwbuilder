#!/usr/bin/env bash
# Phase-1851: export/bundle notes mention track_note sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honestyTrackNote" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES["track_note"]
assert "honestyTrackNote" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES["track_note"]
print("track_note notes mention sessionStorage")
PY
echo "cleaned"
echo "OK: phase1851 e2e passed"
