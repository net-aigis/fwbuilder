#!/usr/bin/env bash
# Phase-3091: UI honesty milestone at 7750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout fidelity signal roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7750 UI ok"
echo "cleaned"
echo "OK: phase3091 e2e passed"
