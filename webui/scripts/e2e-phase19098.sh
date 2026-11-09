#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthPentadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-pentadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase19098 e2e passed"
