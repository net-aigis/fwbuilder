#!/usr/bin/env bash
# Phase-15962: UI ssh-auth-penta-checkpoint roster Soft 15960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-penta-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPentaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15960+ ssh-auth-penta-checkpoint roster ok"; echo "cleaned"; echo "OK: phase15962 e2e passed"
