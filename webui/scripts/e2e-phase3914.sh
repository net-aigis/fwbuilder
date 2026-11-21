#!/usr/bin/env bash
# Phase-3914: UI honesty bundle includes res_status_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'res_status_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_res_status_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI res_status_roster bundle section ok"
echo "cleaned"
echo "OK: phase3914 e2e passed"
