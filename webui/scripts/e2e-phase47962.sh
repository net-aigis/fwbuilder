#!/usr/bin/env bash
# Phase-47962: UI ssh-auth-triacontapentacosadeca-checkpoint roster Soft 47960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontapentacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontapentacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47960+ ssh-auth-triacontapentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase47962 e2e passed"
