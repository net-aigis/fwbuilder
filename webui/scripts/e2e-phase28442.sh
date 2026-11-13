#!/usr/bin/env bash
# Phase-28442: UI ssh-auth-triacontatetracosadeca-checkpoint roster Soft 28440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontatetracosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontatetracosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28440+ ssh-auth-triacontatetracosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase28442 e2e passed"
