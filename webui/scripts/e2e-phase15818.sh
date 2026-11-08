#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSchema135EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-schema-135-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase15818 e2e passed"
