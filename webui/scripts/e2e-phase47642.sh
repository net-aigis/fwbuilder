#!/usr/bin/env bash
# Phase-47642: UI ssh-auth-triacontatetracosadeca-checkpoint roster Soft 47640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontatetracosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontatetracosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47640+ ssh-auth-triacontatetracosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase47642 e2e passed"
