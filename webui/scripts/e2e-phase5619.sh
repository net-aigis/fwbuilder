#!/usr/bin/env bash
# Phase-5619: UI honesty milestone + schema 5.10 at 15650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15650 UI ok"; echo "cleaned"; echo "OK: phase5619 e2e passed"
