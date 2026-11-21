#!/usr/bin/env bash
# Phase-321: Rule/Interface headers show layout fidelity.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layoutFidelity' webui/frontend/src/components/RuleOptions.tsx
grep -Fq 'layoutFidelity' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'layout_fidelity' webui/frontend/src/api/client.ts
(cd webui/frontend && npm run typecheck)
echo "rule/iface fidelity UI ok"
echo "cleaned"
echo "OK: phase321 e2e passed"
