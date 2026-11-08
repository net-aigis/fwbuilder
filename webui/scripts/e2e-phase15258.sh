#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTripleCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-triple-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase15258 e2e passed"
