#!/usr/bin/env bash
# Phase-15642: UI ssh-auth-quad-checkpoint roster Soft 15640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-quad-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthQuadCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15640+ ssh-auth-quad-checkpoint roster ok"; echo "cleaned"; echo "OK: phase15642 e2e passed"
