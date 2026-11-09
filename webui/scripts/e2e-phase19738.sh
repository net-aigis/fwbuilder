#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthHeptadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-heptadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase19738 e2e passed"
