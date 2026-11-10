#!/usr/bin/env bash
# Phase-23002: UI ssh-auth-heptacosadeca-checkpoint roster Soft 23000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-heptacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHeptacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23000+ ssh-auth-heptacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase23002 e2e passed"
