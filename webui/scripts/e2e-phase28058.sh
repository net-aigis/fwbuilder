#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTriacontatricosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-triacontatricosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase28058 e2e passed"
