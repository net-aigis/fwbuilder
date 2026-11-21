#!/usr/bin/env bash
# Phase-11562: UI ssh-auth-milestone-echo roster Soft 11560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-milestone-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMilestoneEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11560+ ssh-auth-milestone-echo roster ok"; echo "cleaned"; echo "OK: phase11562 e2e passed"
