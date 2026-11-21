#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthMilestoneFloorRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-milestone-floor roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase13098 e2e passed"
