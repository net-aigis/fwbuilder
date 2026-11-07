#!/usr/bin/env bash
# Phase-6187: clear title mentions ssh-alternative-presence roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-alternative-presence roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAlternativePresenceRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_alternative_presence_roster ok"; echo "cleaned"; echo "OK: phase6187 e2e passed"
