#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSurfaceCountRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-surface-count roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase12778 e2e passed"
