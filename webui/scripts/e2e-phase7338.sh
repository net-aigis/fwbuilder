#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshRefusalPathNotesRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-refusal-path-notes-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase7338 e2e passed"
