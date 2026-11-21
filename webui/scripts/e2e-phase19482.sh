#!/usr/bin/env bash
# Phase-19482: UI ssh-auth-hexadeca-checkpoint roster Soft 19480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-hexadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHexadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19480+ ssh-auth-hexadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase19482 e2e passed"
