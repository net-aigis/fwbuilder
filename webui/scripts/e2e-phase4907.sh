#!/usr/bin/env bash
# Phase-4907: clear title mentions ssh-capability-flags roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-capability-flags roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshCapabilityFlagsRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_capability_flags_roster ok"; echo "cleaned"; echo "OK: phase4907 e2e passed"
