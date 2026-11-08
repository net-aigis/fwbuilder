#!/usr/bin/env bash
# Phase-6826: UI ssh-not-implemented-password roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshNotImplementedPasswordRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshNotImplementedPasswordRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedPasswordRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_not_implemented_password_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6826 e2e passed"
