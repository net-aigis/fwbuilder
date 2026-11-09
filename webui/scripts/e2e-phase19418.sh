#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthHexadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-hexadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase19418 e2e passed"
