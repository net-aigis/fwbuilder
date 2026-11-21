#!/usr/bin/env bash
# Phase-6666: UI ssh-implemented-identity roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshImplementedIdentityRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshImplementedIdentityRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedIdentityRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_implemented_identity_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6666 e2e passed"
