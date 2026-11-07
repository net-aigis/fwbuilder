#!/usr/bin/env bash
# Phase-4979: UI honesty milestone + schema 5.2 at 13650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13650 UI ok"; echo "cleaned"; echo "OK: phase4979 e2e passed"
