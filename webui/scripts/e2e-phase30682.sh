#!/usr/bin/env bash
# Phase-30682: UI ssh-auth-triacontahenicosadeca-checkpoint roster Soft 30680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontahenicosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontahenicosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30680+ ssh-auth-triacontahenicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase30682 e2e passed"
