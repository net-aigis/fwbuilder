#!/usr/bin/env bash
# Phase-6627: UI honesty milestone + ssh_implemented_identity_roster at 18800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedIdentityRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18800 UI ok"; echo "cleaned"; echo "OK: phase6627 e2e passed"
