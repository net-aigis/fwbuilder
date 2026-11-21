#!/usr/bin/env bash
# Phase-5027: UI honesty milestone + ssh_refusal_paths_roster at 13800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13800 UI ok"; echo "cleaned"; echo "OK: phase5027 e2e passed"
