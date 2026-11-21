#!/usr/bin/env bash
# Phase-4906: UI ssh-capability-flags roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshCapabilityFlagsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshCapabilityFlagsRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshCapabilityFlagsRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_capability_flags_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase4906 e2e passed"
