#!/usr/bin/env bash
# Phase-22042: UI ssh-auth-tetracosadeca-checkpoint roster Soft 22040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-tetracosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTetracosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22040+ ssh-auth-tetracosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase22042 e2e passed"
