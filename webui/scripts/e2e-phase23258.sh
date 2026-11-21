#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthOctacosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-octacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase23258 e2e passed"
