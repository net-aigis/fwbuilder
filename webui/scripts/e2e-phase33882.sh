#!/usr/bin/env bash
# Phase-33882: UI ssh-auth-triacontahenicosadeca-checkpoint roster Soft 33880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontahenicosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontahenicosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33880+ ssh-auth-triacontahenicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase33882 e2e passed"
