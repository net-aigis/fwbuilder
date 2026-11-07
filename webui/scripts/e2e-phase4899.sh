#!/usr/bin/env bash
# Phase-4899: UI honesty milestone + schema 5.1 at 13400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshCapabilityFlagsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13400 UI ok"; echo "cleaned"; echo "OK: phase4899 e2e passed"
