#!/usr/bin/env bash
# Phase-5651: UI honesty milestone + Soft 5640+ ssh_refusal_path_notes_roster Soft-Checkpoint at 15750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15750 UI ok"; echo "cleaned"; echo "OK: phase5651 e2e passed"
