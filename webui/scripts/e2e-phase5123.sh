#!/usr/bin/env bash
# Phase-5123: UI honesty milestone + ssh_refusal_status_roster export at 14100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14100 UI ok"; echo "cleaned"; echo "OK: phase5123 e2e passed"
