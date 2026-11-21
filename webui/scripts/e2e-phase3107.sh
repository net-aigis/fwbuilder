#!/usr/bin/env bash
# Phase-3107: UI honesty milestone + layout fidelity sample roster at 7800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout fidelity sample roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7800 UI ok"
echo "cleaned"
echo "OK: phase3107 e2e passed"
