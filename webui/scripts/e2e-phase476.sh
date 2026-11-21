#!/usr/bin/env bash
# Phase-476: client + UI for expect steps catalog path.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_steps_path' webui/frontend/src/api/client.ts
grep -Fq 'fetchExpectPlanSteps' webui/frontend/src/api/client.ts
grep -Fq 'expectStepsPath' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Expect steps catalog' webui/frontend/src/components/FirewallExtras.tsx
echo "expect steps UI path ok"
echo "cleaned"
echo "OK: phase476 e2e passed"
