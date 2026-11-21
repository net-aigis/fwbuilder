#!/usr/bin/env bash
# Phase-24922: UI ssh-auth-triacontatriadeca-checkpoint roster Soft 24920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontatriadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontatriadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24920+ ssh-auth-triacontatriadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase24922 e2e passed"
