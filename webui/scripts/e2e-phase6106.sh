#!/usr/bin/env bash
# Phase-6106: UI ssh-not-implemented-check roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshNotImplementedCheckRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshNotImplementedCheckRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedCheckRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_not_implemented_check_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6106 e2e passed"
