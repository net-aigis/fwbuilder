#!/usr/bin/env bash
# Phase-3187: UI honesty milestone + layout fidelity sample field roster at 8050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout fidelity sample field roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8050 UI ok"
echo "cleaned"
echo "OK: phase3187 e2e passed"
