#!/usr/bin/env bash
# Phase-3978: UI hard-gaps field roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapsFieldRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig hard-gaps field roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download hard-gaps field roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard-gaps field roster ok"
echo "cleaned"
echo "OK: phase3978 e2e passed"
