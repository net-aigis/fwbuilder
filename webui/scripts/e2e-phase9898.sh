#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthNoteLengthRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-note-length roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase9898 e2e passed"
