#!/usr/bin/env bash
# Phase-259: row_stretch wired into qtGridStyle + option pages.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'rowsFromStretch' webui/frontend/src/qtGrid.ts
grep -Fq 'row_stretch' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'row_stretch' webui/frontend/src/components/RuleOptions.tsx
grep -Fq 'row_stretch' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'row_stretch' webui/frontend/src/api/client.ts
(cd webui/frontend && npm run typecheck)
echo "row_stretch wiring ok"
echo "cleaned"
echo "OK: phase259 e2e passed"
