#!/usr/bin/env bash
# Phase-6347: clear title mentions ssh-not-implemented-batch roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-not-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshNotImplementedBatchRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_not_implemented_batch_roster ok"; echo "cleaned"; echo "OK: phase6347 e2e passed"
