#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthOctadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-octadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase20058 e2e passed"
