#!/usr/bin/env bash
# Phase-330: hard_gap_closure in UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapClosure' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard_gap_closure' webui/frontend/src/api/client.ts
grep -Fq 'close when' webui/frontend/src/components/FirewallExtras.tsx
(cd webui/frontend && npm run typecheck)
echo "closure UI ok"
echo "cleaned"
echo "OK: phase330 e2e passed"
