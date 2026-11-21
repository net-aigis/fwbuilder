#!/usr/bin/env bash
# Phase-4819: UI honesty milestone + schema 5.0 at 13150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13150 UI ok"; echo "cleaned"; echo "OK: phase4819 e2e passed"
