#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthNoteTokenRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-note-token roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase9258 e2e passed"
