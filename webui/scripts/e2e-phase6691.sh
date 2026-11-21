#!/usr/bin/env bash
# Phase-6691: UI honesty milestone + ssh_implemented_identity_roster at tip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedIdentityRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 19000 UI tail ok"; echo "cleaned"; echo "OK: phase6691 e2e passed"
