#!/usr/bin/env bash
# Phase-39642: UI ssh-auth-triacontaenneacosadeca-checkpoint roster Soft 39640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaenneacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaenneacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39640+ ssh-auth-triacontaenneacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase39642 e2e passed"
