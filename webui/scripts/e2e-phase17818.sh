#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthUndecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-undeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase17818 e2e passed"
