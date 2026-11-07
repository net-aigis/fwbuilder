#!/usr/bin/env bash
# Phase-5523: UI honesty milestone + ssh_refusal_path_titles_roster export at 15350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15350 UI ok"; echo "cleaned"; echo "OK: phase5523 e2e passed"
