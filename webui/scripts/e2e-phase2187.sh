#!/usr/bin/env bash
# Phase-2187: export/bundle notes mention operator_brief sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honestyOperatorBrief" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES["operator_brief"]
assert "honestyOperatorBrief" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES["operator_brief"]
print("operator_brief notes mention sessionStorage")
PY
echo "cleaned"
echo "OK: phase2187 e2e passed"
