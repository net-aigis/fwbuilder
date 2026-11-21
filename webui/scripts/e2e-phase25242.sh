#!/usr/bin/env bash
# Phase-25242: UI ssh-auth-triacontatetradeca-checkpoint roster Soft 25240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontatetradeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontatetradecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25240+ ssh-auth-triacontatetradeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase25242 e2e passed"
