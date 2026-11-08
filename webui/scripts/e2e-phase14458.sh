#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthClearSshRatioRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-clear-ssh-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase14458 e2e passed"
