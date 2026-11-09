#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthHenicosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-henicosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase21018 e2e passed"
