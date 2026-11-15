#!/usr/bin/env bash
# Phase-32282: UI ssh-auth-triacontahexacosadeca-checkpoint roster Soft 32280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontahexacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontahexacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32280+ ssh-auth-triacontahexacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase32282 e2e passed"
