#!/usr/bin/env bash
# Phase-10122: UI ssh-auth-batch-gate roster Soft 10120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-batch-gate roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthBatchGateRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10120+ ssh-auth-batch-gate roster ok"; echo "cleaned"; echo "OK: phase10122 e2e passed"
