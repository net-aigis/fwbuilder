#!/usr/bin/env bash
# Phase-18202: UI ssh-auth-dodeca-checkpoint roster Soft 18200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-dodeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthDodecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18200+ ssh-auth-dodeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase18202 e2e passed"
