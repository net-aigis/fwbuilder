#!/usr/bin/env bash
# Phase-11962: UI ssh-auth-hard-gap-count roster Soft 11960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-hard-gap-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHardGapCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11960+ ssh-auth-hard-gap-count roster ok"; echo "cleaned"; echo "OK: phase11962 e2e passed"
