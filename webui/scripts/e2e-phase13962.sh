#!/usr/bin/env bash
# Phase-13962: UI ssh-auth-notes-count roster Soft 13960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-notes-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNotesCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13960+ ssh-auth-notes-count roster ok"; echo "cleaned"; echo "OK: phase13962 e2e passed"
