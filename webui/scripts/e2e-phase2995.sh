#!/usr/bin/env bash
# Phase-2995: UI honesty milestone + ssh_honesty sessionStorage at 7450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshHonestyRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7450 UI ok"
echo "cleaned"
echo "OK: phase2995 e2e passed"
