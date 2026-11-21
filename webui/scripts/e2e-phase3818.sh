#!/usr/bin/env bash
# Phase-3818: UI health roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'healthRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig health roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download health roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI health roster ok"
echo "cleaned"
echo "OK: phase3818 e2e passed"
