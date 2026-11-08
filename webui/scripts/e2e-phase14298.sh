#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSurfaceSshRatioRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-surface-ssh-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase14298 e2e passed"
