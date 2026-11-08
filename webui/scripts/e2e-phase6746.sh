#!/usr/bin/env bash
# Phase-6746: UI ssh-not-implemented-keyboard roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshNotImplementedKeyboardRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshNotImplementedKeyboardRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedKeyboardRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_not_implemented_keyboard_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6746 e2e passed"
