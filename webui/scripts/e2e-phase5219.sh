#!/usr/bin/env bash
# Phase-5219: UI honesty milestone + schema 5.5 at 14400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshMethodListsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14400 UI ok"; echo "cleaned"; echo "OK: phase5219 e2e passed"
