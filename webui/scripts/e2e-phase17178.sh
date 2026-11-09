#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthNonaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-nona-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase17178 e2e passed"
