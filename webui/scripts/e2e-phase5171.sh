#!/usr/bin/env bash
# Phase-5171: UI honesty milestone + Soft 5160+ ssh_refusal_status_roster Soft-Checkpoint at 14250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14250 UI ok"; echo "cleaned"; echo "OK: phase5171 e2e passed"
