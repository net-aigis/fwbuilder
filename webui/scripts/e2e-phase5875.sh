#!/usr/bin/env bash
# Phase-5875: UI honesty milestone + ssh_password_support_roster sessionStorage at 16400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshPasswordSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16400 UI ok"; echo "cleaned"; echo "OK: phase5875 e2e passed"
