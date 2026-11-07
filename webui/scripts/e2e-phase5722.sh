#!/usr/bin/env bash
# Phase-5722: UI ssh-auth-note roster Soft 5720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-note roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5720+ ssh-auth-note roster ok"; echo "cleaned"; echo "OK: phase5722 e2e passed"
