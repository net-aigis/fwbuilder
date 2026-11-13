#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTriacontaenneacosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-triacontaenneacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase29978 e2e passed"
