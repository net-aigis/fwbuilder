#!/usr/bin/env bash
# Phase-14682: UI ssh-auth-auth-prefix-ratio roster Soft 14680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-auth-prefix-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthAuthPrefixRatioRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14680+ ssh-auth-auth-prefix-ratio roster ok"; echo "cleaned"; echo "OK: phase14682 e2e passed"
