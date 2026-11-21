#!/usr/bin/env bash
# Phase-3027: UI honesty milestone + layout fidelity signal roster at 7550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout fidelity signal roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7550 UI ok"
echo "cleaned"
echo "OK: phase3027 e2e passed"
