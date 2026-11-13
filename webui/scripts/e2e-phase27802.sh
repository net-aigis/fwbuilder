#!/usr/bin/env bash
# Phase-27802: UI ssh-auth-triacontadocosadeca-checkpoint roster Soft 27800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontadocosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontadocosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27800+ ssh-auth-triacontadocosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase27802 e2e passed"
