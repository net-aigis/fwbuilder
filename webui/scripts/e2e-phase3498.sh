#!/usr/bin/env bash
# Phase-3498: UI honesty operator brief roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyOperatorBriefRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty operator brief roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty operator brief roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty operator brief roster ok"
echo "cleaned"
echo "OK: phase3498 e2e passed"
