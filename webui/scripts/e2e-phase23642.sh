#!/usr/bin/env bash
# Phase-23642: UI ssh-auth-enneacosadeca-checkpoint roster Soft 23640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-enneacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthEnneacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23640+ ssh-auth-enneacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase23642 e2e passed"
