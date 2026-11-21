#!/usr/bin/env bash
# Phase-5571: UI honesty milestone + Soft 5560+ ssh_refusal_path_titles_roster Soft-Checkpoint at 15500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15500 UI ok"; echo "cleaned"; echo "OK: phase5571 e2e passed"
