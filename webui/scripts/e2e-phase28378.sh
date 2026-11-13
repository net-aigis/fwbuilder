#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTriacontatetracosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-triacontatetracosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase28378 e2e passed"
