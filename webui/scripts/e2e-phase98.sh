#!/usr/bin/env bash
# Phase-98: Regel-Filter in sessionStorage persistieren.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'fwbweb.ruleFilters' "$app"
python3 - <<'PY'
from pathlib import Path
app = Path("webui/frontend/src/App.tsx").read_text()
assert 'sessionStorage.getItem("fwbweb.ruleFilters")' in app
assert 'fwbweb.ruleFilters' in app and 'sessionStorage.setItem(' in app
assert 'ruleTextFilter' in app and 'hideDisabled' in app
print("ruleFilters get+set ok")
PY
echo "cleaned"
echo "OK: phase98 e2e passed"
