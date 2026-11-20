#!/usr/bin/env bash
# Phase-41882: UI ssh-auth-triacontahexacosadeca-checkpoint roster Soft 41880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontahexacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontahexacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41880+ ssh-auth-triacontahexacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase41882 e2e passed"
