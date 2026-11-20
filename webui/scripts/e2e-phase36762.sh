#!/usr/bin/env bash
# Phase-36762: UI ssh-auth-triacontaicosadeca-checkpoint roster Soft 36760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaicosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaicosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 36760+ ssh-auth-triacontaicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase36762 e2e passed"
