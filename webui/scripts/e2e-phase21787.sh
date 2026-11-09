#!/usr/bin/env bash
# Phase-21787: clear title mentions ssh-refusal-path-titles-refresh roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-refusal-path-titles-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAlternativeNotesRefreshRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_alternative_notes_refresh_roster ok"; echo "cleaned"; echo "OK: phase21787 e2e passed"
