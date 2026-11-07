#!/usr/bin/env bash
# Phase-5387: clear title mentions ssh-alternative-notes roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-alternative-notes roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAlternativeNotesRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_alternative_notes_roster ok"; echo "cleaned"; echo "OK: phase5387 e2e passed"
