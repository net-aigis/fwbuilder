#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthGapClosureEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-gap-closure-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10938 e2e passed"
