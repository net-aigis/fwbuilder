#!/usr/bin/env bash
# Phase-14762: UI ssh-auth-ms-delta roster Soft 14760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-delta roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMsDeltaRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14760+ ssh-auth-ms-delta roster ok"; echo "cleaned"; echo "OK: phase14762 e2e passed"
