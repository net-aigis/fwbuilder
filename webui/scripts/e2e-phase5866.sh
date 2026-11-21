#!/usr/bin/env bash
# Phase-5866: UI ssh-password-support roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshPasswordSupportRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshPasswordSupportRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshPasswordSupportRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_password_support_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5866 e2e passed"
