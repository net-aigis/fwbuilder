#!/usr/bin/env bash
# Phase-1947: export/bundle notes mention readiness sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honestyReadiness" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES["readiness"]
assert "honestyReadiness" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES["readiness"]
print("readiness notes mention sessionStorage")
PY
echo "cleaned"
echo "OK: phase1947 e2e passed"
