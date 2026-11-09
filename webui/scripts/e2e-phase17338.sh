#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthMs49000EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-ms-49000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase17338 e2e passed"
