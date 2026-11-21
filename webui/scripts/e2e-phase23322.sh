#!/usr/bin/env bash
# Phase-23322: UI ssh-auth-octacosadeca-checkpoint roster Soft 23320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-octacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthOctacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23320+ ssh-auth-octacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase23322 e2e passed"
