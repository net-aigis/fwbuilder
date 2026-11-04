#!/usr/bin/env bash
# Phase-2155: export/bundle notes mention operator_brief.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "operator_brief" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES
assert "operator_brief" in m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES
assert "soft_fertig_honesty_operator_brief" in m.SOFT_FERTIG_HONESTY_EXPORT_NOTES["operator_brief"]
print("operator_brief notes ok")
PY
echo "cleaned"
echo "OK: phase2155 e2e passed"
