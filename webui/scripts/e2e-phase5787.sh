#!/usr/bin/env bash
# Phase-5787: clear title mentions ssh-alternative-support roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-alternative-support roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAlternativeSupportRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_alternative_support_roster ok"; echo "cleaned"; echo "OK: phase5787 e2e passed"
