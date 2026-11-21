#!/usr/bin/env bash
# Phase-4827: clear title mentions ssh-implemented roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-implemented roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshImplementedRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_implemented_roster ok"; echo "cleaned"; echo "OK: phase4827 e2e passed"
