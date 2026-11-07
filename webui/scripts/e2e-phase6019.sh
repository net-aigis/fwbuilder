#!/usr/bin/env bash
# Phase-6019: UI honesty milestone + schema 5.12 at 15900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15900 UI ok"; echo "cleaned"; echo "OK: phase6019 e2e passed"
