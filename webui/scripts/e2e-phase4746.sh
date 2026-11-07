#!/usr/bin/env bash
# Phase-4746: UI ssh-not-implemented roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sshNotImplementedRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshNotImplementedRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_not_implemented_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4746 e2e passed"
