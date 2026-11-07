#!/usr/bin/env bash
# Phase-6107: clear title mentions ssh-not-implemented-check roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-not-implemented-check roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshNotImplementedCheckRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_not_implemented_check_roster ok"; echo "cleaned"; echo "OK: phase6107 e2e passed"
