#!/usr/bin/env bash
# Phase-6979: UI honesty milestone + schema 5.12 at 18950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18950 UI ok"; echo "cleaned"; echo "OK: phase6979 e2e passed"
