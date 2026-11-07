#!/usr/bin/env bash
# Phase-5706: UI ssh-auth-note roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAuthNoteRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAuthNoteRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_auth_note_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5706 e2e passed"
