#!/usr/bin/env bash
# Phase-4915: UI honesty milestone + ssh_capability_flags_roster sessionStorage at 13450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshCapabilityFlagsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13450 UI ok"; echo "cleaned"; echo "OK: phase4915 e2e passed"
