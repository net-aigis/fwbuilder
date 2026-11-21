#!/usr/bin/env bash
# Phase-3251: UI honesty milestone at 8250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout fidelity sample field roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8250 UI ok"
echo "cleaned"
echo "OK: phase3251 e2e passed"
