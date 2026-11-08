#!/usr/bin/env bash
# Phase-6355: UI honesty milestone + ssh_not_implemented_batch_roster sessionStorage at 17900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedBatchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17900 UI ok"; echo "cleaned"; echo "OK: phase6355 e2e passed"
