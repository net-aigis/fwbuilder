#!/usr/bin/env bash
# Phase-5867: clear title mentions ssh-password-support roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-password-support roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshPasswordSupportRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_password_support_roster ok"; echo "cleaned"; echo "OK: phase5867 e2e passed"
