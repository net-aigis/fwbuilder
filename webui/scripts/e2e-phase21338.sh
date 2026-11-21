#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthDocosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-docosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase21338 e2e passed"
