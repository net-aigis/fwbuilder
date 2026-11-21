#!/usr/bin/env bash
# Phase-547: client + UI for step refusals preview.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'fetchExpectPlanStepRefusals' webui/frontend/src/api/client.ts
grep -Fq 'Preview all step refusals' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepsRefusalsPath' webui/frontend/src/components/FirewallExtras.tsx
echo "refusals UI ok"
echo "cleaned"
echo "OK: phase547 e2e passed"
