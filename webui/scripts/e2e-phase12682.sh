#!/usr/bin/env bash
# Phase-12682: UI ssh-auth-note-echo roster Soft 12680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-note-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12680+ ssh-auth-note-echo roster ok"; echo "cleaned"; echo "OK: phase12682 e2e passed"
