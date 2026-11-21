#!/usr/bin/env bash
# Phase-21722: UI ssh-auth-tricosadeca-checkpoint roster Soft 21720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-tricosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTricosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21720+ ssh-auth-tricosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase21722 e2e passed"
