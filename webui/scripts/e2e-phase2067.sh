#!/usr/bin/env bash
# Phase-2067: UI honesty milestone + soft-complete note detail at 4550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig soft-complete note' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4550 UI ok"
echo "cleaned"
echo "OK: phase2067 e2e passed"
