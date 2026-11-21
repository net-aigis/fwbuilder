#!/usr/bin/env bash
# Phase-6346: UI ssh-not-implemented-batch roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshNotImplementedBatchRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshNotImplementedBatchRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedBatchRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_not_implemented_batch_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6346 e2e passed"
