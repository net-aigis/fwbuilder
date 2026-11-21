#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTriacontaoctadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-triacontaoctadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase26458 e2e passed"
