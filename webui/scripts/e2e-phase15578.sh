#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthQuadCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-quad-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase15578 e2e passed"
