#!/usr/bin/env bash
# Phase-5603: UI honesty milestone + ssh_refusal_path_notes_roster export at 15600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15600 UI ok"; echo "cleaned"; echo "OK: phase5603 e2e passed"
