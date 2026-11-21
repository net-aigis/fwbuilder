#!/usr/bin/env bash
# Phase-6267: clear title mentions ssh-implemented-batch roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshImplementedBatchRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_implemented_batch_roster ok"; echo "cleaned"; echo "OK: phase6267 e2e passed"
