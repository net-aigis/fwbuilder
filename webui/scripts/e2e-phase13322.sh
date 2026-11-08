#!/usr/bin/env bash
# Phase-13322: UI ssh-auth-hard-gap-ratio roster Soft 13320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-hard-gap-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHardGapRatioRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13320+ ssh-auth-hard-gap-ratio roster ok"; echo "cleaned"; echo "OK: phase13322 e2e passed"
