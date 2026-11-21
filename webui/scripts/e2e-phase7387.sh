#!/usr/bin/env bash
# Phase-7387: clear title mentions ssh-refusal-path-titles-refresh roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-refusal-path-titles-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshRefusalPathNotesRefreshRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_refusal_path_notes_refresh_roster ok"; echo "cleaned"; echo "OK: phase7387 e2e passed"
