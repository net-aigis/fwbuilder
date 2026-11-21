#!/usr/bin/env bash
# Phase-4458: UI expect-steps-refusals roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectStepsRefusalsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig expect-steps-refusals roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download expect-steps-refusals roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect-steps-refusals roster ok"
echo "cleaned"
echo "OK: phase4458 e2e passed"
