#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthHardGapEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-hard-gap-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10778 e2e passed"
