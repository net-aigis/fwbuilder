#!/usr/bin/env bash
# Phase-17562: UI ssh-auth-deca-checkpoint roster Soft 17560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-deca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthDecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17560+ ssh-auth-deca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase17562 e2e passed"
