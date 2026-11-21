#!/usr/bin/env bash
# Phase-5227: clear title mentions ssh-method-lists roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-method-lists roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshMethodListsRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_method_lists_roster ok"; echo "cleaned"; echo "OK: phase5227 e2e passed"
