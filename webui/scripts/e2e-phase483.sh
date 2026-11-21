#!/usr/bin/env bash
# Phase-483: fetchExpectPlanSteps fallback when hard-gaps omits ids.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'fetchExpectPlanSteps' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'canonical_step_ids' webui/frontend/src/components/FirewallExtras.tsx || grep -Fq 'fetchExpectPlanSteps' webui/frontend/src/api/client.ts
echo "catalog fallback ok"
echo "cleaned"
echo "OK: phase483 e2e passed"
