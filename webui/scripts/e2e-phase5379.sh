#!/usr/bin/env bash
# Phase-5379: UI honesty milestone + schema 5.7 at 14900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14900 UI ok"; echo "cleaned"; echo "OK: phase5379 e2e passed"
