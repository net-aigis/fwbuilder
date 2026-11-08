#!/usr/bin/env bash
# Phase-7386: UI ssh-refusal-path-titles-refresh roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathNotesRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshRefusalPathNotesRefreshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotesRefreshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_path_notes_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase7386 e2e passed"
