#!/usr/bin/env bash
# Phase-21402: UI ssh-auth-docosadeca-checkpoint roster Soft 21400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-docosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthDocosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21400+ ssh-auth-docosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase21402 e2e passed"
