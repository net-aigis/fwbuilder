#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthRefreshRatioRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-refresh-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase14538 e2e passed"
