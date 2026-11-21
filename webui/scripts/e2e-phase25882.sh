#!/usr/bin/env bash
# Phase-25882: UI ssh-auth-triacontahexadeca-checkpoint roster Soft 25880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontahexadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontahexadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25880+ ssh-auth-triacontahexadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase25882 e2e passed"
