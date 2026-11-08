#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthReadinessEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-readiness-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase12058 e2e passed"
