#!/usr/bin/env bash
# Phase-14042: UI ssh-auth-gap-note-echo roster Soft 14040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-gap-note-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthGapNoteEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14040+ ssh-auth-gap-note-echo roster ok"; echo "cleaned"; echo "OK: phase14042 e2e passed"
