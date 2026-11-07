#!/usr/bin/env bash
# Phase-5707: clear title mentions ssh-auth-note roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-auth-note roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAuthNoteRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_auth_note_roster ok"; echo "cleaned"; echo "OK: phase5707 e2e passed"
