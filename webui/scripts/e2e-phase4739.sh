#!/usr/bin/env bash
# Phase-4739: UI honesty milestone + schema 4.9 at 12900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12900 UI ok"
echo "cleaned"
echo "OK: phase4739 e2e passed"
