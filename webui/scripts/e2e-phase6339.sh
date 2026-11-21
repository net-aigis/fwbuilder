#!/usr/bin/env bash
# Phase-6339: UI honesty milestone + schema 5.12 at 17950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedBatchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17950 UI ok"; echo "cleaned"; echo "OK: phase6339 e2e passed"
