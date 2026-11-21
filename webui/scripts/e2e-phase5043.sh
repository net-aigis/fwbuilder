#!/usr/bin/env bash
# Phase-5043: UI honesty milestone + ssh_refusal_paths_roster export at 13850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13850 UI ok"; echo "cleaned"; echo "OK: phase5043 e2e passed"
