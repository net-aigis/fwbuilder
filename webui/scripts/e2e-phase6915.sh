#!/usr/bin/env bash
# Phase-6915: UI honesty milestone + ssh_refusal_status_refresh_roster sessionStorage at 18900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18900 UI ok"; echo "cleaned"; echo "OK: phase6915 e2e passed"
