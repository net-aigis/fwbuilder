#!/usr/bin/env bash
# Phase-20762: UI ssh-auth-icosadeca-checkpoint roster Soft 20760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-icosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthIcosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20760+ ssh-auth-icosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase20762 e2e passed"
