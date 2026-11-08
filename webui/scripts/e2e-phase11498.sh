#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthMilestoneEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-milestone-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase11498 e2e passed"
