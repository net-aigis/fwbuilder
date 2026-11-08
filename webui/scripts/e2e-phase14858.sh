#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthHardGapStableRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-hard-gap-stable roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase14858 e2e passed"
