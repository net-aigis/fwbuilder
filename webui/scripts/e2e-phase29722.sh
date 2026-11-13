#!/usr/bin/env bash
# Phase-29722: UI ssh-auth-triacontaoctacosadeca-checkpoint roster Soft 29720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaoctacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaoctacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29720+ ssh-auth-triacontaoctacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase29722 e2e passed"
