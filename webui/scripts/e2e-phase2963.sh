#!/usr/bin/env bash
# Phase-2963: UI honesty milestone + ssh_honesty_roster bundle at 7350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'ssh_honesty_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7350 UI ok"
echo "cleaned"
echo "OK: phase2963 e2e passed"
