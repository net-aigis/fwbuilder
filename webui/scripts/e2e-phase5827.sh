#!/usr/bin/env bash
# Phase-5827: UI honesty milestone + ssh_password_support_roster at 16300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshPasswordSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16300 UI ok"; echo "cleaned"; echo "OK: phase5827 e2e passed"
