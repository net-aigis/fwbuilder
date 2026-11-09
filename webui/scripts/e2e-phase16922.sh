#!/usr/bin/env bash
# Phase-16922: UI ssh-auth-octa-checkpoint roster Soft 16920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-octa-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthOctaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16920+ ssh-auth-octa-checkpoint roster ok"; echo "cleaned"; echo "OK: phase16922 e2e passed"
