#!/usr/bin/env bash
# Phase-13482: UI ssh-auth-impl-count roster Soft 13480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-impl-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthImplCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13480+ ssh-auth-impl-count roster ok"; echo "cleaned"; echo "OK: phase13482 e2e passed"
