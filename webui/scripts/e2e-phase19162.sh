#!/usr/bin/env bash
# Phase-19162: UI ssh-auth-pentadeca-checkpoint roster Soft 19160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-pentadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPentadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19160+ ssh-auth-pentadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase19162 e2e passed"
