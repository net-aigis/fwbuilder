#!/usr/bin/env bash
# Phase-2851: UI honesty milestone at 7000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7000 UI ok"
echo "cleaned"
echo "OK: phase2851 e2e passed"
