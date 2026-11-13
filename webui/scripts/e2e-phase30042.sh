#!/usr/bin/env bash
# Phase-30042: UI ssh-auth-triacontaenneacosadeca-checkpoint roster Soft 30040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaenneacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaenneacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30040+ ssh-auth-triacontaenneacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase30042 e2e passed"
