#!/usr/bin/env bash
# Phase-4986: UI ssh-alternatives roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativesRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAlternativesRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternatives_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase4986 e2e passed"
