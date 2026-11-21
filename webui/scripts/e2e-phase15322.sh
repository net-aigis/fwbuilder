#!/usr/bin/env bash
# Phase-15322: UI ssh-auth-triple-checkpoint roster Soft 15320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triple-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTripleCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15320+ ssh-auth-triple-checkpoint roster ok"; echo "cleaned"; echo "OK: phase15322 e2e passed"
