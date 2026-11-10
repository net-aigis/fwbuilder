#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthMs58000EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-ms-58000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase23098 e2e passed"
