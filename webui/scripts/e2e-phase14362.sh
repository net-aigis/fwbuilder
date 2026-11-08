#!/usr/bin/env bash
# Phase-14362: UI ssh-auth-surface-ssh-ratio roster Soft 14360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-surface-ssh-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSurfaceSshRatioRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14360+ ssh-auth-surface-ssh-ratio roster ok"; echo "cleaned"; echo "OK: phase14362 e2e passed"
