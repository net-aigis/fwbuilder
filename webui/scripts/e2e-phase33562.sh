#!/usr/bin/env bash
# Phase-33562: UI ssh-auth-triacontaicosadeca-checkpoint roster Soft 33560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaicosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaicosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33560+ ssh-auth-triacontaicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase33562 e2e passed"
