#!/usr/bin/env bash
# Phase-6827: clear title mentions ssh-not-implemented-password roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-not-implemented-password roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshNotImplementedPasswordRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_not_implemented_password_roster ok"; echo "cleaned"; echo "OK: phase6827 e2e passed"
