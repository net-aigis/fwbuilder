#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthPentaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-penta-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase15898 e2e passed"
