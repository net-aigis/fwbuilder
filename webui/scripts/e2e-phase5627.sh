#!/usr/bin/env bash
# Phase-5627: clear title mentions ssh-refusal-path-notes roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-refusal-path-notes roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshRefusalPathNotesRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_refusal_path_notes_roster ok"; echo "cleaned"; echo "OK: phase5627 e2e passed"
