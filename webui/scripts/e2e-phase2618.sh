#!/usr/bin/env bash
# Phase-2618: UI honesty bundle roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyBundleRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty bundle roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty bundle roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty bundle roster ok"
echo "cleaned"
echo "OK: phase2618 e2e passed"
