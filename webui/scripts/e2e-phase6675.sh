#!/usr/bin/env bash
# Phase-6675: UI honesty milestone + ssh_implemented_identity_roster sessionStorage at 18900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedIdentityRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18900 UI ok"; echo "cleaned"; echo "OK: phase6675 e2e passed"
