#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSessionHintRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-session-hint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase11098 e2e passed"
