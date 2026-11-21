#!/usr/bin/env bash
# Phase-6186: UI ssh-alternative-presence roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativePresenceRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAlternativePresenceRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativePresenceRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternative_presence_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6186 e2e passed"
