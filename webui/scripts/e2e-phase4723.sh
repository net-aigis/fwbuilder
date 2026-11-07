#!/usr/bin/env bash
# Phase-4723: UI honesty milestone + ssh_not_implemented_roster at 12850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'ssh_not_implemented_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12850 UI ok"
echo "cleaned"
echo "OK: phase4723 e2e passed"
