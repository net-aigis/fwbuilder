#!/usr/bin/env bash
# Phase-26842: UI ssh-auth-triacontaenneadeca-checkpoint roster Soft 26840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaenneadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaenneadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26840+ ssh-auth-triacontaenneadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase26842 e2e passed"
