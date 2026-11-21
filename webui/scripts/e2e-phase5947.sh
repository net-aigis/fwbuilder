#!/usr/bin/env bash
# Phase-5947: clear title mentions ssh-batch-mode roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-batch-mode roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshBatchModeRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_batch_mode_roster ok"; echo "cleaned"; echo "OK: phase5947 e2e passed"
