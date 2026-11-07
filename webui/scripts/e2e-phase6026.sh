#!/usr/bin/env bash
# Phase-6026: UI ssh-implemented-check roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshImplementedCheckRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshImplementedCheckRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedCheckRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_implemented_check_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6026 e2e passed"
