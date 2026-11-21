#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTricosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-tricosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase21658 e2e passed"
