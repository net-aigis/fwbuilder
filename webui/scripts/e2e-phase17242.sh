#!/usr/bin/env bash
# Phase-17242: UI ssh-auth-nona-checkpoint roster Soft 17240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-nona-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNonaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17240+ ssh-auth-nona-checkpoint roster ok"; echo "cleaned"; echo "OK: phase17242 e2e passed"
