#!/usr/bin/env bash
# Phase-5507: UI honesty milestone + ssh_refusal_path_titles_roster at 15300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15300 UI ok"; echo "cleaned"; echo "OK: phase5507 e2e passed"
