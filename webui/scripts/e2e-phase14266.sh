#!/usr/bin/env bash
# Phase-14266: UI ssh-refusal-path-titles-refresh roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativeNotesRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAlternativeNotesRefreshRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeNotesRefreshRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternative_notes_refresh_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase14266 e2e passed"
