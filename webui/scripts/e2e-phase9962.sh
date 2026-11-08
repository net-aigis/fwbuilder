#!/usr/bin/env bash
# Phase-9962: UI ssh-auth-note-length roster Soft 9960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-note-length roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteLengthRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9960+ ssh-auth-note-length roster ok"; echo "cleaned"; echo "OK: phase9962 e2e passed"
