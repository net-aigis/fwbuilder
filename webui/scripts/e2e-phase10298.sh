#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthKeySurfaceRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-key-surface roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10298 e2e passed"
