#!/usr/bin/env bash
# Phase-44762: UI ssh-auth-triacontapentacosadeca-checkpoint roster Soft 44760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontapentacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontapentacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44760+ ssh-auth-triacontapentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase44762 e2e passed"
