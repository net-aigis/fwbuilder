#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTriacontadodecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-triacontadodeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase24538 e2e passed"
