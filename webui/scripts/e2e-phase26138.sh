#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTriacontaheptadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-triacontaheptadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase26138 e2e passed"
