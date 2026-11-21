#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthPentacosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-pentacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase22298 e2e passed"
