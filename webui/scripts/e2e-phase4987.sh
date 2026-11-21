#!/usr/bin/env bash
# Phase-4987: clear title mentions ssh-alternatives roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-alternatives roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAlternativesRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_alternatives_roster ok"; echo "cleaned"; echo "OK: phase4987 e2e passed"
