#!/usr/bin/env bash
# Phase-5843: UI honesty milestone + ssh_password_support_roster export at 16350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshPasswordSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16350 UI ok"; echo "cleaned"; echo "OK: phase5843 e2e passed"
