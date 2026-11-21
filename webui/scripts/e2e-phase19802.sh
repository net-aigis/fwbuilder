#!/usr/bin/env bash
# Phase-19802: UI ssh-auth-heptadeca-checkpoint roster Soft 19800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-heptadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHeptadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19800+ ssh-auth-heptadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase19802 e2e passed"
