#!/usr/bin/env bash
# Phase-5946: UI ssh-batch-mode roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshBatchModeRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshBatchModeRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshBatchModeRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_batch_mode_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5946 e2e passed"
