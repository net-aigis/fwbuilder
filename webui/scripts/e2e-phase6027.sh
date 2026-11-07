#!/usr/bin/env bash
# Phase-6027: clear title mentions ssh-implemented-check roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-implemented-check roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshImplementedCheckRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_implemented_check_roster ok"; echo "cleaned"; echo "OK: phase6027 e2e passed"
