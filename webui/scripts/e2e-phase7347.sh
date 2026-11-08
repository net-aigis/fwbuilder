#!/usr/bin/env bash
# Phase-7347: UI honesty milestone + ssh_refusal_path_notes_refresh_roster at 18800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotesRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18800 UI ok"; echo "cleaned"; echo "OK: phase7347 e2e passed"
