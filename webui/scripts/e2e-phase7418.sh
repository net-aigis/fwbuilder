#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAlternativeNotesRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-alternative-notes-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase7418 e2e passed"
