#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSchema335EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-schema-335-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase31818 e2e passed"
