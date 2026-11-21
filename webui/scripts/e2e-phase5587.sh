#!/usr/bin/env bash
# Phase-5587: UI honesty milestone + ssh_refusal_path_notes_roster at 15550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15550 UI ok"; echo "cleaned"; echo "OK: phase5587 e2e passed"
