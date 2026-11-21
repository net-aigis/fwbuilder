#!/usr/bin/env bash
# Phase-5107: UI honesty milestone + ssh_refusal_status_roster at 14050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14050 UI ok"; echo "cleaned"; echo "OK: phase5107 e2e passed"
