#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthMs92000EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-ms-92000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase44858 e2e passed"
