#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthDodecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-dodeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase18138 e2e passed"
