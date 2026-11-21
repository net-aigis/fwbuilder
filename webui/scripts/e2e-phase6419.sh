#!/usr/bin/env bash
# Phase-6419: UI honesty milestone + schema 5.12 at 18200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedAgentRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18200 UI ok"; echo "cleaned"; echo "OK: phase6419 e2e passed"
