#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTriacontahenadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-triacontahenadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase24218 e2e passed"
