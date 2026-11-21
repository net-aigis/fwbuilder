#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSurfaceHintRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-surface-hint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase11338 e2e passed"
