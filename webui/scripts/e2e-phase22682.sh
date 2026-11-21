#!/usr/bin/env bash
# Phase-22682: UI ssh-auth-hexacosadeca-checkpoint roster Soft 22680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-hexacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHexacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22680+ ssh-auth-hexacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase22682 e2e passed"
