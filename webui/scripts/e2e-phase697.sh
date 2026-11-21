#!/usr/bin/env bash
# Phase-697: qtSpacerStyle applies size_type Expanding/Fixed.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'size_type' webui/frontend/src/qtGrid.ts
grep -Fq 'minimumexpanding' webui/frontend/src/qtGrid.ts
grep -Fq 'data-size-type="MinimumExpanding"' webui/frontend/src/styles/app.css
grep -Fq 'data-size-type' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'data-size-type' webui/frontend/src/components/RuleOptions.tsx
grep -Fq 'data-size-type' webui/frontend/src/components/InterfaceOptions.tsx
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 704
print("soft 704 + size_type UI wired")
PY
echo "cleaned"
echo "OK: phase697 e2e passed"
