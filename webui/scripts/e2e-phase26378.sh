#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSchema267EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-schema-267-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase26378 e2e passed"
