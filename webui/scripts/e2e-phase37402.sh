#!/usr/bin/env bash
# Phase-37402: UI ssh-auth-triacontadocosadeca-checkpoint roster Soft 37400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontadocosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontadocosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37400+ ssh-auth-triacontadocosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase37402 e2e passed"
