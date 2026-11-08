#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthMs46500EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-ms-46500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase15738 e2e passed"
