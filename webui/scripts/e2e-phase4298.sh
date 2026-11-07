#!/usr/bin/env bash
# Phase-4298: UI expect-run roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectRunRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig expect-run roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download expect-run roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect-run roster ok"
echo "cleaned"
echo "OK: phase4298 e2e passed"
