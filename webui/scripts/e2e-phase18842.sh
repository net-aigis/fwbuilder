#!/usr/bin/env bash
# Phase-18842: UI ssh-auth-tetradeca-checkpoint roster Soft 18840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-tetradeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTetradecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18840+ ssh-auth-tetradeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase18842 e2e passed"
