#!/usr/bin/env bash
# Phase-298: layout fidelity client + header display.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'fetchLayoutFidelity' webui/frontend/src/api/client.ts
grep -Fq 'layoutFidelity' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fidelity' webui/frontend/src/components/FirewallExtras.tsx
(cd webui/frontend && npm run typecheck)
echo "fidelity UI ok"
echo "cleaned"
echo "OK: phase298 e2e passed"
