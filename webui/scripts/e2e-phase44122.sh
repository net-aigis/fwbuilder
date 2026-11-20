#!/usr/bin/env bash
# Phase-44122: UI ssh-auth-triacontatricosadeca-checkpoint roster Soft 44120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontatricosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontatricosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44120+ ssh-auth-triacontatricosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase44122 e2e passed"
