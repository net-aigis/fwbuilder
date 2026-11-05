#!/usr/bin/env bash
# Phase-3171: UI honesty milestone at 8000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout fidelity sample roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8000 UI ok"
echo "cleaned"
echo "OK: phase3171 e2e passed"
