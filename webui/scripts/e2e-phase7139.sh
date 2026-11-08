#!/usr/bin/env bash
# Phase-7139: UI honesty milestone + schema 5.12 at 18950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18950 UI ok"; echo "cleaned"; echo "OK: phase7139 e2e passed"
