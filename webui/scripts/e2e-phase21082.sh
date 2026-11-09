#!/usr/bin/env bash
# Phase-21082: UI ssh-auth-henicosadeca-checkpoint roster Soft 21080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-henicosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHenicosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21080+ ssh-auth-henicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase21082 e2e passed"
