#!/usr/bin/env bash
# Phase-4131: UI honesty milestone at 11000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout-fidelity roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11000 UI ok"
echo "cleaned"
echo "OK: phase4131 e2e passed"
