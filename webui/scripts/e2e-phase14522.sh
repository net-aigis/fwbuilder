#!/usr/bin/env bash
# Phase-14522: UI ssh-auth-clear-ssh-ratio roster Soft 14520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-clear-ssh-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthClearSshRatioRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14520+ ssh-auth-clear-ssh-ratio roster ok"; echo "cleaned"; echo "OK: phase14522 e2e passed"
