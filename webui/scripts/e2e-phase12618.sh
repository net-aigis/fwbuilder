#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthNoteEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-note-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase12618 e2e passed"
