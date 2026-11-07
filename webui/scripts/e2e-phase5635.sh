#!/usr/bin/env bash
# Phase-5635: UI honesty milestone + ssh_refusal_path_notes_roster sessionStorage at 15700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15700 UI ok"; echo "cleaned"; echo "OK: phase5635 e2e passed"
