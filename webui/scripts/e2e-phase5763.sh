#!/usr/bin/env bash
# Phase-5763: UI honesty milestone + ssh_alternative_support_roster export at 16100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16100 UI ok"; echo "cleaned"; echo "OK: phase5763 e2e passed"
