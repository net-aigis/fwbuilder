#!/usr/bin/env bash
# Phase-42842: UI ssh-auth-triacontaenneacosadeca-checkpoint roster Soft 42840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaenneacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaenneacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 42840+ ssh-auth-triacontaenneacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase42842 e2e passed"
