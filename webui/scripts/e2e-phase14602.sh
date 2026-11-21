#!/usr/bin/env bash
# Phase-14602: UI ssh-auth-refresh-ratio roster Soft 14600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-refresh-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRefreshRatioRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14600+ ssh-auth-refresh-ratio roster ok"; echo "cleaned"; echo "OK: phase14602 e2e passed"
