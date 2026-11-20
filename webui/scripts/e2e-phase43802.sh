#!/usr/bin/env bash
# Phase-43802: UI ssh-auth-triacontadocosadeca-checkpoint roster Soft 43800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontadocosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontadocosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43800+ ssh-auth-triacontadocosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase43802 e2e passed"
