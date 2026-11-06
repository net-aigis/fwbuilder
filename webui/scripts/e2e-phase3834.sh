#!/usr/bin/env bash
# Phase-3834: UI honesty bundle includes health_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'health_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_health_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI health_roster bundle section ok"
echo "cleaned"
echo "OK: phase3834 e2e passed"
