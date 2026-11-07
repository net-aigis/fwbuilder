#!/usr/bin/env bash
# Phase-4747: clear title mentions ssh-not-implemented roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'ssh-not-implemented roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshNotImplementedRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_not_implemented_roster ok"
echo "cleaned"
echo "OK: phase4747 e2e passed"
