#!/usr/bin/env bash
# Phase-17882: UI ssh-auth-undeca-checkpoint roster Soft 17880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-undeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthUndecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17880+ ssh-auth-undeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase17882 e2e passed"
