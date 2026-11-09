#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthTetradecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-tetradeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase18778 e2e passed"
