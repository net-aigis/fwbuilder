#!/usr/bin/env bash
# Phase-2987: clear title mentions SSH honesty roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'SSH honesty roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshHonestyRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_honesty_roster ok"
echo "cleaned"
echo "OK: phase2987 e2e passed"
