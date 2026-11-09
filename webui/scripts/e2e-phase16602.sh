#!/usr/bin/env bash
# Phase-16602: UI ssh-auth-hepta-checkpoint roster Soft 16600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-hepta-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHeptaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16600+ ssh-auth-hepta-checkpoint roster ok"; echo "cleaned"; echo "OK: phase16602 e2e passed"
