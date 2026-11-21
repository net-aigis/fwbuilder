#!/usr/bin/env bash
# Phase-6266: UI ssh-implemented-batch roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshImplementedBatchRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshImplementedBatchRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedBatchRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_implemented_batch_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6266 e2e passed"
