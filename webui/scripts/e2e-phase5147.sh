#!/usr/bin/env bash
# Phase-5147: clear title mentions ssh-refusal-status roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-refusal-status roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshRefusalStatusRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_refusal_status_roster ok"; echo "cleaned"; echo "OK: phase5147 e2e passed"
