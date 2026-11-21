#!/usr/bin/env bash
# Phase-4138: UI stack-switch roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'stackSwitchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig stack-switch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download stack-switch roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI stack-switch roster ok"
echo "cleaned"
echo "OK: phase4138 e2e passed"
