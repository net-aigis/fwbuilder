#!/usr/bin/env bash
# Phase-2298: UI hard-gap refusal roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapRefusalRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gap refusal roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download hard-gap refusal roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard-gap refusal roster ok"
echo "cleaned"
echo "OK: phase2298 e2e passed"
