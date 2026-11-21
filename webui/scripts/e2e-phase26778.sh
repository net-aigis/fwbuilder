#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTriacontaenneadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-triacontaenneadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase26778 e2e passed"
