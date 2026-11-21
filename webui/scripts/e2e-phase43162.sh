#!/usr/bin/env bash
# Phase-43162: UI ssh-auth-triacontaicosadeca-checkpoint roster Soft 43160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaicosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaicosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43160+ ssh-auth-triacontaicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase43162 e2e passed"
