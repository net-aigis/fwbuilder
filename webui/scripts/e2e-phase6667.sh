#!/usr/bin/env bash
# Phase-6667: clear title mentions ssh-implemented-identity roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-implemented-identity roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshImplementedIdentityRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_implemented_identity_roster ok"; echo "cleaned"; echo "OK: phase6667 e2e passed"
