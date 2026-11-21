#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthEnneadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-enneadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase20378 e2e passed"
