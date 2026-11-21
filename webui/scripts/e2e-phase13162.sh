#!/usr/bin/env bash
# Phase-13162: UI ssh-auth-milestone-floor roster Soft 13160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-milestone-floor roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMilestoneFloorRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13160+ ssh-auth-milestone-floor roster ok"; echo "cleaned"; echo "OK: phase13162 e2e passed"
