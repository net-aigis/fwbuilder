#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthHardGapCountRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-hard-gap-count roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase11898 e2e passed"
