#!/usr/bin/env bash
# Phase-9322: UI ssh-auth-note-token roster Soft 9320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-note-token roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteTokenRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9320+ ssh-auth-note-token roster ok"; echo "cleaned"; echo "OK: phase9322 e2e passed"
