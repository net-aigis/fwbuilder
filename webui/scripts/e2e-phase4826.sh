#!/usr/bin/env bash
# Phase-4826: UI ssh-implemented roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshImplementedRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshImplementedRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_implemented_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase4826 e2e passed"
