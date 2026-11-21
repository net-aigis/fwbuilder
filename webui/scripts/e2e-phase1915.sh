#!/usr/bin/env bash
# Phase-1915: export/bundle notes mention readiness.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "readiness" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "readiness" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
assert "soft_fertig_honesty_readiness" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES["readiness"]
print("readiness notes ok")
PY
echo "cleaned"
echo "OK: phase1915 e2e passed"
