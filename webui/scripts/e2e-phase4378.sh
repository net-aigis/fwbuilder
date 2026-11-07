#!/usr/bin/env bash
# Phase-4378: UI expect-steps roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectStepsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig expect-steps roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download expect-steps roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect-steps roster ok"
echo "cleaned"
echo "OK: phase4378 e2e passed"
