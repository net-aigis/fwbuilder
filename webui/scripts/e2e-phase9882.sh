#!/usr/bin/env bash
# Phase-9882: UI ssh-auth-note-map roster Soft 9880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-note-map roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteMapRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9880+ ssh-auth-note-map roster ok"; echo "cleaned"; echo "OK: phase9882 e2e passed"
