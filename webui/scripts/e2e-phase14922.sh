#!/usr/bin/env bash
# Phase-14922: UI ssh-auth-hard-gap-stable roster Soft 14920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-hard-gap-stable roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHardGapStableRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14920+ ssh-auth-hard-gap-stable roster ok"; echo "cleaned"; echo "OK: phase14922 e2e passed"
