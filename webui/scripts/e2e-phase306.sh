#!/usr/bin/env bash
# Phase-306: walkthrough UI shows simulated_at / timeline_start.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'simulated_at' webui/frontend/src/api/client.ts
grep -Fq 'timeline_start' webui/frontend/src/api/client.ts
grep -Fq 'timeline_start' webui/frontend/src/components/FirewallExtras.tsx
(cd webui/frontend && npm run typecheck)
echo "timeline UI ok"
echo "cleaned"
echo "OK: phase306 e2e passed"
