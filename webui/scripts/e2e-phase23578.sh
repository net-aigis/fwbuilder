#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthEnneacosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-enneacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase23578 e2e passed"
