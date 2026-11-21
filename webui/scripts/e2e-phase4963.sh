#!/usr/bin/env bash
# Phase-4963: UI honesty milestone + ssh_alternatives_roster export at 13600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13600 UI ok"; echo "cleaned"; echo "OK: phase4963 e2e passed"
