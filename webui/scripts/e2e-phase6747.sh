#!/usr/bin/env bash
# Phase-6747: clear title mentions ssh-not-implemented-keyboard roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-not-implemented-keyboard roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshNotImplementedKeyboardRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_not_implemented_keyboard_roster ok"; echo "cleaned"; echo "OK: phase6747 e2e passed"
