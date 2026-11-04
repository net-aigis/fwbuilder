#!/usr/bin/env bash
# Phase-2714: UI honesty bundle includes surface_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surface_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_surface_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface_roster bundle section ok"
echo "cleaned"
echo "OK: phase2714 e2e passed"
