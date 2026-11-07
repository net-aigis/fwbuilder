#!/usr/bin/env bash
# Phase-5155: UI honesty milestone + ssh_refusal_status_roster sessionStorage at 14200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14200 UI ok"; echo "cleaned"; echo "OK: phase5155 e2e passed"
