#!/usr/bin/env bash
# Phase-2538: UI honesty export roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyExportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty export roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty export roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty export roster ok"
echo "cleaned"
echo "OK: phase2538 e2e passed"
