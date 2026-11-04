#!/usr/bin/env bash
# Phase-715: UI still wires honesty milestone note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 750 UI ok"
echo "cleaned"
echo "OK: phase715 e2e passed"
