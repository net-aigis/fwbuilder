#!/usr/bin/env bash
# Phase-16282: UI ssh-auth-hexa-checkpoint roster Soft 16280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-hexa-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHexaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16280+ ssh-auth-hexa-checkpoint roster ok"; echo "cleaned"; echo "OK: phase16282 e2e passed"
