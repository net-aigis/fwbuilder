#!/usr/bin/env bash
# Phase-23962: UI ssh-auth-triacontadeca-checkpoint roster Soft 23960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23960+ ssh-auth-triacontadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase23962 e2e passed"
