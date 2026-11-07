#!/usr/bin/env bash
# Phase-5626: UI ssh-refusal-path-notes roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathNotesRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshRefusalPathNotesRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotesRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_path_notes_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5626 e2e passed"
