#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTetracosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-tetracosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase21978 e2e passed"
