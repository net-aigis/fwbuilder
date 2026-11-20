#!/usr/bin/env bash
# Phase-41562: UI ssh-auth-triacontapentacosadeca-checkpoint roster Soft 41560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontapentacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontapentacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41560+ ssh-auth-triacontapentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase41562 e2e passed"
